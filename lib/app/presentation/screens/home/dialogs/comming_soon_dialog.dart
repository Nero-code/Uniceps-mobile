import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CommingSoonDialog extends StatelessWidget {
  const CommingSoonDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return AlertDialog.adaptive(
      icon: const Image(
        width: 100,
        height: 100,
        image: AssetImage("images/logo/Logo.png"),
      ),
      title: Text(local.commingSoon),
      content: const Text(
          "this message should be descriptive of what should the user expect"),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text(local.ok),
        ),
      ],
    );
  }
}
