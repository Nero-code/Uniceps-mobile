import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      content: TextField(
        focusNode: _node,
        controller: _controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(15)),
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
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(locale.cancel),
        ),
        ElevatedButton(
          onPressed: () {
            if (_controller.text.isEmpty) return;
            onDone(_controller.text);
            Navigator.pop(context);
          },
          child: Text(locale.ok),
        ),
      ],
    );
  }
}
