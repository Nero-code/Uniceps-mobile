import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/diet_classes/ingredient.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class AddDietLogSheet extends StatefulWidget {
  const AddDietLogSheet({super.key});

  @override
  State<AddDietLogSheet> createState() => _AddDietLogSheetState();
}

enum _AddMode { search, ingredientForm, manualForm }

class _AddDietLogSheetState extends State<AddDietLogSheet> {
  _AddMode _mode = _AddMode.search;

  // Search & Selection
  final _searchController = TextEditingController();
  Timer? _debounce;
  Ingredient? _selectedIngredient;
  List<Ingredient> _filteredIngredients = [];

  // Manual Form Controllers
  final _nameController = TextEditingController();
  final _amountController = TextEditingController(text: '100');
  final _caloriesController = TextEditingController();
  final _proteinController = TextEditingController();
  final _carbsController = TextEditingController();
  final _fatsController = TextEditingController();

  // Fake data (Would come from a repository)
  final List<Ingredient> _mockIngredients = [
    Ingredient(
      name: 'Chicken Breast',
      categoryId: 0,
      categoryName: 'Meat',
      servingSizeInGrams: 100,
      calories: 165,
      protein: 31,
      carbs: 0,
      fats: 3.6,
      isUserGenerated: false,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
    ),
    Ingredient(
      name: 'Brown Rice',
      categoryId: 0,
      categoryName: 'Grains',
      servingSizeInGrams: 100,
      calories: 111,
      protein: 2.6,
      carbs: 23,
      fats: 0.9,
      isUserGenerated: false,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
    ),
    Ingredient(
      name: 'Whole Egg',
      categoryId: 0,
      categoryName: 'Dairy',
      servingSizeInGrams: 50,
      calories: 70,
      protein: 6,
      carbs: 0.6,
      fats: 5,
      isUserGenerated: false,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
    ),
    Ingredient(
      name: 'Oats',
      categoryId: 0,
      categoryName: 'Grains',
      servingSizeInGrams: 100,
      calories: 389,
      protein: 17,
      carbs: 66,
      fats: 7,
      isUserGenerated: false,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
    ),
    Ingredient(
      name: 'Peanut Butter',
      categoryId: 0,
      categoryName: 'Fats',
      servingSizeInGrams: 32,
      calories: 190,
      protein: 8,
      carbs: 6,
      fats: 16,
      isUserGenerated: false,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _amountController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    _nameController.dispose();
    _amountController.dispose();
    _caloriesController.dispose();
    _proteinController.dispose();
    _carbsController.dispose();
    _fatsController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      final query = _searchController.text.toLowerCase();
      if (query.isEmpty) {
        setState(() => _filteredIngredients = []);
        return;
      }
      setState(() {
        _filteredIngredients = _mockIngredients.where((ing) => ing.name.toLowerCase().contains(query)).toList();
      });
    });
  }

  void _selectIngredient(Ingredient ingredient) {
    setState(() {
      _selectedIngredient = ingredient;
      _mode = _AddMode.ingredientForm;
    });
  }

  void _switchToManual() {
    setState(() {
      _mode = _AddMode.manualForm;
      _nameController.text = _searchController.text;
    });
  }

  void _backToSearch() {
    setState(() {
      _mode = _AddMode.search;
      _selectedIngredient = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return DraggableScrollableSheet(
      initialChildSize: 0.95,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, controller) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 5,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
            ),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: _buildCurrentMode(controller, locale),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentMode(ScrollController controller, AppLocalizations locale) {
    switch (_mode) {
      case _AddMode.search:
        return _buildSearchStep(controller, locale);
      case _AddMode.ingredientForm:
        return _buildIngredientForm(controller, locale);
      case _AddMode.manualForm:
        return _buildManualForm(controller, locale);
    }
  }

  Widget _buildSearchStep(ScrollController controller, AppLocalizations locale) {
    return Column(
      key: const ValueKey('search'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          locale.addDietLog,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: mainBlueDark),
        ),
        const SizedBox(height: 15),
        TextField(
          controller: _searchController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: locale.searchFood,
            prefixIcon: const Icon(Icons.search, color: mainBlueLight),
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
          ),
        ),
        const SizedBox(height: 15),
        ListTile(
          onTap: _switchToManual,
          leading: const CircleAvatar(
            backgroundColor: secondaryBlueLight,
            child: Icon(Icons.edit, color: secondaryBlue),
          ),
          title: Text(locale.addCustomEntry, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(locale.manuallyEnterMacros),
          trailing: const Icon(Icons.chevron_right),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          tileColor: secondaryBlueLight.withValues(alpha: 0.2),
        ),
        const SizedBox(height: 10),
        const Divider(),
        Expanded(
          child: _filteredIngredients.isEmpty
              ? Center(
                  child: Text(
                    _searchController.text.isEmpty ? locale.typeToFindIngredients : locale.noResultsFound,
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                )
              : ListView.builder(
                  controller: controller,
                  itemCount: _filteredIngredients.length,
                  itemBuilder: (context, index) {
                    final ing = _filteredIngredients[index];
                    return ListTile(
                      title: Text(ing.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                      subtitle: Text('${ing.calories} ${locale.kcal} per ${ing.servingSizeInGrams}${locale.grams}'),
                      onTap: () => _selectIngredient(ing),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildIngredientForm(ScrollController controller, AppLocalizations locale) {
    final ing = _selectedIngredient!;
    return ListView(
      controller: controller,
      key: const ValueKey('ing_form'),
      children: [
        FormHeader(title: ing.name, onBack: _backToSearch),
        const SizedBox(height: 20),
        FormTextField(
          controller: _amountController,
          label: locale.amountGrams,
          icon: Icons.scale,
          keyboardType: TextInputType.number,
          autofocus: true,
        ),
        const SizedBox(height: 20),
        IngredientNutritionPreview(ingredient: ing, amount: double.tryParse(_amountController.text) ?? 0),
        const SizedBox(height: 30),
        SubmitButton(label: locale.addToDailyLog, onPressed: () => Navigator.pop(context)),
      ],
    );
  }

  Widget _buildManualForm(ScrollController controller, AppLocalizations locale) {
    return ListView(
      controller: controller,
      key: const ValueKey('manual_form'),
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _backToSearch,
          alignment: AlignmentDirectional.centerStart,
        ),
        const SizedBox(height: 10),
        FormHeader(title: locale.customEntry, onBack: null),
        const SizedBox(height: 10),
        FormTextField(controller: _nameController, label: locale.entryName, icon: Icons.title, autofocus: true),
        const SizedBox(height: 15),
        FormTextField(
          controller: _amountController,
          label: locale.amountGrams,
          icon: Icons.scale,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 25),
        Text(
          locale.macros,
          style: const TextStyle(fontWeight: FontWeight.bold, color: mainBlueDark),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: FormTextField(
                controller: _caloriesController,
                label: locale.calories,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: FormTextField(
                controller: _proteinController,
                label: '${locale.protein} (${locale.grams})',
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: FormTextField(
                controller: _carbsController,
                label: '${locale.carbs} (${locale.grams})',
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: FormTextField(
                controller: _fatsController,
                label: '${locale.fats} (${locale.grams})',
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        SubmitButton(label: locale.saveCustomLog, onPressed: () => Navigator.pop(context)),
      ],
    );
  }
}

class FormHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;
  const FormHeader({super.key, required this.title, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (onBack != null) IconButton(icon: const Icon(Icons.arrow_back), onPressed: onBack),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: mainBlueDark),
          ),
        ),
      ],
    );
  }
}

class FormTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData? icon;
  final TextInputType keyboardType;
  final bool autofocus;

  const FormTextField({
    super.key,
    required this.controller,
    required this.label,
    this.icon,
    this.keyboardType = TextInputType.text,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      autofocus: autofocus,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: icon != null ? Icon(icon, size: 20, color: mainBlueLight) : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.grey, width: .5),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const SubmitButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: mainBlueLight,
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}

class IngredientNutritionPreview extends StatelessWidget {
  final Ingredient ingredient;
  final double amount;

  const IngredientNutritionPreview({super.key, required this.ingredient, required this.amount});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final ratio = amount / ingredient.servingSizeInGrams;
    final calories = ingredient.calories * ratio;
    final protein = ingredient.protein * ratio;
    final carbs = ingredient.carbs * ratio;
    final fats = ingredient.fats * ratio;

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: secondaryBlue.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: secondaryBlue.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(locale.estimatedNutrition, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NutrientSmall(label: locale.calories, value: calories.toStringAsFixed(0)),
              NutrientSmall(label: locale.protein, value: protein.toStringAsFixed(1)),
              NutrientSmall(label: locale.carbs, value: carbs.toStringAsFixed(1)),
              NutrientSmall(label: locale.fats, value: fats.toStringAsFixed(1)),
            ],
          ),
        ],
      ),
    );
  }
}

class NutrientSmall extends StatelessWidget {
  final String label;
  final String value;
  const NutrientSmall({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
      ],
    );
  }
}
