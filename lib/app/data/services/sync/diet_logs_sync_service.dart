import 'dart:io';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uniceps/app/data/services/internet_client/client_helper.dart';
import 'package:uniceps/app/data/sources/local/dal_diet/diet_local_source.dart';
import 'package:uniceps/app/data/sources/remote/dal_diet/diet_remote_source.dart';
import 'package:uniceps/core/logging/app_logger.dart';

class DietLogsSyncService {
  static const dietLogsSyncFlag = '_dietLogsSyncFlag';
  final IDietLocalSource _localSource;
  final IDietRemoteSource _remoteSource;
  final SharedPreferences _preferences;

  const DietLogsSyncService({
    required IDietLocalSource localSource,
    required IDietRemoteSource remoteSource,
    required SharedPreferences preferences,
  }) : _preferences = preferences,
       _localSource = localSource,
       _remoteSource = remoteSource;

  Future<void> syncDietLogs() async {
    try {
      final logs = await _localSource.getAllUnSyncedLogs();
      for (final log in logs) {
        try {
          final apiId = await _retry(() => _remoteSource.uploadDietLog(log));
          final logDto = log.copyWith(apiId: apiId, isSynced: true);
          await _localSource.upsertDietLog(logDto);
        } catch (e) {
          logger.e('Failed to sync log: ${log.id}', error: e);
          // Continue to next log even if one fails after retries
        }
      }
    } on ClientException catch (e) {
      logger.e('Network client error during sync', error: e);
    } on SocketException catch (e) {
      logger.w('No internet connection for sync', error: e);
    } catch (e, s) {
      logger.e('DietLogsSyncService critical error', error: e, stackTrace: s);
    }
  }

  Future<void> downloadDietLogs() async {
    final previousSync = _preferences.getBool(dietLogsSyncFlag);
    if (previousSync != null) return;

    try {
      final logs = await _retry(() => _remoteSource.downloadDietLogs());
      await _localSource.bulkSaveLogs(logs);
      await _preferences.setBool(dietLogsSyncFlag, true);
    } on ClientException catch (e) {
      logger.e('Network client error during sync', error: e);
    } on SocketException catch (e) {
      logger.w('No internet connection for sync', error: e);
    } on NoContentException {
      return;
    } catch (e, s) {
      logger.e('downloadDietLogs Unknown Error!', error: e, stackTrace: s);
    }
  }

  Future<T> _retry<T>(Future<T> Function() action, {int maxAttempts = 3}) async {
    int attempts = 0;
    while (attempts < maxAttempts) {
      try {
        return await action();
      } on SocketException {
        rethrow; // Don't retry if no internet at all
      } on NoContentException {
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
