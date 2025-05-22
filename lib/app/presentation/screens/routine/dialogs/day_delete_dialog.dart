import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';

class DayDeleteDialog extends StatelessWidget {
  const DayDeleteDialog(
      {super.key, required this.onPositive, required this.dayToDelete});

  final RoutineDay dayToDelete;

  final void Function(RoutineDay toDelete) onPositive;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return AlertDialog(
      icon: Icon(
        Icons.delete_forever,
        color: Colors.red.shade300,
        size: 40,
      ),
      title: Text("Delete? ${dayToDelete.name}"), // TODO: Translate
      content: Text(
          "are you sure you want to delete ${dayToDelete.name} all exercises under it will be lost?"), // TODO: Translate
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(locale.cancel),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.red.shade300),
            foregroundColor: const WidgetStatePropertyAll(Colors.white),
          ),
          onPressed: () {
            onPositive(dayToDelete);
            Navigator.pop(context);
          },
          child: Text(locale.ok),
        ),
      ],
    );
  }
}
