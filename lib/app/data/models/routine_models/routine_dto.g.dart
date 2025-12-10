// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutineDto _$RoutineDtoFromJson(Map<String, dynamic> json) => RoutineDto(
  id: (json['Id'] as num?)?.toInt(),
  apiId: (json['ApiId'] as num?)?.toInt(),
  version: (json['Version'] as num?)?.toInt() ?? 0,
  name: json['RoutineName'] as String,
  description: json['Description'] as String?,
  isCurrent: json['IsCurrent'] as bool? ?? false,
  createdAt: json['CreatedAt'] == null
      ? null
      : DateTime.parse(json['CreatedAt'] as String),
  updatedAt: json['UpdatedAt'] == null
      ? null
      : DateTime.parse(json['UpdatedAt'] as String),
  daysDto: (json['Days'] as List<dynamic>)
      .map((e) => RoutineDayDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  isSynced: json['IsSynced'] as bool? ?? false,
);

Map<String, dynamic> _$RoutineDtoToJson(RoutineDto instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'ApiId': instance.apiId,
      'Version': instance.version,
      'RoutineName': instance.name,
      'Description': instance.description,
      'IsCurrent': instance.isCurrent,
      'IsSynced': instance.isSynced,
      'CreatedAt': instance.createdAt?.toIso8601String(),
      'UpdatedAt': instance.updatedAt?.toIso8601String(),
      'Days': instance.daysDto.map((e) => e.toJson()).toList(),
    };
