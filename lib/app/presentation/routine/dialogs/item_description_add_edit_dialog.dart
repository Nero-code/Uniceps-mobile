import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/routine/blocs/items_edit/items_edit_bloc.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class ItemDescriptionAddEditDialog extends StatefulWidget {
  const ItemDescriptionAddEditDialog({
    super.key,
    required this.dayId,
    required this.itemId,
    required this.exerciseName,
    this.onConfirm,
    this.oldDescription,
  });

  final int dayId;
  final int itemId;

  final String exerciseName;
  final String? oldDescription;

  final void Function(String? val)? onConfirm;
  @override
  State<ItemDescriptionAddEditDialog> createState() => _ItemDescriptionAddEditDialogState();
}

class _ItemDescriptionAddEditDialogState extends State<ItemDescriptionAddEditDialog> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.oldDescription);
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return AlertDialog(
      icon: const Icon(Icons.edit),
      title: Text(widget.exerciseName),
      content: TextField(
        controller: controller,
        minLines: 1,
        maxLines: 5,
        decoration: InputDecoration(hint: Text(locale.addExerciseDescription)),
      ),
      actions: [
        OutlinedButton(onPressed: () => Navigator.pop(context), child: Text(locale.cancel)),
        ElevatedButton(
          onPressed: () {
            context.read<ItemsEditBloc>().add(
              UpdateRoutineItemDescription(
                dayId: widget.dayId,
                itemId: widget.itemId,
                description: controller.text.isEmpty ? null : controller.text,
              ),
            );
            widget.onConfirm?.call(controller.text.isEmpty ? null : controller.text);
            Navigator.pop(context);
          },
          child: Text(locale.ok),
        ),
      ],
    );
  }
}
