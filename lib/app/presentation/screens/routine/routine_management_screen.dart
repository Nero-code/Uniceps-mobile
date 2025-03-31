import 'package:flutter/material.dart';
import 'package:uniceps/app/presentation/screens/routine/routine_edit_screen.dart';
import 'package:uniceps/app/presentation/screens/routine/widgets/routine_grid_tile.dart';
import 'package:uniceps/app/presentation/screens/routine/widgets/routine_tile.dart';
import 'package:uniceps/core/fakes/routine_fakes.dart';

class RoutineManagementScreen extends StatelessWidget {
  const RoutineManagementScreen({super.key});
  final gridSpacing = 6.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Routines"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RoutineEditScreen(routineId: 0),
          ),
        ),
        child: const Icon(Icons.add),
      ),
      body: false
          ? GridView(
              padding: EdgeInsets.all(gridSpacing),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.3,
                crossAxisCount: 2,
                mainAxisSpacing: gridSpacing,
                crossAxisSpacing: gridSpacing,
              ),
              children: [1, 2, 3, 4, 5, 6].map(
                (e) {
                  return RoutineGridTile(
                    routine: fakeRoutine,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RoutineEditScreen(),
                      ),
                    ),
                  );
                },
              ).toList(),
            )
          : ListView(
              children: [1, 2, 3].map(
                (e) {
                  return RoutineTile(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RoutineEditScreen(),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
    );
  }
}
