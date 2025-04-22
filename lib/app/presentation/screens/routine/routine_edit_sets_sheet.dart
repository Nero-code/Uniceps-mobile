import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';
import 'package:uniceps/app/presentation/screens/routine/widgets/set_widget.dart';
import 'package:uniceps/core/constants/constants.dart';

class RoutineSetsSheet extends StatefulWidget {
  const RoutineSetsSheet({
    super.key,
    required this.routineItemId,
  });

  final int routineItemId;

  @override
  State<RoutineSetsSheet> createState() => _RoutineSetsSheetState();
}

class _RoutineSetsSheetState extends State<RoutineSetsSheet> {
  List<TextEditingController> controllers = [];

  @override
  void initState() {
    super.initState();
    controllers.clear();
    // for (final _ in widget.sets) {
    //   controllers.add(TextEditingController());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image(image: NetworkImage(imgUrlParser(4, "6"))),
          const SizedBox(height: 20),
          for (int i = 0; i < controllers.length; i++)
            SetWidget(
                index: i,
                routineItemId: widget.routineItemId,
                controller: controllers[i],
                onRemove: () {})
        ],
      ),
    );
  }
}
