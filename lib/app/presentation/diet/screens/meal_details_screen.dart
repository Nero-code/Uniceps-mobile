import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_meal.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_meal_ingredient.dart';
import 'package:uniceps/app/presentation/diet/blocs/diet_meal/diet_meal_bloc.dart';
import 'package:uniceps/app/presentation/diet/blocs/diet_meal_ingredient/diet_meal_ingredient_bloc.dart';
import 'package:uniceps/app/presentation/diet/dialogs/edit_meal_description_dialog.dart';
import 'package:uniceps/app/presentation/diet/screens/add_ingredient_screen.dart';
import 'package:uniceps/app/presentation/diet/widgets/diet_macro_summary.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/injection_dependency.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class MealDetailsScreen extends StatefulWidget {
  final DietMeal meal;

  const MealDetailsScreen({super.key, required this.meal});

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              DietMealIngredientBloc(sl())..add(DietMealIngredientEvent.getIngredients(widget.meal.id!)),
        ),
        BlocProvider(create: (context) => DietMealBloc(sl())),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text(widget.meal.name)),
        body: BlocBuilder<DietMealIngredientBloc, DietMealIngredientState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const LoadingIndicator(),
              loaded: (ingredients) {
                final currentMeal = widget.meal.copyWith(ingredients: ingredients);
                return SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: Column(
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

                      // Meal Description Header
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    l10n.description,
                                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  if (widget.meal.description != null && widget.meal.description!.isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Text(widget.meal.description!, style: const TextStyle(color: Colors.grey)),
                                    ),
                                ],
                              ),
                            ),
                            Builder(
                              builder: (btnContext) => IconButton(
                                icon: const Icon(Icons.edit_outlined),
                                onPressed: () => showDialog(
                                  context: btnContext,
                                  builder: (_) => BlocProvider.value(
                                    value: btnContext.read<DietMealBloc>(),
                                    child: EditMealDescriptionDialog(meal: widget.meal),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Divider(indent: 16, endIndent: 16),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            l10n.ingredients,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      ...ingredients.map((item) => IngredientListItem(mealId: widget.meal.id!, ingredient: item)),
                    ],
                  ),
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
                    child: AddIngredientScreen(
                      mealId: widget.meal.id!,
                      mealIngredientBloc: context.read<DietMealIngredientBloc>(),
                    ),
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
  late TextEditingController _amountController;
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController(text: widget.ingredient.amount.toStringAsFixed(0));
    _descController = TextEditingController(text: widget.ingredient.description ?? '');
  }

  @override
  void didUpdateWidget(IngredientListItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.ingredient.amount != widget.ingredient.amount) {
      if (_amountController.text != widget.ingredient.amount.toStringAsFixed(0)) {
        _amountController.text = widget.ingredient.amount.toStringAsFixed(0);
      }
    }
    if (oldWidget.ingredient.description != widget.ingredient.description) {
      if (_descController.text != (widget.ingredient.description ?? '')) {
        _descController.text = widget.ingredient.description ?? '';
      }
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _descController.dispose();
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
        child: Column(
          children: [
            Row(
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
                  width: 70,
                  child: TextField(
                    controller: _amountController,
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
                        DietMealIngredientEvent.updateIngredient(
                          widget.mealId,
                          widget.ingredient.copyWith(amount: amount),
                        ),
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
            const SizedBox(height: 8),
            TextField(
              controller: _descController,
              decoration: InputDecoration(
                hintText: l10n.description,
                contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                isDense: true,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              style: const TextStyle(fontSize: 12),
              onSubmitted: (value) {
                context.read<DietMealIngredientBloc>().add(
                  DietMealIngredientEvent.updateIngredient(
                    widget.mealId,
                    widget.ingredient.copyWith(description: value.isEmpty ? null : value),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
