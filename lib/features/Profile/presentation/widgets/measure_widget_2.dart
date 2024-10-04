import 'package:flutter/material.dart';
import 'package:uniceps/core/Themes/light_theme.dart';

class MeasureWidget2 extends StatelessWidget {
  const MeasureWidget2({
    super.key,
    required this.title,
    required this.value,
    this.direction = 0,
  });

  final String title, value;
  final int direction;

  final double radius = 25.0;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);
    final theme = Theme.of(context).colorScheme;
    return Material(
      color: secondaryLighter,
      borderRadius: BorderRadius.only(
        topRight: direction < 0
            ? const Radius.circular(0.0)
            : Radius.circular(radius),
        topLeft: direction > 0
            ? const Radius.circular(0.0)
            : Radius.circular(radius),
        bottomLeft: direction > 0
            ? const Radius.circular(0.0)
            : Radius.circular(radius),
        bottomRight: direction < 0
            ? const Radius.circular(0.0)
            : Radius.circular(radius),
      ),
      elevation: 2,
      child: SizedBox(
        width: screen.width * 0.2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                color: theme.primary,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                color: theme.primary,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
