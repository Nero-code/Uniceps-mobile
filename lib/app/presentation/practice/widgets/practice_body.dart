import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_log.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';
import 'package:uniceps/app/presentation/practice/widgets/round_widget.dart';

class PracticeBody extends StatelessWidget {
  const PracticeBody({
    super.key,
    required this.sessionId,
    required this.exId,
    required this.exIndex,
    required this.sets,
    required this.logs,
    required this.totalProgress,
  });
  final int sessionId;
  final int exId;
  final int exIndex;
  final List<RoutineSet> sets;
  final List<TLog> logs;
  final int totalProgress;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      for (int i = 0; i < sets.length; i++) ...[
        RoundWidget(
          // onLog: () {},
          totalProgress: totalProgress,
          sessionId: sessionId,
          exId: exId,
          exIndex: exIndex,
          set: sets[i],
          log: logs.where((l) => l.setIndex == sets[i].index).firstOrNull,
        ),
        if (i != sets.length - 1)
          Divider(
            indent: 20,
            endIndent: 20,
            thickness: 0.5,
            // color: Colors.grey.shade200,
            height: 0.5,
          )
      ]
    ]
        //  sets.map((i) {
        //   return RoundWidget(
        //     // onLog: () {},
        //     totalProgress: totalProgress,
        //     sessionId: sessionId,
        //     exId: exId,
        //     exIndex: exIndex,
        //     set: i,
        //     log: logs.where((l) => l.setIndex == i.index).firstOrNull,
        //   );
        // }).toList(),
        );
  }
}
