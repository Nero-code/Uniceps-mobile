import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/constants.dart';

class RoutineSetsSheet extends StatelessWidget {
  const RoutineSetsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(image: NetworkImage(imgUrlParser(4, "6"))),
        Divider(),
        Text("a"),
        Text("a"),
        Text("a"),
        Text("a"),
        Text("a"),
        Text("a"),
      ],
    );
  }
}
