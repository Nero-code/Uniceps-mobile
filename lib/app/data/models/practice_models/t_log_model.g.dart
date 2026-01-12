// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TLogModel _$TLogModelFromJson(Map<String, dynamic> json) => TLogModel(
  id: (json['id'] as num?)?.toInt(),
  sessionId: (json['sessionId'] as num).toInt(),
  exerciseId: (json['exerciseId'] as num).toInt(),
  exerciseIndex: (json['exerciseIndex'] as num).toInt(),
  setIndex: (json['setIndex'] as num).toInt(),
  reps: (json['reps'] as num).toInt(),
  weight: (json['weight'] as num).toDouble(),
  completedAt: DateTime.parse(json['completedAt'] as String),
  apiId: (json['apiId'] as num?)?.toInt(),
  version: (json['version'] as num?)?.toInt() ?? 0,
  isSynced: json['isSynced'] as bool? ?? false,
);

Map<String, dynamic> _$TLogModelToJson(TLogModel instance) => <String, dynamic>{
  'id': instance.id,
  'sessionId': instance.sessionId,
  'exerciseId': instance.exerciseId,
  'exerciseIndex': instance.exerciseIndex,
  'setIndex': instance.setIndex,
  'reps': instance.reps,
  'weight': instance.weight,
  'completedAt': instance.completedAt.toIso8601String(),
  'apiId': instance.apiId,
  'version': instance.version,
  'isSynced': instance.isSynced,
};
