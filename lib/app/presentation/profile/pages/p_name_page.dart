import 'package:flutter/material.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class PNamePage extends StatelessWidget {
  final TextEditingController controller;

  const PNamePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 80, color: theme.primaryColor),
            const SizedBox(height: 24),
            Text(
              locale.pName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              locale.pNameDescription,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            TextField(
              controller: controller,
              autofocus: true,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
              decoration: InputDecoration(
                hintText: locale.pName,
                border: UnderlineInputBorder(borderSide: BorderSide(color: theme.primaryColor)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
