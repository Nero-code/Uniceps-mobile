// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutineDto _$RoutineDtoFromJson(Map<String, dynamic> json) => RoutineDto(
      id: (json['id'] as num?)?.toInt(),
      apiId: (json['apiId'] as num?)?.toInt(),
      version: (json['version'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      trainingDaysDto: (json['trainingDaysDto'] as List<dynamic>)
          .map((e) => RoutineDayDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      isSynced: json['isSynced'] as bool,
      isCurrent: json['isCurrent'] as bool? ?? false,
    );

Map<String, dynamic> _$RoutineDtoToJson(RoutineDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'apiId': instance.apiId,
      'version': instance.version,
      'name': instance.name,
      'description': instance.description,
      'isCurrent': instance.isCurrent,
      'isSynced': instance.isSynced,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'trainingDaysDto':
          instance.trainingDaysDto.map((e) => e.toJson()).toList(),
    };
