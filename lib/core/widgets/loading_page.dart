import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
    this.size = const Size(45, 45),
    this.indicatorColor = const Color.fromARGB(255, 70, 205, 207),
    this.backgroundColor = Colors.white,
    this.strokeWidth = 5.0,
    this.strokeCap = StrokeCap.round,
    this.elevated = true,
  });

  final Size size;
  final Color indicatorColor, backgroundColor;
  final double strokeWidth;
  final StrokeCap strokeCap;
  final bool elevated;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: size.width,
      height: size.height,
      padding: const EdgeInsets.all(13.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        boxShadow: elevated
            ? const [
                BoxShadow(
                  offset: Offset(0.0, 1.5),
                  color: Color.fromARGB(180, 238, 238, 238),
                  blurRadius: 1,
                  spreadRadius: 1,
                )
              ]
            : null,
      ),
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        strokeCap: strokeCap,
        color: indicatorColor,
      ),
    ));
  }
}
