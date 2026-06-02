import 'package:drift/drift.dart';
import 'package:uniceps/app/data/models/diet_models/diet_meal_ingredient_dto.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_meal.dart';

class DietMealDto {
  final int? id;
  final String name;
  final int index;
  final List<DietMealIngredientDto> ingredients;

  const DietMealDto({this.id, required this.name, required this.index, this.ingredients = const []});

  DietMeal toEntity() =>
      DietMeal(id: id, name: name, index: index, ingredients: ingredients.map((e) => e.toEntity()).toList());

  factory DietMealDto.fromEntity(DietMeal entity) => DietMealDto(
    id: entity.id,
    name: entity.name,
    index: entity.index,
    ingredients: entity.ingredients.map((e) => DietMealIngredientDto.fromEntity(e)).toList(),
  );

  DietMealsCompanion toCompanion(int dietDayId) => DietMealsCompanion(
    id: id == null ? const Value.absent() : Value(id!),
    name: Value(name),
    index: Value(index),
    dietDayId: Value(dietDayId),
  );

  factory DietMealDto.fromData(DietMealData data, [List<DietMealIngredientDto> ingredients = const []]) =>
      DietMealDto(id: data.id, name: data.name, index: data.index, ingredients: ingredients);
}
