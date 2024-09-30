import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:uniceps/core/Themes/light_theme.dart';

class WavePainter extends CustomPainter {
  final perHeight = 1;
  final curve = 0.15;
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(0, size.height * perHeight);
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * perHeight);
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * perHeight * (1 + curve),
      size.width * 0.5,
      size.height * perHeight,
    );
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * perHeight * (1 - curve),
      size.width * 0.0,
      size.height * perHeight,
    );
    // path.close();
    final paint = Paint()
      ..shader = ui.Gradient.linear(
        Offset.zero,
        Offset(0, size.height * (1 + curve)),
        [
          mainBlueDark,
          mainBlueLight,
        ],
      );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
