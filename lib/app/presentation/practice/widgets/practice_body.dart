import 'package:flutter/material.dart';
import 'package:uniceps/app/presentation/practice/widgets/round_widget.dart';

class PracticeBody extends StatefulWidget {
  const PracticeBody({super.key, required this.sets});

  final List<int> sets;

  @override
  State<PracticeBody> createState() => _PracticeBodyState();
}

class _PracticeBodyState extends State<PracticeBody> {
  final List<TextEditingController> controllers = [];

  @override
  void initState() {
    super.initState();
    for (final _ in widget.sets) {
      controllers.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: widget.sets
          .map((i) => RoundWidget(
                index: i + 1,
                reps: 20 - (4 * i),
                controller: controllers[i],
                lastWeight: null,
                isDone: i == 0,
                onTap: () {},
              ))
          .toList(),
    );
  }
}
