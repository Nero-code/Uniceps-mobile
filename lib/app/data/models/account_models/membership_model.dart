// import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/data/models/account_models/permission_model.dart';
import 'package:uniceps/app/data/sources/local/database.dart' as db;
import 'package:uniceps/app/domain/classes/account_entities/permission.dart';
import 'package:uniceps/app/domain/classes/account_entities/membership.dart';

part 'membership_model.g.dart';

@JsonSerializable()
class MembershipModel {
  final int? id;
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

  const MembershipModel({
    this.id,
    required this.planName,
    required this.planId,
    required this.price,
    required this.startDate,
    required this.endDate,
    required this.isActive,
    required this.isGift,
    required this.permits,
  });

  factory MembershipModel.free() => MembershipModel(
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

  factory MembershipModel.fromJson(Map<String, dynamic> json) =>
      _$MembershipModelFromJson(json);

  Map<String, dynamic> toJson() => _$MembershipModelToJson(this);

  factory MembershipModel.fromTable(db.Membership c) => MembershipModel(
      id: c.id,
      planName: c.planName,
      planId: c.planId,
      price: c.price,
      startDate: c.startDate,
      endDate: c.endDate,
      isActive: c.isActive,
      isGift: c.isGift,
      permits: []);

  db.MembershipsCompanion toTable() => db.MembershipsCompanion.insert(
        planId: planId,
        planName: planName,
        price: price,
        startDate: startDate,
        endDate: endDate,
        isActive: isActive,
        isGift: isGift,
      );

  factory MembershipModel.fromEntity(Membership s) => MembershipModel(
      planName: s.planName,
      planId: s.planId,
      price: s.price,
      startDate: s.startDate,
      endDate: s.endDate,
      isActive: s.isActive,
      isGift: s.isGift,
      permits: s.permits.map((p) => PermissionModel.fromEntity(p)).toList());

  Membership toEntity() => Membership(
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
