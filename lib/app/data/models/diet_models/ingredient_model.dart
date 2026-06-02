import 'package:json_annotation/json_annotation.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/app/domain/classes/diet_classes/ingredient.dart' as entity;

part 'ingredient_model.g.dart';

@JsonSerializable()
class IngredientModel {
  final String code;
  @JsonKey(name: 'name_ar')
  final String nameAr;
  @JsonKey(name: 'name_en')
  final String nameEn;
  final String category;
  @JsonKey(name: 'serving_size_g')
  final double servingSizeInGrams;
  final double calories;
  final double protein;
  final double carbs;
  final double fats;

  const IngredientModel({
    required this.code,
    required this.nameAr,
    required this.nameEn,
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
    code: code,
    nameAr: nameAr,
    nameEn: nameEn,
    category: category,
    servingSizeInGrams: servingSizeInGrams,
    calories: calories,
    protein: protein,
    carbs: carbs,
    fats: fats,
  );

  factory IngredientModel.fromEntity(entity.Ingredient i) => IngredientModel(
    code: i.code,
    nameAr: i.nameAr,
    nameEn: i.nameEn,
    category: i.category,
    servingSizeInGrams: i.servingSizeInGrams,
    calories: i.calories,
    protein: i.protein,
    carbs: i.carbs,
    fats: i.fats,
  );

  IngredientsCompanion toCompanion() => IngredientsCompanion.insert(
    code: code,
    nameAr: nameAr,
    nameEn: nameEn,
    category: category,
    servingSizeInGrams: servingSizeInGrams.toString(),
    calories: calories.toString(),
    protein: protein.toString(),
    carbs: carbs.toString(),
    fats: fats.toString(),
  );

  factory IngredientModel.fromData(IngredientData data) => IngredientModel(
    code: data.code,
    nameAr: data.nameAr,
    nameEn: data.nameEn,
    category: data.category,
    servingSizeInGrams: double.tryParse(data.servingSizeInGrams) ?? 0,
    calories: double.tryParse(data.calories) ?? 0,
    protein: double.tryParse(data.protein) ?? 0,
    carbs: double.tryParse(data.carbs) ?? 0,
    fats: double.tryParse(data.fats) ?? 0,
  );
}
