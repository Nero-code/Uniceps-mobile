// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeasurementModel _$MeasurementModelFromJson(Map<String, dynamic> json) =>
    MeasurementModel(
      id: (json['id'] as num?)?.toInt(),
      apiId: (json['api_id'] as num?)?.toInt(),
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      lArm: (json['l_arm'] as num).toDouble(),
      rArm: (json['r_arm'] as num).toDouble(),
      lHumerus: (json['l_humerus'] as num).toDouble(),
      rHumerus: (json['r_humerus'] as num).toDouble(),
      lLeg: (json['l_leg'] as num).toDouble(),
      rLeg: (json['r_leg'] as num).toDouble(),
      lThigh: (json['l_thigh'] as num).toDouble(),
      rThigh: (json['r_thigh'] as num).toDouble(),
      neck: (json['neck'] as num).toDouble(),
      shoulders: (json['shoulders'] as num).toDouble(),
      waist: (json['waist'] as num).toDouble(),
      chest: (json['chest'] as num).toDouble(),
      hips: (json['hips'] as num).toDouble(),
      checkDate: DateTime.parse(json['check_date'] as String),
      version: (json['version'] as num).toInt(),
      isSynced: json['is_synced'] as bool,
    );

Map<String, dynamic> _$MeasurementModelToJson(MeasurementModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'api_id': instance.apiId,
      'height': instance.height,
      'weight': instance.weight,
      'l_arm': instance.lArm,
      'r_arm': instance.rArm,
      'l_humerus': instance.lHumerus,
      'r_humerus': instance.rHumerus,
      'l_thigh': instance.lThigh,
      'r_thigh': instance.rThigh,
      'l_leg': instance.lLeg,
      'r_leg': instance.rLeg,
      'neck': instance.neck,
      'shoulders': instance.shoulders,
      'waist': instance.waist,
      'chest': instance.chest,
      'hips': instance.hips,
      'check_date': instance.checkDate.toIso8601String(),
      'version': instance.version,
      'is_synced': instance.isSynced,
    };
