import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RoutineDeleteDialog extends StatelessWidget {
  const RoutineDeleteDialog({super.key, required this.onConfirm});
  final void Function() onConfirm;
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return AlertDialog(
      icon: Icon(Icons.delete, color: Colors.red, size: 40),
      title: Text("Delete?"),
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
