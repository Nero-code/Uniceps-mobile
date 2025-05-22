import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';
import 'package:uniceps/core/constants/constants.dart';

class RoutineItemVerticalWidget extends StatefulWidget {
  const RoutineItemVerticalWidget({super.key, required this.item});

  final RoutineItem item;

  @override
  State<RoutineItemVerticalWidget> createState() =>
      _RoutineItemVerticalWidgetState();
}

class _RoutineItemVerticalWidgetState extends State<RoutineItemVerticalWidget> {
  final List<RoutineSet> sets = const [
    RoutineSet(
        id: null,
        apiId: null,
        routineItemId: 0,
        index: 0,
        reps: 12,
        version: 0,
        isSynced: false),
    RoutineSet(
        id: null,
        apiId: null,
        routineItemId: 0,
        index: 1,
        reps: 10,
        version: 0,
        isSynced: false),
    RoutineSet(
        id: null,
        apiId: null,
        routineItemId: 0,
        index: 2,
        reps: 8,
        version: 0,
        isSynced: false)
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
              imgUrlParser(widget.item.exercise.muscleGroupId, "6"),
            ),
          ),
          const Divider(),
          Text(widget.item.exercise.name),
          Text(
              "Muscle Group: ${widget.item.exercise.muscleGroupId}"), // TODO: Translate
          // const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: sets
                .map((set) => Column(
                      children: [
                        Text("Round ${set.index}"), // TODO: Translate
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
