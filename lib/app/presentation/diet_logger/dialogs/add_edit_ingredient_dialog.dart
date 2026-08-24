import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_category.dart';
import 'package:uniceps/app/domain/classes/diet_classes/ingredient.dart';
import 'package:uniceps/app/presentation/diet_logger/blocs/ingredients/ingredients_bloc.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class AddEditIngredientDialog extends StatefulWidget {
  final Ingredient? ingredient;
  final List<DietCategory> categories;
  const AddEditIngredientDialog({super.key, this.ingredient, required this.categories});

  @override
  State<AddEditIngredientDialog> createState() => _AddEditIngredientDialogState();
}

class _AddEditIngredientDialogState extends State<AddEditIngredientDialog> {
  final _formKey = GlobalKey<FormState>();

  // Destructured form data variables
  late String _name;
  late int? _categoryId;
  late String _categoryName;
  late double _servingSize;
  late double _calories;
  late double _protein;
  late double _carbs;
  late double _fats;
  late DateTime _createdAt;
  // late bool _isUserGenerated;    ALWAYS TRUE

  @override
  void initState() {
    super.initState();
    // Initialize data from ingredient or defaults
    _name = widget.ingredient?.name ?? '';
    _categoryId = widget.ingredient?.categoryId ?? widget.categories.firstOrNull?.id;
    _categoryName = widget.ingredient?.categoryName ?? '';
    _servingSize = widget.ingredient?.servingSizeInGrams ?? 100.0;
    _calories = widget.ingredient?.calories ?? 0.0;
    _protein = widget.ingredient?.protein ?? 0.0;
    _carbs = widget.ingredient?.carbs ?? 0.0;
    _fats = widget.ingredient?.fats ?? 0.0;
    _createdAt = widget.ingredient?.createdAt ?? DateTime.now();
    // _isUserGenerated = widget.ingredient?.isUserGenerated ?? true;
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final ingredient = Ingredient(
        id: widget.ingredient?.id,
        apiId: widget.ingredient?.apiId,
        name: _name,
        categoryId: _categoryId!,
        categoryName: _categoryName,
        servingSizeInGrams: _servingSize,
        calories: _calories,
        protein: _protein,
        carbs: _carbs,
        fats: _fats,
        updatedAt: DateTime.now(),
        createdAt: _createdAt,
        isUserGenerated: true,
        version: widget.ingredient != null ? widget.ingredient!.version + 1 : 0,
      );
      context.read<IngredientsBloc>().add(.createIngredient(ingredient: ingredient));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final isEditing = widget.ingredient != null;

    return AlertDialog(
      title: Text(isEditing ? locale.edit : locale.addIngredient),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _Field(label: locale.name, initialValue: _name, icon: Icons.title, onSaved: (v) => _name = v ?? ''),
              const SizedBox(height: 10),
              DropdownButtonFormField(
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                initialValue: _categoryId,
                onChanged: (value) => setState(() => _categoryId = value),
                validator: (value) => _categoryId == null ? locale.category : null,
                items: widget.categories.map((c) => DropdownMenuItem(value: c.id, child: Text(c.name))).toList(),
              ),
              const SizedBox(height: 10),
              _Field(
                label: '${locale.servingSize} (${locale.grams})',
                initialValue: _servingSize.toString(),
                icon: Icons.scale,
                keyboardType: TextInputType.number,
                onSaved: (v) => _servingSize = double.tryParse(v ?? '0') ?? 0.0,
              ),
              const SizedBox(height: 20),
              Text(locale.macrosPerServing, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: _Field(
                      label: locale.kcal,
                      initialValue: _calories.toString(),
                      keyboardType: TextInputType.number,
                      onSaved: (v) => _calories = double.tryParse(v ?? '0') ?? 0.0,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _Field(
                      label: locale.protein,
                      initialValue: _protein.toString(),
                      keyboardType: TextInputType.number,
                      onSaved: (v) => _protein = double.tryParse(v ?? '0') ?? 0.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: _Field(
                      label: locale.carbs,
                      initialValue: _carbs.toString(),
                      keyboardType: TextInputType.number,
                      onSaved: (v) => _carbs = double.tryParse(v ?? '0') ?? 0.0,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _Field(
                      label: locale.fats,
                      initialValue: _fats.toString(),
                      keyboardType: TextInputType.number,
                      onSaved: (v) => _fats = double.tryParse(v ?? '0') ?? 0.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text(locale.cancel)),
        ElevatedButton(onPressed: _saveForm, child: Text(isEditing ? locale.save : locale.add)),
      ],
    );
  }
}

class _Field extends StatelessWidget {
  final String label;
  final String initialValue;
  final IconData? icon;
  final TextInputType keyboardType;
  final FormFieldSetter<String>? onSaved;

  const _Field({
    required this.label,
    required this.initialValue,
    this.icon,
    this.keyboardType = TextInputType.text,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: icon != null ? Icon(icon, size: 20) : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        isDense: true,
      ),
      validator: (value) => value == null || value.isEmpty ? '' : null,
      onSaved: onSaved,
    );
  }
}
