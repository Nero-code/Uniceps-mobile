import 'package:flutter/material.dart';

class NameDialog extends StatelessWidget {
  final String title;
  final String labelText;
  final String hintText;
  final String cancelText;
  final String confirmText;
  final String? initialValue;
  final void Function(String name)? onConfirm;

  const NameDialog({
    super.key,
    required this.title,
    required this.labelText,
    required this.hintText,
    required this.cancelText,
    required this.confirmText,
    this.initialValue,
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: initialValue);

    return AlertDialog(
      title: Text(title),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(cancelText),
        ),
        ElevatedButton(
          onPressed: () {
            final name = controller.text.trim();
            if (name.isNotEmpty) {
              if (onConfirm != null) {
                onConfirm!(name);
              }
              Navigator.pop(context);
            }
          },
          child: Text(confirmText),
        ),
      ],
    );
  }
}
