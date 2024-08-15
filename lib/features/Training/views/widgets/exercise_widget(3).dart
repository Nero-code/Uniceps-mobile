import 'package:flutter/material.dart';

class ExerciseWidget3 extends StatelessWidget {
  const ExerciseWidget3(
      {super.key,
      required this.image,
      required this.index,
      required this.isCompleted,
      required this.onPressed,
      required this.onCheck});

  final bool isCompleted;
  final VoidCallback onCheck, onPressed;
  final String image;
  final int index;

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
      color: isCompleted ? Colors.grey.shade200 : Colors.white,
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
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(1),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(14)),
                        child: Image(image: AssetImage(image)),
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
            // Positioned(
            //   top: 0,
            //   left: 0,
            //   child: Checkbox(
            //     checkColor: Theme.of(context).colorScheme.background,
            //     activeColor: Theme.of(context).colorScheme.secondary,
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(5)),
            //     value: isCompleted,
            //     onChanged: (val) {
            //       onCheck();
            //     },
            //   ),
            // ),
            Positioned(
              top: 5,
              left: 5,
              child: Container(
                width: 12,
                height: 12,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: 1,
                        color: isCompleted ? Colors.white : Colors.grey),
                    color: isCompleted ? theme.secondary : null),
                child: Text(
                  "${index + 1}",
                  style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: isCompleted ? theme.secondary : Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
