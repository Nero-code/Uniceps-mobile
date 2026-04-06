import 'package:flutter/material.dart';
import 'package:uniceps/core/Themes/light_theme.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({
    super.key,
    required this.percent,
    required this.title,
    this.textStyle,
    this.color = secondaryBlue,
    this.backgroundColor = Colors.transparent,
    this.progressBackground = Colors.transparent,
    this.dimension = 70.0,
    this.strokeWidth = 7.0,
  });

  final double? percent;
  final Color color, backgroundColor, progressBackground;
  final double dimension, strokeWidth;
  final TextStyle? textStyle;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15.0),
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox.square(
              dimension: dimension,
              child: Stack(
                children: [
                  SizedBox.square(
                    dimension: dimension,
                    child: CircularProgressIndicator(
                      value: percent,
                      strokeAlign: -1.0,
                      strokeWidth: strokeWidth,
                      strokeCap: StrokeCap.round,
                      color: color,
                      backgroundColor: progressBackground,
                    ),
                  ),
                  Center(
                    child: Text(
                      formatProgress(percent),
                      textDirection: TextDirection.ltr,
                      style: textStyle ?? TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade500),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            title,
          ],
        ),
      ),
    );
  }

  String formatProgress(double? progress) {
    return progress == null ? '' : '${(progress * 100).round()}%';
  }
}
