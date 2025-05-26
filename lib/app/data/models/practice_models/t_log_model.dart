import 'package:uniceps/app/data/sources/local/database.dart' as db;
import 'package:uniceps/app/domain/classes/practice_entities/t_log.dart';

class TLogModel extends TLog {
  const TLogModel({
    required super.id,
    required super.sessionId,
    required super.exerciseId,
    required super.exerciseIndex,
    required super.setIndex,
    required super.reps,
    required super.weight,
    required super.completedAt,
    super.apiId,
    super.version = 0,
    super.isSynced = false,
  });

  factory TLogModel.fromTable(db.TLog table) => TLogModel(
        id: table.logId,
        sessionId: table.sessionId,
        exerciseId: table.exerciseId,
        exerciseIndex: table.exerciseIndex,
        setIndex: table.setIndex,
        reps: table.reps,
        weight: table.weight,
        completedAt: table.completedAt,
      );
}
