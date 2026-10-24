import 'package:flutter/material.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    super.key,
    required this.onConfirm,
    required this.title,
    required this.content,
    required this.color,
    required this.icon,
  });

  final String title, content;
  final VoidCallback onConfirm;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return AlertDialog(
      icon: Icon(icon, color: color, size: 50),
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(content),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(onPressed: () => Navigator.pop(context, false), child: Text(locale.cancel)),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: color),
                  onPressed: () {
                    onConfirm();
                    Navigator.pop(context);
                  },
                  child: Text(locale.confirm),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
