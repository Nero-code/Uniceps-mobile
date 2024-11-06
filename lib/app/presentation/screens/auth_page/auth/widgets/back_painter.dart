import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;

import 'package:uniceps/core/Themes/light_theme.dart';

class AuthBackPainter extends CustomPainter {
  final perHeight = 0.7;
  final conicTo = 1.0;
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    // path.addOval(
    //   Rect.fromCircle(
    //       center: Offset(size.width * 0.5, -size.height * 0.2),
    //       radius: size.width * 0.7),
    // );
    path.moveTo(0, size.height * perHeight);
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * perHeight);
    path.conicTo(
      size.width * 0.5,
      size.height * conicTo,
      0,
      size.height * perHeight,
      1,
    );

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(
        Offset.zero,
        Offset(size.width, size.height),
        [mainBlueLight, secondaryBlue],
      );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
