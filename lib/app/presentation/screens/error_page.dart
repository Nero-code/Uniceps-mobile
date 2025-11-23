import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    required this.message,
    this.icon = const Icon(Icons.warning_rounded, size: 30, color: Colors.red),
    this.gap = 10.0,
    this.actions = const [],
  });

  final String message;
  final Widget icon;
  final double gap;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          icon,
          SizedBox(height: gap),
          Text(message),
          SizedBox(height: gap),
          Row(
            children: actions,
          ),
        ],
      ),
    );
  }
}
