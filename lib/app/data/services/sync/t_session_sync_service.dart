import 'dart:async';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uniceps/app/data/models/practice_models/t_session_model.dart';
import 'package:uniceps/app/data/services/internet_client/client_helper.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/core/constants/api_routes.dart';
import 'package:uniceps/core/logging/app_logger.dart';

class TSessionSyncService {
  static const tSessionsSyncFlag = 'TSessionsSyncFlag';

  final AppDatabase _database;
  final ClientHelper _client;
  final SharedPreferences _preferences;

  TSessionSyncService({
    required AppDatabase database,
    required ClientHelper client,
    required SharedPreferences preferences,
  }) : _preferences = preferences,
       _database = database,
       _client = client;

  /// Main entry point for syncing training sessions.
  Future<void> syncSessions() async {
    try {
      final unsyncedSessions = await _readUnsynced();
      if (unsyncedSessions.isEmpty) {
        logger.t('TSessionSync: No sessions to sync.');
        return;
      }

      logger.i('TSessionSync: Starting sync for ${unsyncedSessions.length} sessions.');

      for (final session in unsyncedSessions) {
        await _syncSingleSession(session);
      }
    } catch (e, s) {
      logger.e('TSessionSync: Global sync error', error: e, stackTrace: s);
    }
  }

  /// Downloads all training sessions from the server.
  Future<void> downloadSessions() async {
    final previousSync = _preferences.getBool(tSessionsSyncFlag);
    if (previousSync != null) return;

    try {
      logger.i('TSessionSync: Starting download for all sessions.');
      final remoteSessions = await _retry(() async {
        return await _client.getListHandler(ApiRoutes.domain, ApiRoutes.sessionSync, TSessionModel.fromJson);
      });

      for (final model in remoteSessions) {
        await _upsertSession(model);
      }
      logger.i('TSessionSync: Successfully downloaded ${remoteSessions.length} sessions.');

      await _preferences.setBool(tSessionsSyncFlag, true);
    } on NoContentException {
      logger.t('TSessionSync: No sessions found on server.');
    } catch (e, s) {
      logger.e('TSessionSync: Failed to download sessions', error: e, stackTrace: s);
    }
  }

  Future<void> _upsertSession(TSessionModel model) async {
    if (model.apiId == null) return;

    // Check if session already exists by apiId to avoid duplicates
    final existing = await (_database.select(
      _database.tSessions,
    )..where((t) => t.apiId.equals(model.apiId!))).getSingleOrNull();
    if (existing != null) return;

    await _database.transaction(() async {
      // 1. Insert Session
      final sessionId = await _database
          .into(_database.tSessions)
          .insert(
            TSessionsCompanion.insert(
              dayId: model.dayId,
              dayName: model.dayName,
              startedAt: model.createdAt,
              finishedAt: Value(model.finishedAt),
              progress: Value(model.progress),
              apiId: Value(model.apiId),
              version: Value(model.version),
              isSynced: const Value(true),
            ),
          );

      // 2. Insert logs (No need to clear because session is new)
      for (final log in model.logs) {
        await _database
            .into(_database.tLogs)
            .insert(
              TLogsCompanion.insert(
                exerciseId: log.exerciseId,
                exerciseIndex: log.exerciseIndex,
                setIndex: log.setIndex,
                reps: log.reps,
                finishedReps: log.finishedReps,
                weight: log.weight,
                completedAt: log.completedAt,
                sessionId: sessionId,
                apiId: Value(log.apiId),
                version: Value(log.version),
                isSynced: const Value(true),
              ),
            );
      }
    });
  }

  Future<void> _syncSingleSession(TSessionModel model) async {
    try {
      final apiId = await _retry(() async {
        return await _client.postHandler(
          ApiRoutes.domain,
          ApiRoutes.sessionSync,
          model.toJson(),
          fromJson: (json) => json['id'] as int,
        );
      });

      if (apiId != null) {
        await (_database.update(_database.tSessions)..where((f) => f.tsId.equals(model.id!))).write(
          TSessionsCompanion.custom(apiId: Constant(apiId), isSynced: const Constant(true)),
        );
        logger.t('TSessionSync: Successfully synced session ${model.id}');
      }
    } catch (e) {
      logger.e('TSessionSync: Failed to sync session ${model.id}', error: e);
    }
  }

  Future<List<TSessionModel>> _readUnsynced() async {
    final logA = _database.alias(_database.tLogs, 't');
    final rows =
        await (_database.select(_database.tSessions)..where((f) => f.finishedAt.isNotNull() & f.isSynced.equals(false)))
            .join([leftOuterJoin(logA, logA.sessionId.equalsExp(_database.tSessions.tsId))])
            .get();

    final List<TSession> sessions = [];
    final List<TLog> logs = [];

    for (var row in rows) {
      final s = row.readTable(_database.tSessions);
      if (!sessions.contains(s)) sessions.add(s);
      final l = row.readTableOrNull(logA);
      if (l != null && !logs.contains(l)) logs.add(l);
    }

    return sessions.map((s) {
      final lgs = logs.where((e) => e.sessionId == s.tsId).toList();
      return TSessionModel.fromTable(s, lgs);
    }).toList();
  }

  Future<T> _retry<T>(Future<T> Function() action, {int maxAttempts = 3}) async {
    int attempts = 0;
    while (attempts < maxAttempts) {
      try {
        return await action();
      } on SocketException {
        rethrow; // Don't retry if no internet
      } catch (e) {
        attempts++;
        if (attempts >= maxAttempts) rethrow;
        final delay = Duration(seconds: attempts * 2);
        logger.d('TSessionSync: Retry attempt $attempts after ${delay.inSeconds}s due to error: $e');
        await Future.delayed(delay);
      }
    }
    throw RetryException(attempts);
  }
}
