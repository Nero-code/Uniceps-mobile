import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_log.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';
import 'package:uniceps/app/presentation/practice/widgets/round_widget.dart';

class PracticeBody extends StatefulWidget {
  const PracticeBody({
    super.key,
    required this.sessionId,
    required this.exId,
    required this.exIndex,
    required this.sets,
    required this.logs,
  });
  final int sessionId;
  final int exId;
  final int exIndex;
  final List<RoutineSet> sets;
  final List<TLog> logs;

  @override
  State<PracticeBody> createState() => _PracticeBodyState();
}

class _PracticeBodyState extends State<PracticeBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: widget.sets.map((i) {
        return RoundWidget(
          sessionId: widget.sessionId,
          exId: widget.exId,
          exIndex: widget.exIndex,
          set: i,
          log: widget.logs.where((l) => l.setIndex == i.index).firstOrNull,
        );
      }).toList(),
    );
  }
}
