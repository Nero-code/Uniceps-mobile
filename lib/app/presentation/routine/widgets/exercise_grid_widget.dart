import 'package:flutter/material.dart';
import 'package:uniceps/app/data/services/media_helper.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/injection_dependency.dart';

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
            child: FutureBuilder(
              future: sl<MediaHelper>().getImage(exercise.apiId),
              builder: (context, asyncSnapshot) {
                if (asyncSnapshot.connectionState == .done) {
                  if (asyncSnapshot.data != null) {
                    return Image.memory(asyncSnapshot.data!);
                  }
                  return Icon(Icons.broken_image_rounded, size: 60, color: Colors.grey.shade300);
                }
                return LoadingIndicator(elevated: false, backgroundColor: Colors.transparent);
              },
            ),
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
