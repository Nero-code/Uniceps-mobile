import 'package:flutter/material.dart';

class BoxButton extends StatelessWidget {
  const BoxButton({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.child,
    this.border,
    this.focusedBorder,
    this.borderRadius = 0.0,
    this.onTap,
    this.isActive = false,
    this.isCircle = false,
    this.isFocused = false,
    this.background,
    this.activeChild,
  });

  final double? width, height, padding;
  final double borderRadius;
  final BoxBorder? border, focusedBorder;

  final VoidCallback? onTap;

  final bool isActive, isCircle, isFocused;

  final Color? background;

  final Widget? child, activeChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: isFocused ? focusedBorder ?? border : border,
        borderRadius: isCircle ? null : BorderRadius.circular(borderRadius),
        color: background,
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: isCircle
              ? BorderRadius.circular(5000)
              : BorderRadius.circular(borderRadius - 1),
          onTap: onTap,
          child: Padding(
              padding: EdgeInsets.all(padding ?? 8.0),
              child: isActive ? child : activeChild ?? child),
        ),
      ),
    );
  }
}
