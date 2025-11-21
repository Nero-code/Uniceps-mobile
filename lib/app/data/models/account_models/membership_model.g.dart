// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'membership_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MembershipModel _$MembershipModelFromJson(Map<String, dynamic> json) =>
    MembershipModel(
      id: (json['id'] as num?)?.toInt(),
      planName: json['plan_name'] as String,
      planId: json['plan_id'] as String,
      price: (json['price'] as num).toDouble(),
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
      isActive: json['is_active'] as bool,
      isGift: json['is_gift'] as bool,
    );

Map<String, dynamic> _$MembershipModelToJson(MembershipModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'plan_name': instance.planName,
      'plan_id': instance.planId,
      'price': instance.price,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate.toIso8601String(),
      'is_active': instance.isActive,
      'is_gift': instance.isGift,
    };
