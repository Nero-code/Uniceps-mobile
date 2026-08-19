import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/diet_classes/ingredient.dart';
import 'package:uniceps/app/presentation/diet_logger/dialogs/add_edit_ingredient_dialog.dart';
import 'package:uniceps/app/presentation/diet_logger/dialogs/ingredient_details_dialog.dart';
import 'package:uniceps/app/presentation/diet_logger/widgets/ingredient_tile.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class IngredientsScreen extends StatefulWidget {
  const IngredientsScreen({super.key});

  @override
  State<IngredientsScreen> createState() => _IngredientsScreenState();
}

class _IngredientsScreenState extends State<IngredientsScreen> {
  final _searchController = TextEditingController();
  final _searchNode = FocusNode();
  int? _selectedCategory;
  String? _searchString;

  // Mock Categories
  List<String> _getCategories(AppLocalizations locale) => [
    locale.all,
    'meat',
    'dairy',
    'grains',
    'fruits',
    'vegetables',
  ];

  // Mock Ingredients
  List<Ingredient> _getMockIngredients(AppLocalizations locale) => List.generate(20, (index) {
    final categories = _getCategories(locale);
    return Ingredient(
      id: index,
      name: index % 2 == 0 ? 'Ingredient $index' : 'User Food $index',
      categoryName: categories[index % 3],
      categoryId: index % 3,
      servingSizeInGrams: 100,
      calories: 100.0 + index,
      protein: 10.0 + index,
      carbs: 20.0 + index,
      fats: 5.0 + index,
      isUserGenerated: index % 5 == 0,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
    );
  });

  @override
  void dispose() {
    _searchController.dispose();
    _searchNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final categories = _getCategories(locale);
    final mockIngredients = _getMockIngredients(locale);
    _selectedCategory ??= 0;

    final filtered = mockIngredients.where((ing) {
      final matchesSearch = ing.name.toLowerCase().contains(_searchController.text.toLowerCase());
      final matchesCategory = _selectedCategory == locale.all || ing.categoryName == _selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();

    return Scaffold(
      backgroundColor: back2,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 160,
            backgroundColor: mainBlueLight,
            leading: const BackButton(color: Colors.white),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                locale.ingredients,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [mainBlue, mainBlueLight],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        locale.ingredientsDbInfo,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.normal, fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _searchController,
                    focusNode: _searchNode,
                    onChanged: (v) => setState(() {}),
                    onTapOutside: (_) => _searchNode.unfocus(),
                    decoration: InputDecoration(
                      hintText: locale.search,
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final cat = categories[index];
                        final isSelected = _selectedCategory == index;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ChoiceChip(
                            label: Text(cat),
                            selected: isSelected,
                            onSelected: (val) => setState(() => _selectedCategory = index),
                            selectedColor: secondaryBlue,
                            checkmarkColor: Colors.white,
                            labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final ing = filtered[index];
              return IngredientTile(ingredient: ing, onTap: () => _showDetailsDialog(ing));
            }, childCount: filtered.length),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 80)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddEditDialog(null),
        backgroundColor: mainBlueLight,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _showAddEditDialog(Ingredient? ingredient) {
    showDialog(
      context: context,
      builder: (context) => AddEditIngredientDialog(ingredient: ingredient),
    );
  }

  void _showDetailsDialog(Ingredient ingredient) {
    showDialog(
      context: context,
      builder: (context) => IngredientDetailsDialog(
        ingredient: ingredient,
        onEdit: () => _showAddEditDialog(ingredient),
        onDelete: () => _showDeleteConfirm(ingredient),
        onAdd: (amount) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Logged ${amount.toStringAsFixed(0)}g of ${ingredient.name}')));
        },
      ),
    );
  }

  void _showDeleteConfirm(Ingredient ingredient) {
    final locale = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(locale.deleteIngredient),
        content: Text(locale.deleteConfirm(ingredient.name)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(locale.cancel)),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(locale.delete, style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
