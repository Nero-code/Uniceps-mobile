import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';
import 'package:uniceps/core/constants/constants.dart';

class ExerciseGridWidget extends StatelessWidget {
  const ExerciseGridWidget({
    super.key,
    required this.exercise,
    this.isSelected = false,
  });

  final ExerciseV2 exercise;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Durations.short4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        // color: isSelected ? Colors.green :
        color: Colors.white,
        border: Border.all(
            width: 2, color: isSelected ? Colors.cyan.shade200 : Colors.white),
      ),
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(imgUrlParser(exercise.muscleGroup, exercise.imageUrl)),
          // const FlutterLogo(size: 100),
          // Image.network(
          //   imgUrlParser(exercise.muscleGroup, exercise.imageUrl),
          // ),
          Text(
            exercise.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
