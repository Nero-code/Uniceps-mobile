import 'package:uniceps/app/domain/classes/diet_classes/diet_meal_ingredient.dart';

class DietMeal {
  final int? id;
  final String name;
  final int index;
  final String? description;
  final List<DietMealIngredient> ingredients;

  const DietMeal({this.id, required this.name, required this.index, required this.ingredients, this.description});

  double get calories => ingredients.fold(0, (sum, item) => sum + item.calories * item.amount);
  double get protein => ingredients.fold(0, (sum, item) => sum + item.protein * item.amount);
  double get carbs => ingredients.fold(0, (sum, item) => sum + item.carbs * item.amount);
  double get fats => ingredients.fold(0, (sum, item) => sum + item.fats * item.amount);

  DietMeal copyWith({int? id, String? name, int? index, List<DietMealIngredient>? ingredients, String? description}) {
    return DietMeal(
      id: id ?? this.id,
      name: name ?? this.name,
      index: index ?? this.index,
      ingredients: ingredients ?? this.ingredients,
      description: description ?? this.description,
    );
  }
}
