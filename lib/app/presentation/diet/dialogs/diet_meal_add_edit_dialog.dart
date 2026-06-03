import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_meal.dart';
import 'package:uniceps/app/presentation/diet/blocs/diet_meal/diet_meal_bloc.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class DietMealAddEditDialog extends StatefulWidget {
  final int dayId;
  final DietMeal? meal;
  final String? defaultName;

  const DietMealAddEditDialog({super.key, required this.dayId, this.meal, this.defaultName});

  @override
  State<DietMealAddEditDialog> createState() => _DietMealAddEditDialogState();
}

class _DietMealAddEditDialogState extends State<DietMealAddEditDialog> {
  late TextEditingController _nameController;
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.meal?.name ?? widget.defaultName ?? '');
    _descController = TextEditingController(text: widget.meal?.description ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AlertDialog(
      scrollable: true,
      title: Text(widget.meal == null ? l10n.addMeal : l10n.rename),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(hintText: l10n.pName),
            autofocus: true,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _descController,
            decoration: InputDecoration(hintText: l10n.description),
            minLines: 1,
            maxLines: 5,
          ),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text(l10n.cancel)),
        ElevatedButton(
          onPressed: () {
            final name = _nameController.text.trim();
            final description = _descController.text.trim();
            if (name.isNotEmpty) {
              if (widget.meal == null) {
                context.read<DietMealBloc>().add(
                  DietMealEvent.addMeal(
                    widget.dayId,
                    DietMeal(
                      name: name,
                      description: description.isEmpty ? null : description,
                      index: 0,
                      ingredients: [],
                    ),
                  ),
                );
              } else {
                context.read<DietMealBloc>().add(
                  DietMealEvent.updateMeal(
                    widget.dayId,
                    widget.meal!.copyWith(name: name, description: description.isEmpty ? null : description),
                  ),
                );
              }
              Navigator.pop(context);
            }
          },
          child: Text(l10n.save),
        ),
      ],
    );
  }
}
