import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SetMeasureDialog extends StatefulWidget {
  const SetMeasureDialog({super.key, required this.title, this.initial, required this.onPositive});

  final String title;
  final String? initial;
  final void Function(double val) onPositive;

  @override
  State<SetMeasureDialog> createState() => _SetMeasureDialogState();
}

class _SetMeasureDialogState extends State<SetMeasureDialog> {
  late final TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initial);
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(widget.title),
      content: SizedBox(
        height: 50,
        child: Center(
          child: SizedBox(
            width: 100,
            child: TextField(
              controller: controller,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
              inputFormatters: [
                // FilteringTextInputFormatter.deny(RegExp(r'[^0-9^\.]')),
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
              ],
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(border: OutlineInputBorder(), isDense: true),
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(locale.cancel),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.green.shade300),
            foregroundColor: const WidgetStatePropertyAll(Colors.white),
          ),
          onPressed: () {
            if (controller.text.isEmpty || controller.text == '.') return;
            widget.onPositive(double.parse(controller.text));
            Navigator.pop(context);
          },
          child: Text(locale.ok),
        ),
      ],
    );
  }
}
