import 'package:flutter/material.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class RoutineNameDialog extends StatefulWidget {
  const RoutineNameDialog({super.key, required this.initialName, required this.isCreate, required this.onSubmit});

  final String initialName;
  final bool isCreate;
  final void Function(String name) onSubmit;

  @override
  State<RoutineNameDialog> createState() => _RoutineNameDialogState();
}

class _RoutineNameDialogState extends State<RoutineNameDialog> {
  final _node = FocusNode();
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initialName);
  }

  @override
  void dispose() {
    controller.dispose();
    _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      backgroundColor: colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    widget.isCreate ? Icons.add_task_rounded : Icons.edit_note_rounded,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  widget.isCreate ? "${locale.add} ${locale.newRoutine}" : locale.rename,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 24),
            TextField(
              focusNode: _node,
              controller: controller,
              autofocus: true,
              onTap: () {
                controller.selection = TextSelection(baseOffset: 0, extentOffset: controller.text.length);
              },
              decoration: InputDecoration(
                labelText: locale.name,
                hintText: locale.newRoutine,
                filled: true,
                fillColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: colorScheme.primary, width: 2),
                ),
                prefixIcon: const Icon(Icons.drive_file_rename_outline_rounded),
              ),
              maxLength: 50,
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 24),
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
                    onPressed: () {
                      final name = controller.text.trim();
                      if (name.isNotEmpty) {
                        widget.onSubmit(name);
                        Navigator.pop(context);
                      }
                    },
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: Text(locale.ok),
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
