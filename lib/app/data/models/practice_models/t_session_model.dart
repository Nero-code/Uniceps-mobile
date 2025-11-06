import 'package:uniceps/app/data/models/practice_models/t_log_model.dart';
import 'package:uniceps/app/data/sources/local/database.dart' as db;
import 'package:uniceps/app/domain/classes/practice_entities/t_session.dart';

class TSessionModel extends TSession {
  const TSessionModel({
    required super.id,
    required super.dayId,
    required super.logs,
    required super.createdAt,
    required super.finishedAt,
    super.progress,
    super.apiId,
    super.version = 0,
    super.isSynced = false,
  });

  factory TSessionModel.fromTable(db.TSession table, List<db.TLog> logs) => TSessionModel(
        id: table.tsId,
        dayId: table.dayId,
        logs: logs.map((log) => TLogModel.fromTable(log)).toList(),
        progress: table.progress,
        createdAt: table.startedAt,
        finishedAt: table.finishedAt,
      );

  TSessionModel copywith({
    int? id,
    int? apiId,
    int? dayId,
    DateTime? createdAt,
    DateTime? finishedAt,
    int? version,
    double? progress,
    List<TLogModel>? logs,
    bool? isSynced,
  }) =>
      TSessionModel(
        id: id ?? this.id,
        dayId: dayId ?? this.dayId,
        logs: logs ?? this.logs,
        apiId: apiId ?? this.apiId,
        createdAt: createdAt ?? this.createdAt,
        finishedAt: finishedAt ?? this.finishedAt,
        version: version ?? this.version,
        progress: progress ?? this.progress,
        isSynced: isSynced ?? this.isSynced,
      );
}
