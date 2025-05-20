import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RoutineSetCurrentDialog extends StatelessWidget {
  const RoutineSetCurrentDialog({super.key, required this.onConfirm});

  final void Function() onConfirm;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return AlertDialog(
      icon: Icon(Icons.stars),
      title: Text("Set As Current?"), // TODO: Translate
      content: Text(
          "are you sure you want to set [this] routine as your current routine?"), // TODO: Translate
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(locale.cancel),
        ),
        ElevatedButton(
            onPressed: () {
              onConfirm();
              Navigator.pop(context);
            },
            child: Text(locale.confirm)),
      ],
    );
  }
}
