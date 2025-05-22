import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RoutineNameDialog extends StatelessWidget {
  RoutineNameDialog(
      {super.key,
      required this.initialName,
      required this.title,
      required this.onSubmit});

  final String initialName, title;
  final void Function(String name) onSubmit;

  final _node = FocusNode();

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    controller.text = initialName;
    return AlertDialog(
      scrollable: true,
      icon: const Icon(
        Icons.post_add_rounded,
        color: Colors.blueGrey,
        size: 60,
      ),
      title: Text(title),
      content: TextField(
        focusNode: _node,
        onTap: () {
          if (!_node.hasFocus) {
            controller.selection = TextSelection(
                baseOffset: 0, extentOffset: controller.text.length);
          }
        },
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
        maxLength: 100,
        buildCounter: (context,
                {required currentLength,
                required isFocused,
                required maxLength}) =>
            const SizedBox(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(locale.cancel),
        ),
        ElevatedButton(
          onPressed: () {
            onSubmit(controller.text.trim());
            Navigator.pop(context);
          },
          child: Text(locale.ok),
        ),
      ],
    );
  }
}
