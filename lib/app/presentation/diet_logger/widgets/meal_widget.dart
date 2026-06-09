import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_meal.dart';
import 'package:uniceps/app/presentation/diet/widgets/diet_macro_summary.dart';
import 'package:uniceps/app/presentation/diet_logger/widgets/ingredient_widget.dart';

class MealWidget extends StatelessWidget {
  const MealWidget({super.key, required this.meal});

  final DietMeal meal;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const .symmetric(horizontal: 8.0),
      padding: const .all(8.0),
      decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: .circular(10)),

      child: Column(
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(meal.name),
              // Total Dietary Values
              DietMacroSummary(
                calories: meal.calories,
                protein: meal.protein,
                carbs: meal.carbs,
                fats: meal.fats,
                compact: true,
              ),
            ],
          ),
          // Ingredient Widget
          ...meal.ingredients.map((i) => IngredientWidget(ingredient: i)),
        ],
      ),
    );
  }
}
