import 'dart:math';

import 'package:flutter/material.dart';

enum Direction {
  top,
  right,
  bottom,
  left,
}

class AnimatedStackMenu extends StatefulWidget {
  final List<Widget> children;
  final Widget Function(Animation<double> anim, VoidCallback toggle) toggleButton;
  final double spacing;
  final Duration duration;
  final Direction direction;

  const AnimatedStackMenu({
    super.key,
    required this.children,
    required this.toggleButton,
    this.spacing = 60,
    this.duration = const Duration(milliseconds: 300),
    this.direction = Direction.top,
  });

  @override
  State<AnimatedStackMenu> createState() => _AnimatedStackMenuState();
}

class _AnimatedStackMenuState extends State<AnimatedStackMenu> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  void _toggle() {
    setState(() => _isOpen = !_isOpen);
    _isOpen ? _controller.forward() : _controller.reverse();
  }

  List<Widget> _buildAnimatedChildren() {
    final count = widget.children.length;
    return List.generate(count, (i) {
      final offset = widget.spacing * (count - i);

      return AnimatedBuilder(
        animation: _animation,
        builder: (_, child) {
          return Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                top: widget.direction == Direction.top ? offset * _animation.value : 0.0,
                right: widget.direction == Direction.right ? offset * _animation.value : 0.0,
                bottom: widget.direction == Direction.bottom ? offset * _animation.value : 0.0,
                left: widget.direction == Direction.left ? offset * _animation.value : 0.0,
              ),
              child: Opacity(
                opacity: _animation.value,
                child: child,
              ),
            ),
          );
        },
        child: widget.children[i],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: alignWithDirection(),
      clipBehavior: Clip.none,
      children: [
        ..._buildAnimatedChildren(),
        widget.toggleButton(_animation, _toggle),
      ],
    );
  }

  Alignment alignWithDirection() {
    switch (widget.direction) {
      case Direction.top:
        return Alignment.topCenter;

      case Direction.right:
        return Alignment.centerRight;

      case Direction.bottom:
        return Alignment.bottomCenter;

      default:
        return Alignment.centerLeft;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

enum RadialDirection { left, right }

class RadialMenu extends StatefulWidget {
  final List<Widget> children;
  final Widget toggleButton;
  final double radius;
  final Duration duration;
  final RadialDirection direction;

  const RadialMenu({
    super.key,
    required this.children,
    required this.toggleButton,
    this.radius = 100,
    this.duration = const Duration(milliseconds: 300),
    this.direction = RadialDirection.right,
  });

  @override
  State<RadialMenu> createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  void _toggle() {
    setState(() => _isOpen = !_isOpen);
    _isOpen ? _controller.forward() : _controller.reverse();
  }

  List<Widget> _buildRadialChildren() {
    final count = widget.children.length;
    if (count == 0) return [];

    final startAngle = widget.direction == RadialDirection.right
        ? 3 * pi / 2 // 270°
        : pi / 2; // 90°

    final endAngle = widget.direction == RadialDirection.right
        ? pi / 2 // 90°
        : 3 * pi / 2; // 270°

    final angleStep = (endAngle - startAngle) / (count - 1);

    return List.generate(count, (i) {
      final angle = startAngle + angleStep * i;
      final dx = cos(angle) * widget.radius;
      final dy = -sin(angle) * widget.radius;

      return AnimatedBuilder(
        animation: _animation,
        builder: (_, child) {
          return Transform.translate(
            offset: Offset(dx * _animation.value, dy * _animation.value),
            child: Opacity(
              opacity: _animation.value,
              child: child,
            ),
          );
        },
        child: widget.children[i],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        ..._buildRadialChildren(),
        GestureDetector(
          onTap: _toggle,
          child: widget.toggleButton,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
