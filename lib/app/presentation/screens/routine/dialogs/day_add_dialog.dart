import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DayAddDialog extends StatelessWidget {
  DayAddDialog({super.key, required this.initialName, required this.onDone}) {
    _controller = TextEditingController(text: initialName);
  }
  late final TextEditingController _controller;
  final String initialName;
  final void Function(String name) onDone;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return AlertDialog(
      icon: Icon(Icons.text_fields_rounded),
      title: Text("Add Day"),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15)),
          fillColor: Colors.blueGrey.shade50,
          filled: true,
          // hintText: initialName,
          // hintStyle: TextStyle(color: Colors.grey),
        ),
        onTap: () => _controller.selection =
            TextSelection(baseOffset: 0, extentOffset: _controller.text.length),
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
