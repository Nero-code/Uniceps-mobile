import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_day.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_meal.dart';
import 'package:uniceps/app/presentation/diet/widgets/diet_macro_summary.dart';
import 'package:uniceps/app/presentation/diet_logger/widgets/meal_widget.dart';

class DietLoggerScreen extends StatelessWidget {
  const DietLoggerScreen({super.key, required this.dietDay});
  final DietDay dietDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(dietDay.name)),
      body: SingleChildScrollView(
        child: Column(
          spacing: 10,
          children: [
            AppBar(title: Text(dietDay.name)),
            const DietMacroSummary(calories: 1, protein: 1, carbs: 1, fats: 1),
            ...dietDay.meals.map((m) => MealWidget(meal: m)),
            MealWidget(
              meal: DietMeal(name: 'Extras', index: dietDay.meals.length, ingredients: []),
            ),
          ],
        ),
      ),
    );
  }
}
