import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:uniceps/features/Training/views/widgets/exercise_widget.dart';

class ExercisesPage extends StatelessWidget {
  ExercisesPage({super.key});

  final List<int> items = List.generate(5, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Uniceps",
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: items.length * 2 - 1,
        itemBuilder: (context, index) {
          if (index % 2 == 0) {
            return Dismissible(
              key: Key("$index"),
              background: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 15),
                color: Colors.amber,
                child: Icon(Icons.done),
              ),
              secondaryBackground: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 15),
                color: Colors.amber,
                child: Icon(Icons.done),
              ),
              direction: DismissDirection.horizontal,
              onDismissed: (direction) {
                items.remove(index);
              },
              child: ExerciseWidget(),
            );
          } else {
            return SizedBox(
              height: 10,
            );
          }
        },
      ),
    );
  }
}
