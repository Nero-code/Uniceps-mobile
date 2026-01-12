import 'package:flutter/material.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class MembershipCongratsDialog extends StatelessWidget {
  const MembershipCongratsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return AlertDialog(
      icon: Icon(Icons.celebration_rounded, color: Colors.amber, size: 60),
      title: Text(locale.congrats),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 5,
        children: [
          Text(locale.congratsContent, textAlign: .center),
          ElevatedButton(onPressed: () => Navigator.pop(context), child: Text(locale.great)),
        ],
      ),
    );
  }
}
