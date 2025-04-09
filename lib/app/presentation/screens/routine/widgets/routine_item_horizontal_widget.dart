import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';
import 'package:uniceps/core/constants/constants.dart';

class RoutineItemHorizontalWidget extends StatefulWidget {
  const RoutineItemHorizontalWidget({super.key, required this.item});

  final RoutineItem item;

  @override
  State<RoutineItemHorizontalWidget> createState() =>
      _RoutineItemHorizontalWidgetState();
}

class _RoutineItemHorizontalWidgetState
    extends State<RoutineItemHorizontalWidget> {
  final List<RoutineSet> sets = const [
    RoutineSet(
        id: null,
        apiId: null,
        routineItemId: 0,
        index: 0,
        reps: 12,
        weight: null,
        version: 0,
        isSynced: false),
    RoutineSet(
        id: null,
        apiId: null,
        routineItemId: 0,
        index: 1,
        reps: 10,
        version: 0,
        isSynced: false,
        weight: null),
    RoutineSet(
        id: null,
        apiId: null,
        routineItemId: 0,
        index: 2,
        reps: 8,
        version: 0,
        isSynced: false,
        weight: null),
    RoutineSet(
        id: null,
        apiId: null,
        routineItemId: 0,
        index: 0,
        reps: 12,
        weight: null,
        version: 0,
        isSynced: false),
    RoutineSet(
        id: null,
        apiId: null,
        routineItemId: 0,
        index: 1,
        reps: 10,
        version: 0,
        isSynced: false,
        weight: null),
    RoutineSet(
        id: null,
        apiId: null,
        routineItemId: 0,
        index: 2,
        reps: 8,
        version: 0,
        isSynced: false,
        weight: null),
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      // height: screenSize.width * 0.71,
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // const FlutterLogo(size: 100),
          SizedBox(
            width: screenSize.width * 0.4,
            child: Image.network(
              imgUrlParser(widget.item.exercise.muscleGroup, "6"),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(widget.item.exercise.name, maxLines: 2),
                Text("Muscle Group: ${widget.item.exercise.muscleGroup}"),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...sets.map((e) => Column(
                          children: [
                            Text("${e.index}"),
                            Text("${e.reps}"),
                          ],
                        )),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
