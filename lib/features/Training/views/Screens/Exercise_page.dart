import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:uniceps/features/Training/views/widgets/exercise_widget.dart';

class ExercisesPage extends StatefulWidget {
  ExercisesPage({super.key});

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  final List<int> items = [0, 1, 2, 3, 4, 5];

  final List<int> doneItems = [];

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
      body: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 10),
        itemCount: items.length + doneItems.length,
        itemBuilder: (context, index) {
          if (doneItems.length > index) {
            return Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15),
              color: Colors.amber,
              child: Icon(Icons.done),
            );
          } else if (items.length > 0) {
            return Dismissible(
              key: ValueKey(items[index - doneItems.length]),
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
                print(index);
                print(items);
                print('\n');
                setState(() {
                  items.removeAt(index - doneItems.length);
                  doneItems.add(index);
                });
              },
              child: ExerciseWidget(),
            );
          }
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 10,
          );
        },
      ),
    );
  }
}
