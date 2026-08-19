import 'package:uniceps/app/data/services/sync/diet_logs_sync_service.dart';
import 'package:uniceps/app/data/services/sync/ingredients_library_sync_service.dart';
import 'package:uniceps/app/data/services/sync/measurements_sync_service.dart';
import 'package:uniceps/app/data/services/sync/t_session_sync_service.dart';
import 'package:uniceps/app/services/device_info_sync_service.dart';
import 'package:uniceps/core/logging/app_logger.dart';

class SyncOrchestrator {
  final IngredientsLibrarySyncService _ingredientsSync;
  final DietLogsSyncService _dietLogsSync;
  final TSessionSyncService _tSessionSync;
  final DeviceInfoSyncService _deviceInfoSync;
  final MeasurementsSyncService _measurementsSync;

  SyncOrchestrator({
    required IngredientsLibrarySyncService ingredientsSync,
    required DietLogsSyncService dietLogsSync,
    required TSessionSyncService tSessionSync,
    required DeviceInfoSyncService deviceInfoSync,
    required MeasurementsSyncService measurementsSync,
  }) : _ingredientsSync = ingredientsSync,
       _dietLogsSync = dietLogsSync,
       _tSessionSync = tSessionSync,
       _deviceInfoSync = deviceInfoSync,
       _measurementsSync = measurementsSync;

  /// Syncs device information. Should be called when user is authenticated.
  Future<void> syncDeviceInfo() async {
    try {
      logger.d('Syncing Device Info...');
      await _deviceInfoSync.checkStatusThenSync();
    } catch (e) {
      logger.e('Device info sync failed', error: e);
    }
  }

  /// Syncs the ingredients library and diet logs. Should be called for members.
  Future<void> syncDietData() async {
    try {
      logger.i('--- Starting Diet Data Sync ---');

      // 1. Ingredients Library (Critical Dependency)
      logger.d('Syncing Ingredients Library...');
      await _ingredientsSync.syncLib();

      // 2. Diet Logs
      logger.d('Syncing Diet Logs...');
      await _dietLogsSync.syncDietLogs();

      logger.i('--- Diet Data Sync Finished ---');
    } catch (e, s) {
      logger.e('Diet data sync failed', error: e, stackTrace: s);
    }
  }

  /// Syncs training sessions and measurements. Should be called when user is authenticated.
  Future<void> syncUserActivity() async {
    try {
      logger.d('Syncing User Activity (Training and Measurements)...');
      await Future.wait([
        _syncTrainingSessions(),
        _measurementsSync.syncMeasurements(),
      ]);
    } catch (e) {
      logger.e('User activity sync failed', error: e);
    }
  }

  Future<void> _syncTrainingSessions() async {
    try {
      _tSessionSync.init();
    } catch (e) {
      logger.e('Training session sync failed', error: e);
    }
  }

  /// Stops all background sync processes.
  void dispose() {
    logger.d('Disposing Sync Orchestrator...');
    _tSessionSync.dispose();
  }
}
