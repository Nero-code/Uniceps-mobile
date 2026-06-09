import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart' as js;
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_meal_ingredient.dart';

part 'diet_meal_ingredient_dto.g.dart';

@js.JsonSerializable()
class DietMealIngredientDto {
  final int? id;
  final double amount;
  final int index;

  final String code;
  @js.JsonKey(name: 'name_ar')
  final String nameAr;
  @js.JsonKey(name: 'name_en')
  final String nameEn;
  final String category;
  final String? description;
  @js.JsonKey(name: 'serving_size_g')
  final double servingSizeInGrams;
  final double calories;
  final double protein;
  final double carbs;
  final double fats;

  const DietMealIngredientDto({
    this.id,
    required this.amount,
    required this.index,
    required this.code,
    required this.nameAr,
    required this.nameEn,
    required this.category,
    required this.description,
    required this.servingSizeInGrams,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fats,
  });

  factory DietMealIngredientDto.fromJson(Map<String, dynamic> json) => _$DietMealIngredientDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DietMealIngredientDtoToJson(this);

  DietMealIngredient toEntity() => DietMealIngredient(
    id: id,
    amount: amount,
    index: index,
    code: code,
    nameAr: nameAr,
    nameEn: nameEn,
    category: category,
    description: description,
    servingSizeInGrams: servingSizeInGrams,
    calories: calories,
    protein: protein,
    carbs: carbs,
    fats: fats,
  );

  factory DietMealIngredientDto.fromEntity(DietMealIngredient entity) => DietMealIngredientDto(
    id: entity.id,
    amount: entity.amount,
    index: entity.index,
    code: entity.code,
    nameAr: entity.nameAr,
    nameEn: entity.nameEn,
    category: entity.category,
    description: entity.description,
    servingSizeInGrams: entity.servingSizeInGrams,
    calories: entity.calories,
    protein: entity.protein,
    carbs: entity.carbs,
    fats: entity.fats,
  );

  DietMealIngredientsCompanion toCompanion(int dietMealId) => DietMealIngredientsCompanion(
    id: id == null ? const Value.absent() : Value(id!),
    amount: Value(amount),
    index: Value(index),
    dietMealId: Value(dietMealId),
    code: Value(code),
    nameAr: Value(nameAr),
    nameEn: Value(nameEn),
    category: Value(category),
    description: Value(description),
    servingSizeInGrams: Value(servingSizeInGrams),
    calories: Value(calories),
    protein: Value(protein),
    carbs: Value(carbs),
    fats: Value(fats),
  );

  factory DietMealIngredientDto.fromData(DietMealIngredientData data) => DietMealIngredientDto(
    id: data.id,
    amount: data.amount,
    index: data.index,
    code: data.code,
    nameAr: data.nameAr,
    nameEn: data.nameEn,
    category: data.category,
    description: data.description,
    servingSizeInGrams: data.servingSizeInGrams,
    calories: data.calories,
    protein: data.protein,
    carbs: data.carbs,
    fats: data.fats,
  );
}
