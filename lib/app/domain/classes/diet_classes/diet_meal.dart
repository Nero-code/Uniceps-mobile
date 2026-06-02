import 'package:uniceps/app/domain/classes/diet_classes/diet_meal_ingredient.dart';

class DietMeal {
  final int? id;
  final String name;
  final int index;
  final List<DietMealIngredient> ingredients;

  const DietMeal({this.id, required this.name, required this.index, required this.ingredients});

  double get calories => ingredients.fold(0, (sum, item) => sum + item.calories);
  double get protein => ingredients.fold(0, (sum, item) => sum + item.protein);
  double get carbs => ingredients.fold(0, (sum, item) => sum + item.carbs);
  double get fats => ingredients.fold(0, (sum, item) => sum + item.fats);

  DietMeal copyWith({int? id, String? name, int? index, List<DietMealIngredient>? ingredients}) {
    return DietMeal(
      id: id ?? this.id,
      name: name ?? this.name,
      index: index ?? this.index,
      ingredients: ingredients ?? this.ingredients,
    );
  }
}
