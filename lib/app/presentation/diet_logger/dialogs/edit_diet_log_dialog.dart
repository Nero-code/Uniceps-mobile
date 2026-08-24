import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_log.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class EditDietLogDialog extends StatefulWidget {
  final DietLog log;
  final Function(DietLog updatedLog)? onUpdate;
  final VoidCallback? onDelete;

  const EditDietLogDialog({super.key, required this.log, this.onUpdate, this.onDelete});

  @override
  State<EditDietLogDialog> createState() => _EditDietLogDialogState();
}

class _EditDietLogDialogState extends State<EditDietLogDialog> {
  late TextEditingController _amountController;
  late double _currentGrams;

  @override
  void initState() {
    super.initState();
    _currentGrams = widget.log.totalGrams;
    _amountController = TextEditingController(text: _currentGrams.toStringAsFixed(0));
    _amountController.addListener(_onAmountChanged);
  }

  void _onAmountChanged() {
    final val = double.tryParse(_amountController.text) ?? 0;
    if (val != _currentGrams) {
      setState(() {
        _currentGrams = val;
      });
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    // Calculate new macros based on ratio if it's not a free log
    // For now, we assume simple proportional scaling for the update preview
    final ratio = widget.log.totalGrams > 0 ? _currentGrams / widget.log.totalGrams : 1.0;
    final newCals = widget.log.calories * ratio;
    final newProt = widget.log.protein * ratio;
    final newCarb = widget.log.carbs * ratio;
    final newFat = widget.log.fats * ratio;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      icon: const Icon(Icons.edit, color: mainBlueLight, size: 50),
      title: Row(
        children: [
          const SizedBox(width: 10),
          Expanded(child: Text(widget.log.ingredientName, style: const TextStyle(fontSize: 18))),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: locale.amountGrams,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              prefixIcon: const Icon(Icons.scale),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: mainBlueLight.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                _MacroRow(label: locale.calories, value: '${newCals.toStringAsFixed(0)} ${locale.kcal}'),
                _MacroRow(label: locale.protein, value: '${newProt.toStringAsFixed(1)}${locale.grams}'),
                _MacroRow(label: locale.carbs, value: '${newCarb.toStringAsFixed(1)}${locale.grams}'),
                _MacroRow(label: locale.fats, value: '${newFat.toStringAsFixed(1)}${locale.grams}'),
              ],
            ),
          ),
        ],
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      actions: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () {
                Navigator.pop(context);
                widget.onDelete?.call();
              },
            ),
            const Spacer(),
            TextButton(onPressed: () => Navigator.pop(context), child: Text(locale.cancel)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: mainBlueLight,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                // Return updated log
                final updated = DietLog(
                  id: widget.log.id,
                  apiId: widget.log.apiId,
                  ingredientName: widget.log.ingredientName,
                  totalGrams: _currentGrams,
                  calories: newCals,
                  protein: newProt,
                  carbs: newCarb,
                  fats: newFat,
                  timestamp: widget.log.timestamp,
                  version: widget.log.version,
                  isSynced: false,
                );
                Navigator.pop(context);
                widget.onUpdate?.call(updated);
              },
              child: Text(locale.save),
            ),
          ],
        ),
      ],
    );
  }
}

class _MacroRow extends StatelessWidget {
  final String label;
  final String value;
  const _MacroRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 13, color: Colors.grey)),
          Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
