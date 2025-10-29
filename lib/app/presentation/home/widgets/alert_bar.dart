import 'package:flutter/material.dart';

class AlertBar extends StatelessWidget {
  const AlertBar({
    super.key,
    required this.content,
    required this.actionText,
    required this.action,
    this.close,
    this.color = const Color.fromRGBO(255, 245, 157, 1),
  });

  final String content, actionText;
  final void Function() action;
  final void Function()? close;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: action,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                child: Text(
                  actionText,
                  style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(content),
            ),
          ),
          if (close != null)
            IconButton(onPressed: close, icon: const Icon(Icons.close)),
        ],
      ),
    );
  }
}
