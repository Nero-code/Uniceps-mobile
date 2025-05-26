import 'package:drift/drift.dart';
import 'package:uniceps/app/data/models/practice_models/t_log_model.dart';
import 'package:uniceps/app/data/models/practice_models/t_session_model.dart';
import 'package:uniceps/app/data/sources/local/database.dart' as db;

abstract class ITSessionLocalSourceContract {
  Future<TSessionModel?> getPreviousSession();

  Future<TSessionModel> startTrainingSession();
  Future<TLogModel> logSet(TLogModel log);
  Future<void> finishTrainingSession(TSessionModel session);
}

class TSessionLocalSource implements ITSessionLocalSourceContract {
  const TSessionLocalSource({required db.AppDatabase database})
      : _database = database;

  final db.AppDatabase _database;

  @override
  Future<TSessionModel?> getPreviousSession() async {
    final old = await (_database.select(_database.tSessions)
          ..where((f) => f.finishedAt.isNotNull()))
        .get();

    if (old.isNotEmpty) return TSessionModel.fromTable(old.first);

    return null;
  }

  @override
  Future<TSessionModel> startTrainingSession() async {
    final session = await _database.into(_database.tSessions).insertReturning(
        db.TSessionsCompanion.insert(startedAt: DateTime.now()));

    return TSessionModel.fromTable(session);
  }

  @override
  Future<TLogModel> logSet(TLogModel log) async {
    if (log.id == null) {
      final newLog = await _database
          .into(_database.tLogs)
          .insertReturning(db.TLogsCompanion.insert(
            exerciseId: log.exerciseId,
            exerciseIndex: log.exerciseId,
            setIndex: log.setIndex,
            reps: log.reps,
            weight: log.weight,
            completedAt: log.completedAt,
            sessionId: log.sessionId,
          ));
      return TLogModel.fromTable(newLog);
    } else {
      final updatedLog = await (_database.update(_database.tLogs)
            ..where((f) => f.logId.equals(log.id!)))
          .writeReturning(db.TLogsCompanion.custom(
        weight: Constant(log.weight),
        version: Constant(log.version + 1),
        isSynced: const Constant(false),
      ));
      return TLogModel.fromTable(updatedLog.first);
    }
  }

  @override
  Future<void> finishTrainingSession(TSessionModel session) async {
    await (_database.update(_database.tSessions)
          ..where((f) => f.tsId.equals(session.id!)))
        .write(
      db.TSessionsCompanion.custom(
        finishedAt: Constant(DateTime.now()),
        version: Constant(session.version + 1),
        isSynced: const Constant(false),
      ),
    );
  }
}
