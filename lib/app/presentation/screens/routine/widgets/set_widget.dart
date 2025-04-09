import 'package:flutter/material.dart';

class SetWidget extends StatelessWidget {
  const SetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.drag_handle),
          Text("index"),
          Text("reps"),
          Icon(Icons.close),
        ],
      ),
    );
  }
}
