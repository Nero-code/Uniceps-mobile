import 'package:uniceps/app/data/models/practice_models/t_log_model.dart';
import 'package:uniceps/app/data/models/practice_models/t_session_model.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_log.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_session.dart';

extension TLogExtension on TLog {
  TLogModel toDto() => TLogModel(
        id: id,
        sessionId: sessionId,
        exerciseId: exerciseId,
        exerciseIndex: exerciseIndex,
        setIndex: setIndex,
        reps: reps,
        weight: weight,
        completedAt: completedAt,
        apiId: apiId,
        version: version,
        isSynced: isSynced,
      );
}

extension TSessionExtension on TSession {
  TSessionModel toDto() => TSessionModel(
        id: id,
        apiId: apiId,
        dayId: dayId,
        dayName: dayName,
        logs: logs.map((e) => e.toDto()).toList(),
        createdAt: createdAt,
        finishedAt: finishedAt,
        progress: progress,
        version: version,
        isSynced: isSynced,
      );
}
