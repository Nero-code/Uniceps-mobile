// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TSessionModel _$TSessionModelFromJson(Map<String, dynamic> json) =>
    TSessionModel(
      id: (json['id'] as num?)?.toInt(),
      dayId: (json['day_id'] as num).toInt(),
      dayName: json['day_name'] as String,
      logs: (json['logs'] as List<dynamic>)
          .map((e) => TLogModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
      finishedAt: json['finished_at'] == null
          ? null
          : DateTime.parse(json['finished_at'] as String),
      progress: (json['progress'] as num).toDouble(),
      apiId: (json['api_id'] as num?)?.toInt(),
      version: (json['version'] as num).toInt(),
      isSynced: json['is_synced'] as bool,
    );

Map<String, dynamic> _$TSessionModelToJson(TSessionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'day_id': instance.dayId,
      'day_name': instance.dayName,
      'logs': instance.logs.map((e) => e.toJson()).toList(),
      'created_at': instance.createdAt.toIso8601String(),
      'finished_at': instance.finishedAt?.toIso8601String(),
      'progress': instance.progress,
      'api_id': instance.apiId,
      'version': instance.version,
      'is_synced': instance.isSynced,
    };
