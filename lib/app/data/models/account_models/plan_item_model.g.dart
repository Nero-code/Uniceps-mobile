// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanItemModel _$PlanItemModelFromJson(Map<String, dynamic> json) =>
    PlanItemModel(
      id: (json['id'] as num).toInt(),
      planId: (json['planId'] as num).toInt(),
      price: json['price'] as String,
      displayName: json['displayName'] as String,
      daysCount: json['daysCount'] as String,
      isFree: json['isFree'] as bool,
    );

Map<String, dynamic> _$PlanItemModelToJson(PlanItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'planId': instance.planId,
      'price': instance.price,
      'displayName': instance.displayName,
      'daysCount': instance.daysCount,
      'isFree': instance.isFree,
    };
