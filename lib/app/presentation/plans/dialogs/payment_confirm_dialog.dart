import 'package:flutter/material.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class PaymentConfirmationDialog extends StatelessWidget {
  const PaymentConfirmationDialog({super.key, required this.planName, required this.onConfirm});
  final String planName;
  final VoidCallback? onConfirm;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(locale.buyPlanQuestion),
      content: Column(
        mainAxisSize: .min,
        children: [
          Text(locale.buyPlancontent(planName)),
          SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  label: Text(locale.cancel),
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context, false),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, foregroundColor: Colors.white),
                  label: Text(locale.ok, style: const TextStyle(fontWeight: .bold)),
                  icon: const Icon(Icons.done),
                  onPressed: onConfirm,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
