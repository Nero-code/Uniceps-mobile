import 'package:flutter/material.dart';

class ExerciseControls extends StatelessWidget {
  const ExerciseControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.arrow_circle_left,
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.done_rounded, color: Colors.green)),
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.arrow_circle_right_sharp,
          ),
        ),
      ],
    );
  }
}
