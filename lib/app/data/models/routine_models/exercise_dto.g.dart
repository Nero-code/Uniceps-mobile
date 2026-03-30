// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseDto _$ExerciseDtoFromJson(Map<String, dynamic> json) => ExerciseDto(
  apiId: json['exerciseId'] as String,
  name: json['name'] as String,
  imageUrl: json['imageUrl'] as String?,
  muscleGroupName: json['muscleGroupName'] ?? '' as String,
  muscleGroupCode: json['muscleGroupCode'] as String,
  muscleHeadName: json['muscleHeadName'] ?? '' as String,
  muscleHeadCode: json['muscleHeadCode'] as String,
  auxMuscle1: json['muscleAux1'] as String?,
  auxMuscle2: json['muscleAux2'] as String?,
  auxMuscle3: json['muscleAux3'] as String?,
  laterals: json['mechanism'].toString() as String,
  description: json['implementation'] as String?,
  toolName: json['equipmentName'] as String,
  toolCode: json['equipmentCode'] as String,
  timestamp: DateTime.parse(json['lastUpdated'] as String),
);

Map<String, dynamic> _$ExerciseDtoToJson(ExerciseDto instance) => <String, dynamic>{
  'exerciseId': instance.apiId,
  'name': instance.name,
  'imageUrl': instance.imageUrl,
  'muscleGroupName': instance.muscleGroupName,
  'muscleGroupCode': instance.muscleGroupCode,
  'muscleHeadName': instance.muscleHeadName,
  'muscleHeadCode': instance.muscleHeadCode,
  'muscleAux1': instance.auxMuscle1,
  'muscleAux2': instance.auxMuscle2,
  'muscleAux3': instance.auxMuscle3,
  'mechanism': instance.laterals,
  'implementation': instance.description,
  'equipmentName': instance.toolName,
  'equipmentCode': instance.toolCode,
  'lastUpdated': instance.timestamp.toIso8601String(),
};
