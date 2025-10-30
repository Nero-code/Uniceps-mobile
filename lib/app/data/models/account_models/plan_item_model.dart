import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_item_model.g.dart';

@JsonSerializable()
class PlanItemModel {
  final int id;
  final int planId;
  final String price;
  final String displayName;
  final String daysCount;
  final bool isFree;

  PlanItemModel(
      {required this.id,
      required this.planId,
      required this.price,
      required this.displayName,
      required this.daysCount,
      required this.isFree});

  factory PlanItemModel.fromJson(Map<String, dynamic> json) =>
      _$PlanItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlanItemModelToJson(this);
}
