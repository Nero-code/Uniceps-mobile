// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TSessionModel _$TSessionModelFromJson(Map<String, dynamic> json) =>
    TSessionModel(
      id: (json['id'] as num?)?.toInt(),
      dayId: (json['dayId'] as num).toInt(),
      dayName: json['day'] as String,
      logs: (json['logs'] as List<dynamic>)
          .map((e) => TLogModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      finishedAt: json['finishedAt'] == null
          ? null
          : DateTime.parse(json['finishedAt'] as String),
      progress: (json['progress'] as num).toDouble(),
      apiId: (json['apiId'] as num?)?.toInt(),
      version: (json['version'] as num).toInt(),
      isSynced: json['isSynced'] as bool,
    );

Map<String, dynamic> _$TSessionModelToJson(TSessionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dayId': instance.dayId,
      'day': instance.dayName,
      'logs': instance.logs.map((e) => e.toJson()).toList(),
      'createdAt': instance.createdAt.toIso8601String(),
      'finishedAt': instance.finishedAt?.toIso8601String(),
      'progress': instance.progress,
      'apiId': instance.apiId,
      'version': instance.version,
      'isSynced': instance.isSynced,
    };
