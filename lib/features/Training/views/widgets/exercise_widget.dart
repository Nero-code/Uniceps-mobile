import 'package:flutter/material.dart';

class ExerciseWidget extends StatelessWidget {
  const ExerciseWidget({super.key, this.isDone = false});
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        color: isDone
            ? Theme.of(context).colorScheme.inversePrimary
            : const Color.fromARGB(255, 230, 230, 230),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Training Name"),
                Text("15 * 12 * 10"),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Center(child: Text("Image")),
            ),
          ),
        ],
      ),
    );
  }
}
