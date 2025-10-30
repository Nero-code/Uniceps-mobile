import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/data/models/account_models/plan_item_model.dart';

part 'plan_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PlanModel {
  final int id;
  final String name;
  final String description;
  final List<String> features;
  final List<PlanItemModel> items;

  PlanModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.features,
      required this.items});

  factory PlanModel.fromJson(Map<String, dynamic> json) =>
      _$PlanModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlanModelToJson(this);
}
