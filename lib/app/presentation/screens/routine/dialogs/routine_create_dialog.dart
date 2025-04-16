import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RoutineCreateDialog extends StatelessWidget {
  RoutineCreateDialog({super.key, required this.onCreate});

  final void Function(String name) onCreate;

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return AlertDialog(
      scrollable: true,
      icon: const Icon(
        Icons.post_add_rounded,
        color: Colors.blueGrey,
        size: 60,
      ),
      title: Text("Add Routine"),
      content: TextField(
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
            Navigator.pop(context);
          },
          child: Text(locale.ok),
        ),
      ],
    );
  }
}
