import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LimitAlert extends StatelessWidget {
  const LimitAlert({super.key, required this.content});
  final String content;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return AlertDialog(
      icon: const Icon(
        Icons.login,
        size: 40,
      ),
      title: Text(locale.login),
      content: Text(content),
    );
  }
}
