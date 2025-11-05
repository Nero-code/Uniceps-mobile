// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'membership_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MembershipModel _$MembershipModelFromJson(Map<String, dynamic> json) =>
    MembershipModel(
      id: (json['id'] as num?)?.toInt(),
      planName: json['planName'] as String,
      planId: json['planId'] as String,
      price: (json['price'] as num).toDouble(),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      isActive: json['isActive'] as bool,
      isGift: json['isGift'] as bool,
      permits: (json['permits'] as List<dynamic>)
          .map((e) => PermissionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MembershipModelToJson(MembershipModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'planName': instance.planName,
      'planId': instance.planId,
      'price': instance.price,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'isActive': instance.isActive,
      'isGift': instance.isGift,
      'permits': instance.permits,
    };
