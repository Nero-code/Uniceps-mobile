import 'package:flutter/material.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class DayAddDialog extends StatelessWidget {
  DayAddDialog({super.key, required this.initialName, required this.onDone}) {
    _controller = TextEditingController(text: initialName);
  }
  late final TextEditingController _controller;
  final String initialName;
  final void Function(String name) onDone;

  final _node = FocusNode();

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return AlertDialog(
      icon: const Icon(Icons.text_fields_rounded),
      title: Text("${locale.add} ${locale.day}"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            focusNode: _node,
            controller: _controller,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey.shade50),
                borderRadius: BorderRadius.circular(15),
              ),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              fillColor: Colors.blueGrey.shade50,
              filled: true,
            ),
            onTap: () {
              if (!_node.hasFocus) {
                _controller.selection = TextSelection(baseOffset: 0, extentOffset: _controller.text.length);
              }
            },
            onTapOutside: (_) => _node.unfocus(),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(onPressed: () => Navigator.pop(context), child: Text(locale.cancel)),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (_controller.text.isEmpty) return;
                    onDone(_controller.text);
                    Navigator.pop(context);
                  },
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
