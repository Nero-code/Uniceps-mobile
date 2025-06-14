import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';
import 'package:uniceps/app/presentation/screens/routine/screens/exercises_selection_screen.dart';

class RoutineItemAddPlacholder extends StatelessWidget {
  const RoutineItemAddPlacholder({super.key, required this.onAdd});

  final void Function(List<ExerciseV2> list) onAdd;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () async {
          final res = await Navigator.push<List<ExerciseV2>>(
              context,
              MaterialPageRoute(
                builder: (c) => const ExercisesSelectionScreen(),
              ));
          if (res == null) return;
          onAdd(res);
        },
        child: Container(
          height: screenSize.height * 0.2,
          width: screenSize.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.white38,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Icon(
            Icons.add_box_rounded,
            color: Colors.grey,
            size: 50,
          ),
        ),
      ),
    );
  }
}
