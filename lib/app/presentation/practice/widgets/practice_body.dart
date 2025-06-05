import 'package:dartz/dartz.dart' as dz;
import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_log.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';
import 'package:uniceps/app/presentation/practice/widgets/round_widget.dart';

class PracticeBody extends StatefulWidget {
  const PracticeBody(
      {super.key,
      required this.sets,
      required this.logs,
      required this.onPressed});

  final List<RoutineSet> sets;
  final List<TLog> logs;
  final void Function(RoutineSet s, double weight) onPressed;

  @override
  State<PracticeBody> createState() => _PracticeBodyState();
}

class _PracticeBodyState extends State<PracticeBody> {
  final List<TextEditingController> controllers = [];
  // final List<int> completedSetIndexes = [];
  final List<dz.Tuple2<int, double>> setLog = [];

  @override
  void initState() {
    super.initState();
    for (final _ in widget.sets) {
      controllers.add(TextEditingController());
    }
    for (final log in widget.logs) {
      // completedSetIndexes.add(log.setIndex);
      for (final set in widget.sets) {
        if (set.index == log.setIndex) {
          setLog.add(dz.Tuple2(set.index, log.weight));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: widget.sets.map((i) {
        // final weight =
        return RoundWidget(
          index: i.index,
          reps: i.reps,
          controller: controllers[i.index],
          lastWeight: i.weight,
          isDone: setLog.where((setlog) => setlog.head == i.index).isNotEmpty,
          onTap: () => widget.onPressed(
              i, double.tryParse(controllers[i.index].text) ?? 0),
        );
      }).toList(),
    );
  }
}
