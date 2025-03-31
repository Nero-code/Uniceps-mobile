import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';

class ExercisesListTab extends StatelessWidget {
  const ExercisesListTab({super.key, required this.list});

  final List<ExerciseV2> list;

  // final List<Tuple2<MuscleGroup, List<Exercise>>> exercises = List.generate(
  //   8,
  //   (index) => Tuple2(
  //     arTrSections[index],
  //     [],
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    print(list);
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Text(list[index].name),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
