import 'package:flutter/material.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class RoutineImportExportDialog extends StatelessWidget {
  const RoutineImportExportDialog({
    super.key,
    required this.onConfirm,
    required this.title,
    required this.content,
    required this.isIn,
  });

  final VoidCallback onConfirm;
  final String title, content;
  final bool isIn;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final ar = Directionality.of(context) == TextDirection.rtl;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      backgroundColor: colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: colorScheme.primary.withValues(alpha: 0.1), shape: BoxShape.circle),
              child: Icon(
                isIn ? Icons.download_rounded : Icons.ios_share_rounded,
                color: colorScheme.primary,
                size: 32,
              ),
            ),
            const SizedBox(height: 20),
            Text("$title${ar ? '؟' : '?'}", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(color: colorScheme.onSurfaceVariant, fontSize: 16),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: Text(locale.cancel),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
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
      ),
    );
  }
}
