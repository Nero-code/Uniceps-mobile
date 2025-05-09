import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';

class ExerciseGridWidget extends StatelessWidget {
  const ExerciseGridWidget({
    super.key,
    required this.exercise,
    this.index = 0,
    this.isSelected = false,
  });

  final ExerciseV2 exercise;
  final int index;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        // color: isSelected ? Colors.green :
        color: Colors.white,
        border: Border.all(
            width: 2, color: isSelected ? Colors.cyan.shade200 : Colors.white),
      ),
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: CachedNetworkImage(
              imageUrl: exercise.imageUrl,
              progressIndicatorBuilder: (context, url, progress) => Center(
                child: CircularProgressIndicator(value: progress.progress),
              ),
              errorWidget: (context, url, error) => Center(
                child: Icon(
                  Icons.broken_image_rounded,
                  size: 40,
                  color: Colors.red.shade300,
                ),
              ),
            ),

            // Image.network(
            //   imgUrlParser(exercise.muscleGroup.id, exercise.imageUrl),
            //   frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
            //       Center(child: child),
            //   loadingBuilder: (context, child, loadingProgress) =>
            //       loadingProgress != null
            //           ? Center(
            //               child: CircularProgressIndicator(
            //                 value: loadingProgress.cumulativeBytesLoaded /
            //                     loadingProgress.expectedTotalBytes!,
            //               ),
            //             )
            //           : child,
            //   errorBuilder: (context, error, stackTrace) => Icon(
            //     Icons.error,
            //     color: Colors.red,
            //   ),
            // ),
          ),

          // const FlutterLogo(size: 100),
          // Image.network(
          //   imgUrlParser(exercise.muscleGroup, exercise.imageUrl),
          // ),
          Text(
            exercise.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
