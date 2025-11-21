import 'package:flutter/material.dart';

class NoReportWidget extends StatelessWidget {
  const NoReportWidget({
    super.key,
    required this.message,
    this.background = const Color.fromARGB(255, 241, 241, 241),
  });
  final String message;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsets.only(top: 8.0),
      color: background,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text(message)),
      ),
    );
  }
}
