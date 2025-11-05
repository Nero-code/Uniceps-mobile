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
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return AlertDialog(
      icon: const Icon(Icons.edit),
      title: const Text("Change Name"), // TODO: Translate
      content: TextField(
        controller: controller,
        decoration: InputDecoration(
          // contentPadding:
          //     const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
          hintText: oldDay.name,

          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15)),
          fillColor: Colors.blueGrey.shade50,
          filled: true,
          // hintText: initialName,
          // hintStyle: TextStyle(color: Colors.grey),
        ),
        onTap: () => controller.selection =
            TextSelection(baseOffset: 0, extentOffset: controller.text.length),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(locale.cancel),
        ),
        ElevatedButton(
          onPressed: () {
            if (controller.text.isEmpty || controller.text == oldDay.name) {
              return;
            }

            onSubmit(oldDay.copyWith(name: controller.text));
            Navigator.pop(context, oldDay.copyWith(name: controller.text));
          },
          child: Text(locale.ok),
        ),
      ],
    );
  }
}
