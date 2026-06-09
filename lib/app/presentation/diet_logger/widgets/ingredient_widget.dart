import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_meal_ingredient.dart';

class IngredientWidget extends StatelessWidget {
  const IngredientWidget({super.key, required this.ingredient});

  final DietMealIngredient ingredient;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);
    final isAr = Directionality.of(context) == .rtl;
    return Container(
      padding: const .all(8.0),

      // decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: .circular(5)),
      child: Column(
        children: [
          Text(isAr ? ingredient.nameAr : ingredient.nameEn),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.done), color: Colors.green),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: .number,
                    decoration: InputDecoration(
                      isDense: true,
                      label: Text('Amount'),
                      suffix: Text('g'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
