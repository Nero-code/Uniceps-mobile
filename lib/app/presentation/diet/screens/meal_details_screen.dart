import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_meal.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_meal_ingredient.dart';
import 'package:uniceps/app/presentation/diet/blocs/diet_meal_ingredient/diet_meal_ingredient_bloc.dart';
import 'package:uniceps/app/presentation/diet/screens/add_ingredient_screen.dart';
import 'package:uniceps/app/presentation/diet/widgets/diet_macro_summary.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/injection_dependency.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class MealDetailsScreen extends StatelessWidget {
  final DietMeal meal;

  const MealDetailsScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => DietMealIngredientBloc(sl())..add(DietMealIngredientEvent.getIngredients(meal.id!)),
      child: Scaffold(
        appBar: AppBar(title: Text(meal.name)),
        body: BlocBuilder<DietMealIngredientBloc, DietMealIngredientState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const LoadingIndicator(),
              loaded: (ingredients) {
                final currentMeal = meal.copyWith(ingredients: ingredients);
                return Column(
                  children: [
                    // Meal Summary
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: DietMacroSummary(
                        calories: currentMeal.calories,
                        protein: currentMeal.protein,
                        carbs: currentMeal.carbs,
                        fats: currentMeal.fats,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          l10n.ingredients,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: ingredients.length,
                        itemBuilder: (context, index) {
                          final item = ingredients[index];
                          return IngredientListItem(mealId: meal.id!, ingredient: item);
                        },
                      ),
                    ),
                  ],
                );
              },
              orElse: () => Center(child: Text(l10n.empty)),
            );
          },
        ),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton.extended(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: context.read<DietMealIngredientBloc>(),
                    child: AddIngredientScreen(mealId: meal.id!),
                  ),
                ),
              ),
              icon: const Icon(Icons.add),
              label: Text(l10n.addIngredient),
            );
          },
        ),
      ),
    );
  }
}

class IngredientListItem extends StatefulWidget {
  final int mealId;
  final DietMealIngredient ingredient;

  const IngredientListItem({super.key, required this.mealId, required this.ingredient});

  @override
  State<IngredientListItem> createState() => _IngredientListItemState();
}

class _IngredientListItemState extends State<IngredientListItem> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.ingredient.amount.toStringAsFixed(0));
  }

  @override
  void didUpdateWidget(IngredientListItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.ingredient.amount != widget.ingredient.amount) {
      if (_controller.text != widget.ingredient.amount.toStringAsFixed(0)) {
        _controller.text = widget.ingredient.amount.toStringAsFixed(0);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final name = l10n.localeName == 'ar' ? widget.ingredient.nameAr : widget.ingredient.nameEn;

    return Card(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Wrap(
                    spacing: 5,
                    children: [
                      Text(
                        '${widget.ingredient.caloriesPerAmount.toStringAsFixed(0)} kcal',
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        'C:${widget.ingredient.carbsPerAmount.toStringAsFixed(0)}g',
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        'P:${widget.ingredient.proteinPerAmount.toStringAsFixed(0)}g',
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        'F:${widget.ingredient.fatsPerAmount.toStringAsFixed(0)}g',
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: 80,
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  suffixText: 'g',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  isDense: true,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onSubmitted: (value) {
                  final amount = double.tryParse(value) ?? 0;
                  context.read<DietMealIngredientBloc>().add(
                    DietMealIngredientEvent.updateIngredient(widget.mealId, widget.ingredient.copyWith(amount: amount)),
                  );
                },
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () {
                context.read<DietMealIngredientBloc>().add(
                  DietMealIngredientEvent.deleteIngredient(widget.mealId, widget.ingredient.id!),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
