// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutineItemDto _$RoutineItemDtoFromJson(Map<String, dynamic> json) =>
    RoutineItemDto(
      id: (json['id'] as num?)?.toInt(),
      apiId: (json['apiId'] as num?)?.toInt(),
      dayId: (json['dayId'] as num).toInt(),
      index: (json['index'] as num).toInt(),
      version: (json['version'] as num).toInt(),
      exerciseV2Dto:
          ExerciseV2Dto.fromJson(json['exerciseV2Dto'] as Map<String, dynamic>),
      setsDto: (json['setsDto'] as List<dynamic>)
          .map((e) => RoutineSetDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      isSynced: json['isSynced'] as bool,
    );

Map<String, dynamic> _$RoutineItemDtoToJson(RoutineItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'apiId': instance.apiId,
      'dayId': instance.dayId,
      'index': instance.index,
      'version': instance.version,
      'isSynced': instance.isSynced,
      'exerciseV2Dto': instance.exerciseV2Dto.toJson(),
      'setsDto': instance.setsDto.map((e) => e.toJson()).toList(),
    };
