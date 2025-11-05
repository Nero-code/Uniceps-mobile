// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanItemModel _$PlanItemModelFromJson(Map<String, dynamic> json) =>
    PlanItemModel(
      id: (json['id'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      durationString: json['durationString'] as String,
      daysCount: (json['daysCount'] as num).toInt(),
      isFree: json['isFree'] as bool,
    );

Map<String, dynamic> _$PlanItemModelToJson(PlanItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'durationString': instance.durationString,
      'daysCount': instance.daysCount,
      'isFree': instance.isFree,
    };
