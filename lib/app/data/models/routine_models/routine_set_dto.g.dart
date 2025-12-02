// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_set_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutineSetDto _$RoutineSetDtoFromJson(Map<String, dynamic> json) =>
    RoutineSetDto(
      id: (json['id'] as num?)?.toInt(),
      apiId: (json['apiId'] as num?)?.toInt(),
      routineItemId: (json['routineItemId'] as num?)?.toInt() ?? 0,
      version: (json['version'] as num?)?.toInt() ?? 0,
      index: (json['Order'] as num).toInt(),
      reps: (json['Repetition'] as num).toInt(),
      weight: (json['weight'] as num?)?.toDouble(),
      isSynced: json['isSynced'] as bool? ?? false,
    );

Map<String, dynamic> _$RoutineSetDtoToJson(RoutineSetDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'apiId': instance.apiId,
      'routineItemId': instance.routineItemId,
      'Order': instance.index,
      'Repetition': instance.reps,
      'version': instance.version,
      'isSynced': instance.isSynced,
      'weight': instance.weight,
    };
