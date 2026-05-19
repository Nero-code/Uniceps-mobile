import 'package:flutter/material.dart';
import 'package:uniceps/l10n/app_localizations.dart';

enum DialogActionType { add, edit, delete, confirm }

class AppDialog extends StatefulWidget {
  final String? title;
  final String? message;
  final String? initialText;
  final String? hintText;
  final IconData? icon;
  final DialogActionType type;
  final void Function(String)? onConfirmText;
  final VoidCallback? onConfirm;
  final bool isTextField;

  const AppDialog({
    super.key,
    this.title,
    this.message,
    this.initialText,
    this.hintText,
    this.icon,
    required this.type,
    this.onConfirmText,
    this.onConfirm,
    this.isTextField = false,
  });

  static Future<void> show({
    required BuildContext context,
    String? title,
    String? message,
    String? initialText,
    String? hintText,
    IconData? icon,
    required DialogActionType type,
    void Function(String)? onConfirmText,
    VoidCallback? onConfirm,
    bool isTextField = false,
  }) {
    return showDialog(
      context: context,
      builder: (context) => AppDialog(
        title: title,
        message: message,
        initialText: initialText,
        hintText: hintText,
        icon: icon,
        type: type,
        onConfirmText: onConfirmText,
        onConfirm: onConfirm,
        isTextField: isTextField,
      ),
    );
  }

  @override
  State<AppDialog> createState() => _AppDialogState();
}

class _AppDialogState extends State<AppDialog> {
  late final TextEditingController _controller;
  final _node = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
  }

  @override
  void dispose() {
    _controller.dispose();
    _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    IconData defaultIcon;
    Color actionColor;
    String actionLabel;

    switch (widget.type) {
      case DialogActionType.add:
        defaultIcon = Icons.add_circle_outline;
        actionColor = Theme.of(context).primaryColor;
        actionLabel = locale.add;
        break;
      case DialogActionType.edit:
        defaultIcon = Icons.edit_outlined;
        actionColor = Theme.of(context).primaryColor;
        actionLabel = locale.edit;
        break;
      case DialogActionType.delete:
        defaultIcon = Icons.delete_outline_rounded;
        actionColor = Colors.red;
        actionLabel = locale.delete;
        break;
      case DialogActionType.confirm:
        defaultIcon = Icons.help_outline_rounded;
        actionColor = Theme.of(context).primaryColor;
        actionLabel = locale.ok;
        break;
    }

    return AlertDialog(
      icon: Icon(widget.icon ?? defaultIcon, color: actionColor),
      title: widget.title != null ? Text(widget.title!) : null,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.message != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(widget.message!, textAlign: TextAlign.center),
            ),
          if (widget.isTextField)
            TextField(
              focusNode: _node,
              controller: _controller,
              decoration: InputDecoration(
                hintText: widget.hintText,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey.shade50),
                  borderRadius: BorderRadius.circular(15),
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
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
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(onPressed: () => Navigator.pop(context), child: Text(locale.cancel)),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  style: widget.type == DialogActionType.delete
                      ? ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white)
                      : null,
                  onPressed: () {
                    if (widget.isTextField) {
                      if (_controller.text.trim().isEmpty) return;
                      widget.onConfirmText?.call(_controller.text.trim());
                    } else {
                      widget.onConfirm?.call();
                    }
                    Navigator.pop(context);
                  },
                  child: Text(actionLabel),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
