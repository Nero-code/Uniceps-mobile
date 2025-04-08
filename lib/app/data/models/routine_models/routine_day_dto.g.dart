// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_day_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutineDayDto _$RoutineDayDtoFromJson(Map<String, dynamic> json) =>
    RoutineDayDto(
      id: (json['id'] as num?)?.toInt(),
      apiId: (json['apiId'] as num?)?.toInt(),
      routineId: (json['routineId'] as num).toInt(),
      version: (json['version'] as num).toInt(),
      name: json['name'] as String,
      index: (json['index'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => RoutineItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      isSynced: json['isSynced'] as bool,
    );

Map<String, dynamic> _$RoutineDayDtoToJson(RoutineDayDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'apiId': instance.apiId,
      'index': instance.index,
      'routineId': instance.routineId,
      'version': instance.version,
      'name': instance.name,
      'isSynced': instance.isSynced,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
