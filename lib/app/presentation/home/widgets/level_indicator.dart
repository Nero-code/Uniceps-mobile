import 'package:flutter/material.dart';
import 'package:gradient_circular_progress_indicator/gradient_circular_progress_indicator.dart';

class LevelIndicator extends StatelessWidget {
  const LevelIndicator({
    super.key,
    this.size = 50,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: GradientCircularProgressIndicator(
        progress: 0.67,
        backgroundColor: Colors.grey.shade200,
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            // Theme.of(context).colorScheme.secondary,
            // Theme.of(context).colorScheme.secondary,
            Colors.amber, Colors.amber,
          ],
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   "lvl: ${5}",
            //   style: const TextStyle(
            //     fontSize: 10,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.black54,
            //   ),
            // ),
            // Text(
            //   "${((0.5 * 100).round() - (0.5 * 100))}%",
            //   style: const TextStyle(
            //     fontSize: 10,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.black54,
            //   ),
            // ),

            Icon(
              Icons.fitness_center_outlined,
              size: 20,
              color: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}
