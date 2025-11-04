import 'package:flutter/material.dart';

class AlertBar extends StatelessWidget {
  const AlertBar({
    super.key,
    required this.content,
    this.actionText,
    this.action,
    this.close,
    this.color = const Color.fromRGBO(255, 245, 157, 1),
    this.foregroundColor,
  });

  final Widget? content;
  final String? actionText;
  final void Function()? action;
  final void Function()? close;

  final Color color;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          children: [
            if (close != null)
              IconButton(
                onPressed: close,
                icon: const Icon(Icons.close, size: 20),
                color: foregroundColor,
              ),
            Expanded(
              child: Center(
                child: content,
              ),
            ),
            if (action != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: action,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 5.0),
                    child: Text(
                      actionText ?? '',
                      style: TextStyle(
                          fontSize: 12, color: foregroundColor ?? Colors.teal),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
