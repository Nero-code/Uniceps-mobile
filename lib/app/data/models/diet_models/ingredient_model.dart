import 'package:json_annotation/json_annotation.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/app/domain/classes/diet_classes/ingredient.dart' as entity;

part 'ingredient_model.g.dart';

@JsonSerializable()
class IngredientModel {
  final int? id;
  final String name;
  final String? category;
  @JsonKey(name: 'serving_size_g')
  final double servingSizeInGrams;
  final double calories;
  final double protein;
  final double carbs;
  final double fats;

  const IngredientModel({
    required this.id,
    required this.name,
    required this.category,
    required this.servingSizeInGrams,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fats,
  });

  factory IngredientModel.fromJson(Map<String, dynamic> json) => _$IngredientModelFromJson(json);
  Map<String, dynamic> toJson() => _$IngredientModelToJson(this);

  entity.Ingredient toEntity() => entity.Ingredient(
    id: id,
    name: name,
    category: category,
    servingSizeInGrams: servingSizeInGrams,
    calories: calories,
    protein: protein,
    carbs: carbs,
    fats: fats,
  );

  factory IngredientModel.fromEntity(entity.Ingredient i) => IngredientModel(
    id: i.id,
    name: i.name,
    category: i.category,
    servingSizeInGrams: i.servingSizeInGrams,
    calories: i.calories,
    protein: i.protein,
    carbs: i.carbs,
    fats: i.fats,
  );

  factory IngredientModel.fromCompanion(IngredientData data) => IngredientModel(
    id: data.id,
    name: data.name,
    category: data.categoryText,
    servingSizeInGrams: data.servingSizeInGrams,
    calories: data.calories,
    protein: data.protein,
    carbs: data.carbs,
    fats: data.fats,
  );
}
