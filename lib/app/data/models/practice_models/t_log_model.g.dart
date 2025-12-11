// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TLogModel _$TLogModelFromJson(Map<String, dynamic> json) => TLogModel(
  id: (json['id'] as num?)?.toInt(),
  sessionId: (json['session_id'] as num).toInt(),
  exerciseId: (json['exercise_id'] as num).toInt(),
  exerciseIndex: (json['exercise_index'] as num).toInt(),
  setIndex: (json['set_index'] as num).toInt(),
  reps: (json['reps'] as num).toInt(),
  weight: (json['weight'] as num).toDouble(),
  completedAt: DateTime.parse(json['completed_at'] as String),
  apiId: (json['api_id'] as num?)?.toInt(),
  version: (json['version'] as num?)?.toInt() ?? 0,
  isSynced: json['is_synced'] as bool? ?? false,
);

Map<String, dynamic> _$TLogModelToJson(TLogModel instance) => <String, dynamic>{
  'id': instance.id,
  'session_id': instance.sessionId,
  'exercise_id': instance.exerciseId,
  'exercise_index': instance.exerciseIndex,
  'set_index': instance.setIndex,
  'reps': instance.reps,
  'weight': instance.weight,
  'completed_at': instance.completedAt.toIso8601String(),
  'api_id': instance.apiId,
  'version': instance.version,
  'is_synced': instance.isSynced,
};
