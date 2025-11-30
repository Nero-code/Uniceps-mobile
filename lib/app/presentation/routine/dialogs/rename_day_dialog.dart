import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';

class RenameDayDialog extends StatelessWidget {
  RenameDayDialog({super.key, required this.oldDay, required this.onSubmit}) {
    controller.text = oldDay.name;
  }
  final controller = TextEditingController();
  final RoutineDay oldDay;
  final void Function(RoutineDay newVal) onSubmit;

  final FocusNode _node = FocusNode();
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return AlertDialog(
      icon: const Icon(Icons.edit),
      title: Text(locale.rename),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              // contentPadding:
              //     const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
              hintText: oldDay.name,
              hintStyle: const TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey.shade50), borderRadius: BorderRadius.circular(15)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              fillColor: Colors.blueGrey.shade50,
              filled: true,
              // hintText: initialName,
              // hintStyle: TextStyle(color: Colors.grey),
            ),
            focusNode: _node,
            onTap: () {
              if (!_node.hasFocus) {
                controller.selection = TextSelection(baseOffset: 0, extentOffset: controller.text.length);
              }
            },
            onTapOutside: (_) => _node.unfocus(),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(locale.cancel),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.text.isEmpty || controller.text == oldDay.name) {
                      return;
                    }

                    onSubmit(oldDay.copyWith(name: controller.text));
                    Navigator.pop(context, oldDay.copyWith(name: controller.text));
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
