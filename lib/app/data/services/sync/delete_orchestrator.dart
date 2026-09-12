import 'dart:io';

import 'package:uniceps/app/data/services/internet_client/http_client_helper.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/core/constants/api_routes.dart';
import 'package:uniceps/core/logging/app_logger.dart';

class DeleteSyncOrchestrator {
  final AppDatabase _db;
  final HttpClientHelper _client;

  DeleteSyncOrchestrator({required AppDatabase db, required HttpClientHelper client}) : _db = db, _client = client;

  /// Synchronizes all local deletions to the API and then performs a hard delete locally.
  Future<void> syncAll() async {
    await syncDeletedMeasurements();
    await syncDeletedDietLogs();
    await syncDeletedIngredients();
  }

  /// Finds all measurements marked as deleted locally and syncs them with the API.
  Future<void> syncDeletedMeasurements() async {
    try {
      final toDelete = await (_db.select(_db.measurements)..where((t) => t.deleted.equals(true))).get();
      if (toDelete.isEmpty) return;

      logger.d('Syncing ${toDelete.length} deleted measurements to API...');
      for (final m in toDelete) {
        bool success = true;
        if (m.apiId != null) {
          try {
            await _retry(() => _client.deleteHandler(ApiRoutes.domain, '${ApiRoutes.measurements}/${m.apiId}', {}));
          } catch (e) {
            success = false;
            logger.e('Failed to sync deletion for measurement ${m.id} to API', error: e);
          }
        }

        if (success) {
          await (_db.delete(_db.measurements)..where((t) => t.id.equals(m.id))).go();
        }
      }
    } catch (e, s) {
      logger.e('Error during measurement deletion sync', error: e, stackTrace: s);
    }
  }

  /// Finds all diet logs marked as deleted locally and syncs them with the API.
  Future<void> syncDeletedDietLogs() async {
    try {
      final toDelete = await (_db.select(_db.dietLogs)..where((t) => t.deleted.equals(true))).get();
      if (toDelete.isEmpty) return;

      logger.d('Syncing ${toDelete.length} deleted diet logs to API...');
      for (final log in toDelete) {
        bool success = true;
        if (log.apiId != null) {
          try {
            await _retry(() => _client.deleteHandler(ApiRoutes.domain, '${ApiRoutes.dietLogs}/${log.apiId}', {}));
          } catch (e) {
            success = false;
            logger.e('Failed to sync deletion for diet log ${log.id} to API', error: e);
          }
        }

        if (success) {
          await (_db.delete(_db.dietLogs)..where((t) => t.id.equals(log.id))).go();
        }
      }
    } catch (e, s) {
      logger.e('Error during diet log deletion sync', error: e, stackTrace: s);
    }
  }

  /// Finds all ingredients marked as deleted locally and syncs them with the API.
  Future<void> syncDeletedIngredients() async {
    try {
      final toDelete = await (_db.select(_db.ingredients)..where((t) => t.deleted.equals(true))).get();
      if (toDelete.isEmpty) return;

      logger.d('Syncing ${toDelete.length} deleted ingredients to API...');
      for (final ingredient in toDelete) {
        bool success = true;
        if (ingredient.apiId != null) {
          try {
            await _retry(
              () => _client.deleteHandler(ApiRoutes.domain, '${ApiRoutes.ingredients}/${ingredient.apiId}', {}),
            );
          } catch (e) {
            success = false;
            logger.e('Failed to sync deletion for ingredient ${ingredient.id} to API', error: e);
          }
        }

        if (success) {
          await (_db.delete(_db.ingredients)..where((t) => t.id.equals(ingredient.id))).go();
        }
      }
    } catch (e, s) {
      logger.e('Error during ingredient deletion sync', error: e, stackTrace: s);
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
    throw Exception('Exceeded max retries');
  }
}
