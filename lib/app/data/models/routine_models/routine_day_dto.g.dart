// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_day_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutineDayDto _$RoutineDayDtoFromJson(Map<String, dynamic> json) =>
    RoutineDayDto(
      id: (json['Id'] as num?)?.toInt(),
      apiId: (json['ApiId'] as num?)?.toInt(),
      routineId: (json['RoutineId'] as num?)?.toInt() ?? 0,
      version: (json['Version'] as num?)?.toInt() ?? 0,
      name: json['Name'] as String,
      index: (json['Order'] as num).toInt(),
      items: (json['Items'] as List<dynamic>)
          .map((e) => RoutineItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      isSynced: json['IsSynced'] as bool? ?? false,
    );

Map<String, dynamic> _$RoutineDayDtoToJson(RoutineDayDto instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'ApiId': instance.apiId,
      'Order': instance.index,
      'RoutineId': instance.routineId,
      'Name': instance.name,
      'Items': instance.items.map((e) => e.toJson()).toList(),
      'Version': instance.version,
      'IsSynced': instance.isSynced,
    };
