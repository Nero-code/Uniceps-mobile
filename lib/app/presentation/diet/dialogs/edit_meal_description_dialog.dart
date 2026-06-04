import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_meal.dart';
import 'package:uniceps/app/presentation/diet/blocs/diet_meal/diet_meal_bloc.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class EditMealDescriptionDialog extends StatefulWidget {
  final DietMeal meal;

  const EditMealDescriptionDialog({super.key, required this.meal});

  @override
  State<EditMealDescriptionDialog> createState() => _EditMealDescriptionDialogState();
}

class _EditMealDescriptionDialogState extends State<EditMealDescriptionDialog> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.meal.description ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text('${l10n.edit} ${l10n.description}'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: l10n.description, border: const OutlineInputBorder()),
        maxLines: 5,
        autofocus: true,
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text(l10n.cancel)),
        ElevatedButton(
          onPressed: () {
            final value = _controller.text.trim();
            context.read<DietMealBloc>().add(
              DietMealEvent.updateMeal(
                0, // dayId is ignored by targeted write
                widget.meal.copyWith(description: value.isEmpty ? null : value),
              ),
            );
            Navigator.pop(context);
          },
          child: Text(l10n.save),
        ),
      ],
    );
  }
}
