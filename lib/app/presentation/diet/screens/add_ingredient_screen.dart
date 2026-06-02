import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_meal_ingredient.dart';
import 'package:uniceps/app/domain/classes/diet_classes/ingredient.dart';
import 'package:uniceps/app/presentation/diet/blocs/diet_meal_ingredient/diet_meal_ingredient_bloc.dart';
import 'package:uniceps/app/presentation/diet/blocs/ingredient/ingredient_bloc.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/injection_dependency.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class AddIngredientScreen extends StatefulWidget {
  final int mealId;

  const AddIngredientScreen({super.key, required this.mealId});

  @override
  State<AddIngredientScreen> createState() => _AddIngredientScreenState();
}

class _AddIngredientScreenState extends State<AddIngredientScreen> {
  String _searchQuery = '';
  String? _selectedCategory;
  final Set<Ingredient> _selectedIngredients = {};

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => IngredientBloc(sl())..add(const .getIngredients()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.addIngredient),
          actions: [
            if (_selectedIngredients.isNotEmpty)
              TextButton(
                onPressed: () {
                  final items = _selectedIngredients
                      .map(
                        (ing) => DietMealIngredient(
                          id: null,
                          amount: 0,
                          index: 0,
                          code: ing.code,
                          nameAr: ing.nameAr,
                          nameEn: ing.nameEn,
                          category: ing.category,
                          servingSizeInGrams: ing.servingSizeInGrams,
                          calories: ing.calories,
                          protein: ing.protein,
                          carbs: ing.carbs,
                          fats: ing.fats,
                        ),
                      )
                      .toList();
                  context.read<DietMealIngredientBloc>().add(
                    DietMealIngredientEvent.addIngredients(widget.mealId, items),
                  );
                  Navigator.pop(context);
                },
                child: Text(l10n.save, style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
          ],
        ),
        body: BlocBuilder<IngredientBloc, IngredientState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const LoadingIndicator(),
              loaded: (ingredients) {
                final categories = ingredients.map((i) => i.category).toSet().toList();

                final filtered = ingredients.where((i) {
                  final name = (l10n.localeName == 'ar' ? i.nameAr : i.nameEn).toLowerCase();
                  final matchesSearch = name.contains(_searchQuery);
                  final matchesCategory = _selectedCategory == null || i.category == _selectedCategory;
                  return matchesSearch && matchesCategory;
                }).toList();

                return Column(
                  children: [
                    // Search Bar
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: l10n.search,
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          filled: true,
                          fillColor: Colors.grey[100],
                        ),
                        onChanged: (value) => setState(() => _searchQuery = value.toLowerCase()),
                      ),
                    ),

                    // Category Filter
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: FilterChip(
                              label: Text(l10n.all),
                              selected: _selectedCategory == null,
                              onSelected: (selected) {
                                if (selected) setState(() => _selectedCategory = null);
                              },
                            ),
                          ),
                          ...categories.map(
                            (cat) => Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: FilterChip(
                                label: Text(cat),
                                selected: _selectedCategory == cat,
                                onSelected: (selected) {
                                  setState(() => _selectedCategory = selected ? cat : null);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    Expanded(
                      child: filtered.isEmpty
                          ? Center(child: Text(l10n.empty))
                          : ListView.builder(
                              padding: const EdgeInsets.all(16),
                              itemCount: filtered.length,
                              itemBuilder: (context, index) {
                                final item = filtered[index];
                                final name = l10n.localeName == 'ar' ? item.nameAr : item.nameEn;
                                final isSelected = _selectedIngredients.contains(item);
                                return Card(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    side: isSelected
                                        ? BorderSide(color: Theme.of(context).primaryColor, width: 2)
                                        : BorderSide.none,
                                  ),
                                  child: ListTile(
                                    title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                                    subtitle: Text('${item.category} • ${item.calories} kcal/100g'),
                                    trailing: isSelected
                                        ? Icon(Icons.check_circle, color: Theme.of(context).primaryColor)
                                        : const Icon(Icons.circle_outlined),
                                    onTap: () {
                                      setState(() {
                                        if (isSelected) {
                                          _selectedIngredients.remove(item);
                                        } else {
                                          _selectedIngredients.add(item);
                                        }
                                      });
                                    },
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                );
              },
              orElse: () => Center(child: Text(l10n.error)),
            );
          },
        ),
      ),
    );
  }
}
