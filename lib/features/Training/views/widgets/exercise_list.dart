import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Training/services/entities/exercise.dart';
import 'package:uniceps/main_cubit/locale_cubit.dart';

class ExerciseListTile extends StatelessWidget {
  const ExerciseListTile(
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        border: Border.all(
          width: 2.0,
          color: isCompleted
              ? Theme.of(context).colorScheme.secondary
              : Colors.white,
        ),
      ),
      child: Material(
        // color: isCompleted
        // ?
        // const Color(0xFF00A9B9)
        // Colors.green.shade300
        // Theme.of(context).colorScheme.secondary
        // :
        // color: Color.fromARGB(255, 228, 228, 228),
        elevation: 3,
        color: Colors.white,

        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderOnForeground: true,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          onTapUp: (details) {
            onPressed();
          },
          onLongPress: onCheck,
          child: Stack(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      // width: MediaQuery.of(context).size.width * 0.5,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    exercise.name,
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(exercise.notes,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(color: Colors.black)),
                                  Text(exercise.sets,
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
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          // child: CachedNetworkImage(
                          //   imageUrl: imgUrlParser(
                          //       exercise.muscleGroup, exercise.imageUrl),
                          // ),
                          child:
                              Image.memory(exercise.imageBitMap as Uint8List),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              BlocBuilder<LocaleCubit, ChangedLangState>(
                builder: (context, state) {
                  return Positioned(
                    top: 5,
                    right: state.isRtl() ? null : 5,
                    left: state.isRtl() ? 5 : null,
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
                  );
                },
              ),

              // Positioned(
              //   top: 5,
              //   left: 5,
              //   child: Container(
              //     width: 12,
              //     height: 12,
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
      ),
    );
  }
}
