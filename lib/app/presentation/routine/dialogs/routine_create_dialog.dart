import 'package:flutter/material.dart';
import 'package:uniceps/core/logging/app_logger.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class RoutineCreateDialog extends StatefulWidget {
  const RoutineCreateDialog({
    super.key,
    required this.initialName,
    required this.initialDescription,
    required this.isCreate,
    required this.onSubmit,
  });

  final String initialName, initialDescription;
  final bool isCreate;
  final void Function(String name, String description) onSubmit;

  @override
  State<RoutineCreateDialog> createState() => _RoutineCreateDialogState();
}

class _RoutineCreateDialogState extends State<RoutineCreateDialog> {
  final _node = FocusNode();
  late final TextEditingController nameCtl, descriptionCtl;

  @override
  void initState() {
    super.initState();
    nameCtl = TextEditingController(text: widget.initialName);
    descriptionCtl = TextEditingController(text: widget.initialDescription);
  }

  @override
  void dispose() {
    nameCtl.dispose();
    descriptionCtl.dispose();
    _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return AlertDialog(
      backgroundColor: colorScheme.surface,
      scrollable: true,
      content: Column(
        mainAxisSize: MainAxisSize.min,
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
          const SizedBox(height: 16),
          TextField(
            focusNode: _node,
            controller: nameCtl,
            autofocus: true,
            onTap: () {
              nameCtl.selection = TextSelection(baseOffset: 0, extentOffset: nameCtl.text.length);
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
          TextField(
            controller: descriptionCtl,
            autofocus: true,
            decoration: InputDecoration(
              labelText: locale.description,
              hintText: locale.description,
              filled: true,
              fillColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: colorScheme.primary, width: 2),
              ),
            ),
            minLines: 1,
            maxLines: 5,
            textCapitalization: TextCapitalization.words,
            onTap: () {
              descriptionCtl.selection = TextSelection(baseOffset: 0, extentOffset: descriptionCtl.text.length);
            },
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
                    final name = nameCtl.text.trim();
                    final description = descriptionCtl.text.trim();

                    logger.t('duplicateRoutine dialog description: $description');
                    if (name.isNotEmpty) {
                      widget.onSubmit(name, description);
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
    );
  }
}
