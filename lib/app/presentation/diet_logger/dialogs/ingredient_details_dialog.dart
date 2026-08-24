import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/diet_classes/ingredient.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class IngredientDetailsDialog extends StatefulWidget {
  final Ingredient ingredient;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final void Function(double amount)? onAdd;

  const IngredientDetailsDialog({
    super.key,
    required this.ingredient,
    required this.onEdit,
    required this.onDelete,
    this.onAdd,
  });

  @override
  State<IngredientDetailsDialog> createState() => _IngredientDetailsDialogState();
}

class _IngredientDetailsDialogState extends State<IngredientDetailsDialog> {
  late TextEditingController _amountController;
  late double _amount;

  @override
  void initState() {
    super.initState();
    _amount = widget.ingredient.servingSizeInGrams;
    final initialText = _amount % 1 == 0 ? _amount.toInt().toString() : _amount.toString();
    _amountController = TextEditingController(text: initialText);
    _amountController.addListener(_updateAmount);
  }

  @override
  void dispose() {
    _amountController.removeListener(_updateAmount);
    _amountController.dispose();
    super.dispose();
  }

  void _updateAmount() {
    final newAmount = double.tryParse(_amountController.text) ?? 0;
    if (newAmount != _amount) {
      setState(() {
        _amount = newAmount;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final ratio = _amount / widget.ingredient.servingSizeInGrams;

    return AlertDialog(
      title: Text(widget.ingredient.name, style: const TextStyle(fontWeight: FontWeight.bold)),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _infoRow(context, Icons.category, locale.category, widget.ingredient.categoryName),
            _infoRow(
              context,
              Icons.scale,
              locale.servingSize,
              '${widget.ingredient.servingSizeInGrams}${locale.grams}',
            ),
            const Divider(height: 24),
            Text(
              _amount == widget.ingredient.servingSizeInGrams
                  ? locale.nutritionPerServing
                  : '${locale.nutritionPerServing} (${_amount.toStringAsFixed(0)}${locale.grams})',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _nutritionalItem(
              locale.calories,
              '${(widget.ingredient.calories * ratio).toStringAsFixed(0)} ${locale.kcal}',
            ),
            _nutritionalItem(
              locale.protein,
              '${(widget.ingredient.protein * ratio).toStringAsFixed(1)}${locale.grams}',
            ),
            _nutritionalItem(locale.carbs, '${(widget.ingredient.carbs * ratio).toStringAsFixed(1)}${locale.grams}'),
            _nutritionalItem(locale.fats, '${(widget.ingredient.fats * ratio).toStringAsFixed(1)}${locale.grams}'),
            if (widget.ingredient.isUserGenerated) ...[
              const SizedBox(height: 16),
              Text(
                locale.userGeneratedContent,
                style: const TextStyle(fontSize: 12, color: Colors.blueGrey, fontStyle: FontStyle.italic),
              ),
            ],
            if (widget.onAdd != null) ...[
              const Divider(height: 32),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _amountController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        labelText: locale.amountGrams,
                        suffixText: locale.grams,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        isDense: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      if (_amount > 0) {
                        widget.onAdd!(_amount);
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainBlueLight,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(locale.add),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text(locale.ok)),
        if (widget.ingredient.isUserGenerated) ...[
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.blue),
            onPressed: () {
              Navigator.pop(context);
              widget.onEdit();
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              Navigator.pop(context);
              widget.onDelete();
            },
          ),
        ],
      ],
    );
  }

  Widget _infoRow(BuildContext context, IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 18, color: mainBlueLight),
          const SizedBox(width: 8),
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(value),
        ],
      ),
    );
  }

  Widget _nutritionalItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.black87)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
