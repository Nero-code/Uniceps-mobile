import 'package:flutter/material.dart';

class WheelScrollDemo extends StatelessWidget {
  const WheelScrollDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListWheelScrollView.useDelegate(
          itemExtent: 120, // height of each item
          perspective: 0.003, // controls 3D depth
          diameterRatio: 3.0, // how “curved” the wheel looks
          physics: const FixedExtentScrollPhysics(),
          childDelegate: ListWheelChildBuilderDelegate(
            builder: (context, index) {
              return Card(
                color: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    "Item $index",
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
            childCount: 20,
          ),
        ),
      ),
    );
  }
}

class HorizontalWheelDemo extends StatelessWidget {
  const HorizontalWheelDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RotatedBox(
          quarterTurns: 1, // rotate 90 degrees
          child: ListWheelScrollView.useDelegate(
            itemExtent: 120,
            perspective: 0.003,
            diameterRatio: 2.0,
            physics: const FixedExtentScrollPhysics(),
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index) {
                return RotatedBox(
                  quarterTurns: -1, // rotate items back upright
                  child: Card(
                    color: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        "Item $index",
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ),
      ),
    );
  }
}
