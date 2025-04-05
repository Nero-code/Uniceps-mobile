import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';
import 'package:uniceps/core/constants/constants.dart';

class RoutineItemWidget extends StatefulWidget {
  const RoutineItemWidget({super.key, required this.exercise});

  final ExerciseV2 exercise;

  @override
  State<RoutineItemWidget> createState() => _RoutineItemWidgetState();
}

class _RoutineItemWidgetState extends State<RoutineItemWidget> {
  final List<RoutineSets> sets = const [
    RoutineSets(id: null, apiId: null, index: 0, reps: 12, weight: null),
    RoutineSets(id: null, apiId: null, index: 1, reps: 10, weight: null),
    RoutineSets(id: null, apiId: null, index: 2, reps: 8, weight: null),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const FlutterLogo(size: 100),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              imgUrlParser(widget.exercise.muscleGroup, "6"),
            ),
          ),
          const Divider(),
          Text(widget.exercise.name),
          Text("Muscle Group: ${widget.exercise.muscleGroup}"),
          // const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: sets
                .map((set) => Column(
                      children: [
                        Text("Round ${set.index}"),
                        Text("${set.reps} "),
                      ],
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
