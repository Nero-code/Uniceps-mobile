import 'package:uniceps/app/domain/classes/diet_classes/diet_meal.dart';

class DietDay {
  final int? id;
  final String name;
  final int index;
  final List<DietMeal> meals;

  const DietDay({this.id, required this.name, required this.index, required this.meals});

  double get calories => meals.fold(0, (sum, meal) => sum + meal.calories);
  double get protein => meals.fold(0, (sum, meal) => sum + meal.protein);
  double get carbs => meals.fold(0, (sum, meal) => sum + meal.carbs);
  double get fats => meals.fold(0, (sum, meal) => sum + meal.fats);

  DietDay copyWith({int? id, String? name, int? index, List<DietMeal>? meals}) {
    return DietDay(id: id ?? this.id, name: name ?? this.name, index: index ?? this.index, meals: meals ?? this.meals);
  }
}
