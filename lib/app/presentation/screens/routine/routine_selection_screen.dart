import 'package:flutter/material.dart';
import 'package:uniceps/app/presentation/screens/routine/routine_edit_screen.dart';
import 'package:uniceps/app/presentation/screens/routine/widgets/routine_tile.dart';

class RoutineSelectionScreen extends StatelessWidget {
  const RoutineSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RoutineEditScreen(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: [1, 2, 3].map(
          (e) {
            return RoutineTile(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RoutineEditScreen(),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
