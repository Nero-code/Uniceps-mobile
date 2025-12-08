import 'package:flutter/material.dart';
import 'package:flutter/services.dart';import 'package:uniceps/l10n/app_localizations.dart';

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
    final screen = MediaQuery.sizeOf(context);
    return AlertDialog(
      title: Center(child: Text(widget.title)),
      content: SizedBox(
        height: 50,
        child: Center(
          child: SizedBox(
            width: 100,
            child: TextField(
              autofocus: true,
              controller: controller,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
              inputFormatters: [
                // FilteringTextInputFormatter.deny(RegExp(r'[^0-9^\.]')),
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
              ],
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(isDense: true),
            ),
          ),
        ),
      ),
      actions: [
        SizedBox(
          width: screen.width * .3,
          child: OutlinedButton(
            onPressed: () => Navigator.pop(context),
            child: Text(locale.cancel),
          ),
        ),
        SizedBox(
          width: screen.width * .3,
          child: ElevatedButton(
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
        ),
      ],
    );
  }
}
