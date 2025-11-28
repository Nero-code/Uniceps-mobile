// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'membership_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MembershipModel _$MembershipModelFromJson(Map<String, dynamic> json) =>
    MembershipModel(
      planName: json['plan'] as String,
      planId: json['id'] as String,
      price: (json['price'] as num).toDouble(),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      isNotified: json['isNotified'] as bool? ?? false,
      isActive: json['isActive'] as bool,
      isGift: json['isGift'] as bool,
    );

Map<String, dynamic> _$MembershipModelToJson(MembershipModel instance) =>
    <String, dynamic>{
      'id': instance.planId,
      'plan': instance.planName,
      'price': instance.price,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'isNotified': instance.isNotified,
      'isActive': instance.isActive,
      'isGift': instance.isGift,
    };
