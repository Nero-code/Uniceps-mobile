// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_set_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutineSetDto _$RoutineSetDtoFromJson(Map<String, dynamic> json) =>
    RoutineSetDto(
      id: (json['id'] as num?)?.toInt(),
      apiId: (json['apiId'] as num?)?.toInt(),
      routineItemId: (json['routineItemId'] as num).toInt(),
      version: (json['version'] as num).toInt(),
      index: (json['index'] as num).toInt(),
      reps: (json['reps'] as num).toInt(),
      weight: (json['weight'] as num?)?.toDouble(),
      isSynced: json['isSynced'] as bool,
    );

Map<String, dynamic> _$RoutineSetDtoToJson(RoutineSetDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'apiId': instance.apiId,
      'routineItemId': instance.routineItemId,
      'index': instance.index,
      'reps': instance.reps,
      'version': instance.version,
      'weight': instance.weight,
      'isSynced': instance.isSynced,
    };
