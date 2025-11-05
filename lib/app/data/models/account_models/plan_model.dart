import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/data/models/account_models/plan_item_model.dart';
import 'package:uniceps/app/domain/classes/account_entities/plan.dart';

part 'plan_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PlanModel {
  final String id;
  final String name;

  @JsonKey(name: "planItems")
  final List<PlanItemModel> items;

  PlanModel({required this.id, required this.name, required this.items});

  factory PlanModel.fromJson(Map<String, dynamic> json) =>
      _$PlanModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlanModelToJson(this);

  Plan toEntity() =>
      Plan(id: id, name: name, items: items.map((i) => i.toEntity()).toList());
}
