import 'dart:math';

import 'package:flutter/material.dart';

class WaveBottleGauge extends StatefulWidget {
  final double value; // 0.0 to 1.0
  final double size;
  final double width;
  final Color borderColor, fillColor, backgroundColor;

  const WaveBottleGauge({
    super.key,
    required this.value,
    this.size = 200,
    this.width = 4,
    this.borderColor = Colors.grey,
    this.fillColor = Colors.lightBlue,
    this.backgroundColor = Colors.white,
  });

  @override
  State<WaveBottleGauge> createState() => _WaveBottleGaugeState();
}

class _WaveBottleGaugeState extends State<WaveBottleGauge> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat(); // loop forever
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size(widget.size, widget.size),
          painter: _WaveBottlePainter(
            value: widget.value,
            phase: _controller.value * 4 * pi, // animate wave phase
            backgroundColor: widget.backgroundColor,
            borderColor: widget.borderColor,
            fillColor: widget.fillColor,
            width: widget.width,
          ),
        );
      },
    );
  }
}

class _WaveBottlePainter extends CustomPainter {
  final double value;
  final double phase;
  final double width;
  final Color borderColor, fillColor, backgroundColor;

  _WaveBottlePainter({
    required this.value,
    required this.phase,
    required this.width,
    required this.borderColor,
    required this.fillColor,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    // Bottle outline
    final outlinePaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    canvas.drawOval(rect, outlinePaint);

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    canvas.drawOval(rect, backgroundPaint);

    // Clip to bottle shape
    canvas.save();
    canvas.clipPath(Path()..addOval(rect));

    // Wave path
    final wavePath = Path();

    final baseHeight = size.height * (1 - (value == 1 ? 0.95 : value)); // water level
    final amplitude = size.height * (.02); // wave height
    final wavelength = size.width / 2.0;

    wavePath.moveTo(0, baseHeight);
    for (double x = 0; x <= size.width; x++) {
      final y = baseHeight + sin((x / wavelength * 2 * pi) + phase) * amplitude;
      wavePath.lineTo(x, y);
    }
    wavePath.lineTo(size.width, size.height);
    wavePath.lineTo(0, size.height);
    wavePath.close();

    // Fill wave
    final fillPaint = Paint()..color = fillColor;
    if (value > 0) {
      canvas.drawPath(wavePath, fillPaint);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _WaveBottlePainter oldDelegate) =>
      oldDelegate.value != value || oldDelegate.phase != phase;
}
