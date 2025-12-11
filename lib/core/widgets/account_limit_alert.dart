import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/app_routes.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class AccountLimitAlert extends StatelessWidget {
  const AccountLimitAlert({super.key, required this.content});
  final String content;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return AlertDialog(
      icon: const Icon(Icons.login, size: 40),
      title: Text(locale.login),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(content, textAlign: TextAlign.center),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.auth),
            child: Text(locale.signin),
          ),
        ],
      ),
    );
  }
}
