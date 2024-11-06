import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;

import 'package:uniceps/core/Themes/light_theme.dart';

class ProfileBackgroundCircle extends CustomPainter {
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

    // path.conicTo(
    //   (size.width * 0.9), //              x1
    //   (size.height * 0.9), //             y1
    //   (size.width * 0.8), //              x2
    //   (size.height * 0.9), //            y2
    //   (1), //                             w
    // );
    // path.conicTo(
    //   (size.width * 0.7), //              x1
    //   (size.height * 0.9), //             y1
    //   (size.width * 0.66), //              x2
    //   (size.height * 0.7), //             y2
    //   (1), //                             w
    // );
    // path.conicTo(
    //   (size.width * 0.63), //              x1
    //   (size.height * 0.6), //             y1
    //   (size.width * 0.5), //              x2
    //   (size.height * 0.5), //       y2
    //   (1), //                             w
    // );
    // path.conicTo(
    //   (size.width * 0.3), //              x1
    //   (size.height * 0.4), //             y1
    //   (size.width * 0.33), //              x2
    //   (size.height * 0.7), //       y2
    //   (1), //                             w
    // );
    // path.conicTo(
    //   (size.width * 0.3), //              x1
    //   (size.height * 0.5), //   y1
    //   (size.width * 0.3), //              x2
    //   (size.height * perHeight), //       y2
    //   (1), //                             w
    // );

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
