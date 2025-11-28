import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/classes/account_entities/membership.dart';

part 'membership_model.g.dart';

@JsonSerializable()
class MembershipModel {
  @JsonKey(name: 'id')
  final String planId;

  @JsonKey(name: 'plan')
  final String planName;

  final double price;
  final DateTime startDate;
  final DateTime endDate;

  @JsonKey(defaultValue: false)
  final bool isNotified;

  final bool isActive;
  final bool isGift;

  const MembershipModel({
    required this.planName,
    required this.planId,
    required this.price,
    required this.startDate,
    required this.endDate,
    required this.isNotified,
    required this.isActive,
    required this.isGift,
  });

  factory MembershipModel.free() => MembershipModel(
        planName: "Free",
        planId: "",
        price: 0,
        startDate: DateTime.now(),
        endDate: DateTime(2099),
        isActive: true,
        isGift: false,
        isNotified: false,
      );

  factory MembershipModel.fromJson(Map<String, dynamic> json) => _$MembershipModelFromJson(json);

  Map<String, dynamic> toJson() => _$MembershipModelToJson(this);

  factory MembershipModel.fromEntity(Membership s) => MembershipModel(
        planName: s.planName,
        planId: s.planId,
        price: s.price,
        startDate: s.startDate,
        endDate: s.endDate,
        isNotified: s.isNotified,
        isActive: s.isActive,
        isGift: s.isGift,
      );

  Membership toEntity() => Membership(
        planName: planName,
        planId: planId,
        price: price,
        startDate: startDate,
        endDate: endDate,
        isNotified: isNotified,
        isActive: isActive,
        isGift: isGift,
      );

  MembershipModel copyWith({
    String? planId,
    String? planName,
    double? price,
    DateTime? startDate,
    DateTime? endDate,
    bool? isNotified,
    bool? isActive,
    bool? isGift,
  }) =>
      MembershipModel(
        planName: planName ?? this.planName,
        planId: planId ?? this.planId,
        price: price ?? this.price,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        isNotified: isNotified ?? this.isNotified,
        isActive: isActive ?? this.isActive,
        isGift: isGift ?? this.isGift,
      );
}
