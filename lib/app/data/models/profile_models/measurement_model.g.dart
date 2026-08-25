// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeasurementModel _$MeasurementModelFromJson(Map<String, dynamic> json) => MeasurementModel(
  id: (json['id'] as num?)?.toInt(),
  apiId: (json['apiId'] as num?)?.toInt(),
  height: (json['heightCm'] as num).toDouble(),
  weight: (json['weightKg'] as num).toDouble(),
  lArm: (json['leftArmCm'] as num).toDouble(),
  rArm: (json['rightArmCm'] as num).toDouble(),
  lHumerus: (json['lHumerus'] as num?)?.toDouble() ?? 0.0,
  rHumerus: (json['rHumerus'] as num?)?.toDouble() ?? 0.0,
  lLeg: (json['leftLegCm'] as num).toDouble(),
  rLeg: (json['rightLegCm'] as num).toDouble(),
  lThigh: (json['leftThighCm'] as num).toDouble(),
  rThigh: (json['rightThighCm'] as num).toDouble(),
  neck: (json['neckCm'] as num).toDouble(),
  shoulders: (json['shouldersCm'] as num).toDouble(),
  waist: (json['waistCm'] as num).toDouble(),
  chest: (json['chestCm'] as num).toDouble(),
  hips: (json['hipsCm'] as num).toDouble(),
  checkDate: DateTime.parse(json['measuredAt'] as String),
  version: (json['version'] as num?)?.toInt() ?? 0,
  isSynced: json['isSynced'] as bool? ?? true,
);

Map<String, dynamic> _$MeasurementModelToJson(MeasurementModel instance) => <String, dynamic>{
  'id': instance.id,
  'apiId': instance.apiId,
  'heightCm': instance.height,
  'weightKg': instance.weight,
  'leftArmCm': instance.lArm,
  'rightArmCm': instance.rArm,
  'leftThighCm': instance.lThigh,
  'rightThighCm': instance.rThigh,
  'leftLegCm': instance.lLeg,
  'rightLegCm': instance.rLeg,
  'neckCm': instance.neck,
  'shouldersCm': instance.shoulders,
  'waistCm': instance.waist,
  'chestCm': instance.chest,
  'hipsCm': instance.hips,
  'measuredAt': instance.checkDate.toIso8601String(),
  'lHumerus': instance.lHumerus,
  'rHumerus': instance.rHumerus,
  'version': instance.version,
  'isSynced': instance.isSynced,
};
