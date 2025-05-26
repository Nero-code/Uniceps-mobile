import 'package:uniceps/app/domain/classes/practice_entities/t_log.dart';

class TLogModel extends TLog {
  const TLogModel({
    required super.id,
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
}
