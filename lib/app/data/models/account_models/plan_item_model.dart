import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/classes/account_entities/plan_item.dart';

part 'plan_item_model.g.dart';

@JsonSerializable()
class PlanItemModel {
  final int id;
  final double price;
  final String durationString;
  final int daysCount;
  final bool isFree;

  PlanItemModel(
      {required this.id,
      required this.price,
      required this.durationString,
      required this.daysCount,
      required this.isFree});

  factory PlanItemModel.fromJson(Map<String, dynamic> json) =>
      _$PlanItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlanItemModelToJson(this);

  factory PlanItemModel.fromEntity(PlanItem i) => PlanItemModel(
      id: i.id,
      price: i.price,
      durationString: i.durationString,
      daysCount: i.daysCount,
      isFree: i.isFree);

  PlanItem toEntity() => PlanItem(
      id: id,
      price: price,
      durationString: durationString,
      daysCount: daysCount,
      isFree: isFree);
}
