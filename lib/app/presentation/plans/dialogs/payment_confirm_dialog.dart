import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaymentConfirmationDialog<bool> extends StatelessWidget {
  const PaymentConfirmationDialog({super.key, required this.planName, required this.onConfirm});
  final String planName;
  final VoidCallback? onConfirm;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(locale.buyPlanQuestion),
      content: Text(locale.buyPlancontent(planName)),
      alignment: Alignment.center,
      actions: [
        Expanded(
          child: OutlinedButton.icon(
            label: Text(locale.cancel),
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, foregroundColor: Colors.white),
          label: Text(
            locale.ok,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          icon: const Icon(Icons.done),
          onPressed: onConfirm,
        ),
      ],
    );
  }
}
