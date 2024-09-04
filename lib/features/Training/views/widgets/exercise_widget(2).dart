import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Training/services/entities/exercise.dart';

class ExerciseWidget2 extends StatelessWidget {
  const ExerciseWidget2(
      {super.key,
      // required this.image,
      // required this.index,
      required this.exercise,
      required this.isCompleted,
      required this.onPressed,
      required this.onCheck});

  final bool isCompleted;
  final VoidCallback onCheck, onPressed;
  // final String image;
  // final int index;
  final Exercise exercise;

  // Color.fromARGB(255, 94, 172, 97)     GREEN

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Material(
      // color: isCompleted
      // ?
      // const Color(0xFF00A9B9)
      // Colors.green.shade300
      // Theme.of(context).colorScheme.secondary
      // :
      // color: Color.fromARGB(255, 228, 228, 228),
      color: isCompleted ? Color.fromARGB(255, 55, 163, 165) : Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderOnForeground: true,
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        onTapUp: (details) {
          onPressed();
        },
        // onLongPress: onCheck,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(14)),
                        child: CachedNetworkImage(
                          imageUrl: imgUrlParser(
                            exercise.muscleGroup,
                            exercise.imageUrl,
                          ),
                          progressIndicatorBuilder: (context, url, progress) {
                            return Center(
                              child: CircularProgressIndicator(
                                  value: progress.progress),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Stack(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Exercise Name Here...",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          color: isCompleted
                                              ? Colors.white
                                              : Colors.black)),
                              Text("Reps: 15 x 3",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          color: isCompleted
                                              ? Colors.white
                                              : Colors.black)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 5,
              right: 5,
              width: 25,
              height: 25,
              child: Checkbox(
                checkColor: theme.background,
                activeColor: theme.secondary,
                side: const BorderSide(width: 0.5, color: Colors.grey),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                value: isCompleted,
                onChanged: (val) {
                  onCheck();
                },
              ),
            ),
            // Positioned(
            //   top: 5,
            //   // left: 5,
            //   right: 5,
            //   child: Container(
            //     width: 25,
            //     height: 25,
            //     alignment: Alignment.center,
            //     decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         border: Border.all(
            //             width: 1,
            //             color: isCompleted ? Colors.white : Colors.grey),
            //         color: isCompleted ? theme.secondary : null),
            //     child: Text(
            //       "${index + 1}",
            //       style: TextStyle(
            //           fontSize: 8,
            //           fontWeight: FontWeight.bold,
            //           color: isCompleted ? theme.secondary : Colors.grey),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
