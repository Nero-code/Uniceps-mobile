import 'package:flutter/material.dart';

class BackGroungDecoration extends StatelessWidget {
  const BackGroungDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class TriPainter extends CustomPainter {
  final Color mainColor, secondary;
  TriPainter({required this.mainColor, required this.secondary});
  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..style = PaintingStyle.fill
      ..color = mainColor;

    final paint2 = Paint()
      ..style = PaintingStyle.fill
      ..color = secondary;

    // final p1 = Offset(0, size.height * 0.3);
    // final p2 = Offset(50, size.height * 0.2 + 50);
    // final p3 = Offset(0, size.height * 0.2 + 100);

    /// FIRST TRIANGLE
    final path1 = Path()
      ..moveTo(0, size.height * 0.15)
      ..lineTo(size.width * 0.3, size.height * 0.25)
      ..lineTo(0, size.height * 0.35)
      ..close();

    /// SECOND TRIANGLE
    final path2 = Path()
      ..moveTo(size.width, size.height * 0.7)
      ..lineTo(size.width * 0.7, size.height * 0.8)
      ..lineTo(size.width, size.height * 0.9);

    canvas.drawPath(path1, paint1);
    canvas.drawPath(path2, paint2);
    // canvas.drawCircle(
    //   Offset(size.width * 0.0, size.height * 1.2),
    //   size.width * 0.8,
    //   paint,
    // );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
