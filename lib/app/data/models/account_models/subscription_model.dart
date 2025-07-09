// import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/data/models/account_models/permission_model.dart';
import 'package:uniceps/app/domain/classes/account_entities/permission.dart';
import 'package:uniceps/app/domain/classes/account_entities/subscription.dart';

part 'subscription_model.g.dart';

@JsonSerializable()
class SubscriptionModel {
  final String planName;
  final String planId;
  final double price;
  final DateTime startDate;
  final DateTime endDate;
  final bool isActive;
  final bool isGift;

  final List<PermissionModel> permits;

  bool allows(Actions act, int current) =>
      permits.any((p) => p.can(act, current));

  const SubscriptionModel({
    required this.planName,
    required this.planId,
    required this.price,
    required this.startDate,
    required this.endDate,
    required this.isActive,
    required this.isGift,
    required this.permits,
  });

  factory SubscriptionModel.free() => SubscriptionModel(
          planName: "Free",
          planId: "",
          price: 0,
          startDate: DateTime.now(),
          endDate: DateTime(2099),
          isActive: true,
          isGift: false,
          permits: const [
            PermissionModel(action: Actions.cRoutine, maxCount: 1),
            PermissionModel(action: Actions.cDay, maxCount: 3),
            PermissionModel(action: Actions.cItem, maxCount: 5),
            PermissionModel(action: Actions.cSet, maxCount: 3),
          ]);

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionModelToJson(this);

  factory SubscriptionModel.fromEntity(Subscription s) => SubscriptionModel(
      planName: s.planName,
      planId: s.planId,
      price: s.price,
      startDate: s.startDate,
      endDate: s.endDate,
      isActive: s.isActive,
      isGift: s.isGift,
      permits: s.permits.map((p) => PermissionModel.fromEntity(p)).toList());

  Subscription toEntity() => Subscription(
        planName: planName,
        planId: planId,
        price: price,
        startDate: startDate,
        endDate: endDate,
        isActive: isActive,
        isGift: isGift,
        permits: permits.map((p) => p.toEntity()).toList(),
      );
}
