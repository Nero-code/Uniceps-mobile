import 'package:flutter/material.dart';

class AppBackgroundWrapper extends StatelessWidget {
  const AppBackgroundWrapper({
    super.key,
    required this.child,
    this.showDecorations = true,
    this.gradient,
    this.decorationOpacity = 0.08,
  });

  final Widget child;
  final bool showDecorations;
  final Gradient? gradient;
  final double decorationOpacity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final screen = MediaQuery.sizeOf(context);

    final effectiveGradient =
        gradient ??
        LinearGradient(
          colors: [theme.primary, theme.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [.3, .7],
        );

    final decorationColor = Colors.white.withAlpha((decorationOpacity * 255).round());

    return Stack(
      children: [
        // Background Gradient
        Container(
          width: screen.width,
          height: screen.height,
          decoration: BoxDecoration(gradient: effectiveGradient),
        ),

        // Refined Watermark Decorations
        if (showDecorations) ...[
          Positioned(top: -180, left: -180, child: Icon(Icons.close_rounded, size: 450, color: decorationColor)),
          Positioned(
            top: -80,
            right: -180,
            child: Icon(Icons.local_fire_department, size: 450, color: decorationColor),
          ),
          Positioned(
            bottom: -80,
            left: -180,
            child: Icon(Icons.local_fire_department, size: 450, color: decorationColor),
          ),
          Positioned(bottom: -180, right: -180, child: Icon(Icons.close_rounded, size: 450, color: decorationColor)),
        ],

        // Main Screen Content
        child,
      ],
    );
  }
}
