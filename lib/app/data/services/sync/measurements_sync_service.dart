import 'dart:io';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uniceps/app/data/services/internet_client/client_helper.dart';
import 'package:uniceps/app/data/sources/local/dal_measurements/measurements_local_source.dart';
import 'package:uniceps/app/data/sources/remote/dal_profile/measurements_remote_source.dart';
import 'package:uniceps/core/logging/app_logger.dart';

class MeasurementsSyncService {
  static const measurementsSyncFlag = 'MeasurementsSyncFlag';

  final IMeasurementsLocalSource _localSource;
  final IMeasurementsRemoteSource _remoteSource;
  final SharedPreferences _preferences;

  MeasurementsSyncService({
    required IMeasurementsLocalSource localSource,
    required IMeasurementsRemoteSource remoteSource,
    required SharedPreferences preferences,
  }) : _preferences = preferences,
       _localSource = localSource,
       _remoteSource = remoteSource;

  /// Uploads unsynced local measurements to the server.
  Future<void> uploadMeasurements() async {
    try {
      final unsynced = await _localSource.getAllUnSyncedMeasurements();
      if (unsynced.isEmpty) return;

      logger.d('Uploading ${unsynced.length} unsynced measurements...');
      for (final m in unsynced) {
        try {
          final apiId = await _retry(() => _remoteSource.uploadMeasurement(m));
          final updated = m.copyWith(apiId: apiId, isSynced: true);
          await _localSource.upsertMeasurement(updated);
        } catch (e) {
          logger.e('Failed to upload measurement: ${m.id}', error: e);
        }
      }
    } on NoContentException catch (e) {
      logger.d('MeasurementsSyncService Upload: $e');
    } on RetryException catch (e) {
      logger.d('MeasurementsSyncService Upload: ${e.message}');
    } on ClientException catch (e) {
      logger.e('Network client error during measurements upload', error: e);
    } on SocketException catch (e) {
      logger.w('No internet connection for measurements upload', error: e);
    } catch (e, s) {
      logger.e('MeasurementsSyncService Upload critical error', error: e, stackTrace: s);
    }
  }

  /// Downloads all measurements from the server and updates local database.
  Future<void> downloadMeasurements() async {
    final previousSync = _preferences.getBool(measurementsSyncFlag);
    if (previousSync != null) return;

    try {
      logger.d('Downloading all measurements from server...');
      final remoteMeasurements = await _retry(() => _remoteSource.getMeasurements());

      for (final rm in remoteMeasurements) {
        await _localSource.upsertMeasurement(rm.copyWith(isSynced: true));
      }

      await _preferences.setBool(measurementsSyncFlag, true);
      logger.d('Saved all measurements, and Set flag (true)...');
    } on NoContentException catch (e) {
      logger.d('MeasurementsSyncService Download: $e');
    } on RetryException catch (e) {
      logger.d('MeasurementsSyncService Download: ${e.message}');
    } on ClientException catch (e) {
      logger.d('Network client error during measurements download', error: e);
    } on SocketException catch (e) {
      logger.w('No internet connection for measurements download', error: e);
    } catch (e, s) {
      logger.e('MeasurementsSyncService Download critical error', error: e, stackTrace: s);
    }
  }

  Future<T> _retry<T>(Future<T> Function() action, {int maxAttempts = 3}) async {
    int attempts = 0;
    while (attempts < maxAttempts) {
      try {
        return await action();
      } on SocketException {
        rethrow;
      } catch (e) {
        attempts++;
        if (attempts >= maxAttempts) rethrow;
        final delay = Duration(seconds: attempts * 2);
        logger.d('Retry attempt $attempts after ${delay.inSeconds}s due to error: $e');
        await Future.delayed(delay);
      }
    }
    throw RetryException(attempts);
  }
}
