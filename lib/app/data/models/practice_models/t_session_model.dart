import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/data/models/practice_models/t_log_model.dart';
import 'package:uniceps/app/data/sources/local/database.dart' as db;
import 'package:uniceps/app/domain/classes/practice_entities/t_session.dart';
import 'package:uniceps/app/data/models/practice_models/extensions.dart';

part 't_session_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class TSessionModel extends TSession {
  final List<TLogModel> logs;
  const TSessionModel({
    required super.id,
    required super.dayId,
    required super.dayName,
    required this.logs,
    required super.createdAt,
    required super.finishedAt,
    required super.progress,
    required super.apiId,
    required super.version,
    required super.isSynced,
  }) : super(logs: logs);

  factory TSessionModel.fromTable(db.TSession table, List<db.TLog> logs) => TSessionModel(
        id: table.tsId,
        apiId: table.apiId,
        dayId: table.dayId,
        dayName: table.dayName,
        logs: logs.map((log) => TLogModel.fromTable(log)).toList(),
        progress: table.progress,
        createdAt: table.startedAt,
        finishedAt: table.finishedAt,
        version: table.version,
        isSynced: table.isSynced,
      );

  factory TSessionModel.fromJson(Map<String, dynamic> json) => _$TSessionModelFromJson(json);
  Map<String, dynamic> toJson() => _$TSessionModelToJson(this);

  factory TSessionModel.fromEntity(TSession e) => TSessionModel(
      id: e.id,
      dayId: e.dayId,
      dayName: e.dayName,
      logs: e.logs.map((l) => l.toDto()).toList(),
      createdAt: e.createdAt,
      finishedAt: e.finishedAt,
      progress: e.progress,
      apiId: e.apiId,
      version: e.version,
      isSynced: e.isSynced);

  TSessionModel copywith({
    int? id,
    int? apiId,
    int? dayId,
    String? dayName,
    DateTime? createdAt,
    DateTime? finishedAt,
    double? progress,
    List<TLogModel>? logs,
    int? version,
    bool? isSynced,
  }) =>
      TSessionModel(
        id: id ?? this.id,
        apiId: apiId ?? this.apiId,
        dayId: dayId ?? this.dayId,
        dayName: dayName ?? this.dayName,
        logs: logs ?? this.logs,
        createdAt: createdAt ?? this.createdAt,
        finishedAt: finishedAt ?? this.finishedAt,
        progress: progress ?? this.progress,
        version: version ?? this.version,
        isSynced: isSynced ?? this.isSynced,
      );
}
