import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_log.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';
import 'package:uniceps/core/constants/constants.dart';

class PracticeHeader extends StatelessWidget {
  const PracticeHeader({super.key, required this.item, this.logs = const []});

  final RoutineItem item;
  final List<TLog> logs;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          item.exercise.imageBitMap != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.memory(item.exercise.imageBitMap!,
                      width: screenSize.width * 0.3),
                )
              : const Image(image: AssetImage(IMG_BLANK)),
          const SizedBox(width: 10),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.exercise.name),
              Text("${logs.length} / ${item.sets.length}",
                  textDirection: TextDirection.ltr),
            ],
          )),
        ],
      ),
    );
  }
}
