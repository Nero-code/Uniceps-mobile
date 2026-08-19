import 'dart:io';

import 'package:http/http.dart';
import 'package:uniceps/app/data/sources/local/dal_measurements/measurements_local_source.dart';
import 'package:uniceps/app/data/sources/remote/dal_profile/measurements_remote_source.dart';
import 'package:uniceps/core/logging/app_logger.dart';

class MeasurementsSyncService {
  final IMeasurementsLocalSource _localSource;
  final IMeasurementsRemoteSource _remoteSource;

  MeasurementsSyncService({
    required IMeasurementsLocalSource localSource,
    required IMeasurementsRemoteSource remoteSource,
  }) : _localSource = localSource,
       _remoteSource = remoteSource;

  Future<void> syncMeasurements() async {
    try {
      logger.i('Starting Measurements Sync...');

      // 1. Upload Unsynced Measurements
      final unsynced = await _localSource.getAllUnSyncedMeasurements();
      for (final m in unsynced) {
        try {
          final apiId = await _retry(() => _remoteSource.uploadMeasurement(m));
          final updated = m.copyWith(apiId: apiId, isSynced: true);
          await _localSource.upsertMeasurement(updated);
        } catch (e) {
          logger.e('Failed to upload measurement: ${m.id}', error: e);
        }
      }

      // 2. Download New Measurements (Delta Sync)
      final lastSync = await _localSource.getLastMeasurementSync();
      final remoteMeasurements = await _retry(() => _remoteSource.getMeasurements(since: lastSync));

      for (final rm in remoteMeasurements) {
        await _localSource.upsertMeasurement(rm.copyWith(isSynced: true));
      }

      logger.i('Measurements Sync Completed Successfully.');
    } on ClientException catch (e) {
      logger.e('Network client error during measurements sync', error: e);
    } on SocketException {
      logger.w('No internet connection for measurements sync');
    } catch (e, s) {
      logger.e('MeasurementsSyncService critical error', error: e, stackTrace: s);
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
    throw Exception('Retry failed');
  }
}
