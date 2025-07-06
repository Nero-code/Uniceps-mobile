// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermissionModel _$PermissionModelFromJson(Map<String, dynamic> json) =>
    PermissionModel(
      action: $enumDecode(_$ActionsEnumMap, json['action']),
      maxCount: (json['maxCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PermissionModelToJson(PermissionModel instance) =>
    <String, dynamic>{
      'action': _$ActionsEnumMap[instance.action]!,
      'maxCount': instance.maxCount,
    };

const _$ActionsEnumMap = {
  Actions.cRoutine: 'cRoutine',
  Actions.cDay: 'cDay',
  Actions.cItem: 'cItem',
  Actions.cSet: 'cSet',
};
