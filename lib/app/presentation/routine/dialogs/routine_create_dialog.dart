import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RoutineNameDialog extends StatelessWidget {
  RoutineNameDialog({super.key, required this.initialName, required this.isCreate, required this.onSubmit});

  final String initialName;
  final bool isCreate;
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
      title: Text(isCreate ? "${locale.add} ${locale.newRoutine}" : locale.rename),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            focusNode: _node,
            onTap: () {
              if (!_node.hasFocus) {
                controller.selection = TextSelection(baseOffset: 0, extentOffset: controller.text.length);
              }
            },
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
            maxLength: 100,
            buildCounter: (context, {required currentLength, required isFocused, required maxLength}) =>
                const SizedBox(),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(locale.cancel),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    onSubmit(controller.text.trim());
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
