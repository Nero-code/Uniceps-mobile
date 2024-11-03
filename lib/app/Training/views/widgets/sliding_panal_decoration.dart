import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:uniceps/core/Themes/light_theme.dart';

class SlidingPanalPainter extends CustomPainter {
  final perHeight = 0.5;
  final conicTo = -1.0;
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();

    path.moveTo(0, size.height * perHeight);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * perHeight);
    path.conicTo(
      size.width * 0.5,
      size.height * conicTo,
      0,
      (size.height * perHeight),
      1,
    );

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = background;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
