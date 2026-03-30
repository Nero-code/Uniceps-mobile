import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise.dart';

class ExerciseGridWidget extends StatelessWidget {
  const ExerciseGridWidget({super.key, required this.exercise, this.index = 0, this.isSelected = false});

  final Exercise exercise;
  final int index;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        border: Border.all(width: 2, color: isSelected ? Colors.cyan.shade200 : Colors.white),
      ),
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            // child: CachedNetworkImage(
            //   imageUrl: exercise.imagePath ?? '',
            //   progressIndicatorBuilder: (context, url, progress) =>
            //       Center(child: CircularProgressIndicator(value: progress.progress)),
            //   errorWidget: (context, url, error) =>
            //       Center(child: Icon(Icons.broken_image_rounded, size: 60, color: Colors.grey.shade300)),
            // ),
            child: exercise.imageBitMap != null
                ? Image.memory(exercise.imageBitMap!)
                : Icon(Icons.broken_image_rounded, size: 60, color: Colors.grey.shade300),
          ),

          Divider(color: Colors.grey.shade100),
          Expanded(
            child: Center(
              child: Text(exercise.name, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis),
            ),
          ),
        ],
      ),
    );
  }
}
