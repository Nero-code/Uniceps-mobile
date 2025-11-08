import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(locale.finish),
      content: Text(locale.finishAlertContent),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(locale.cancel),
        ),
        ElevatedButton(onPressed: () => Navigator.pop(context, true), child: Text(locale.confirm)),
      ],
    );
  }
}
