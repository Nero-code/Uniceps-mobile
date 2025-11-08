import 'dart:math';

import 'package:flutter/material.dart';

class MultiFabMenu extends StatefulWidget {
  const MultiFabMenu({super.key});

  @override
  State<MultiFabMenu> createState() => _MultiFabMenuState();
}

class _MultiFabMenuState extends State<MultiFabMenu> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  void _toggle() {
    setState(() => _isOpen = !_isOpen);
    _isOpen ? _controller.forward() : _controller.reverse();
  }

  Widget _buildFab({
    required IconData icon,
    required double offset,
    required VoidCallback onPressed,
  }) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, child) {
        return Transform.translate(
          offset: Offset(0, -offset * _animation.value),
          child: Opacity(
            opacity: _animation.value,
            child: child,
          ),
        );
      },
      child: FloatingActionButton(
        mini: true,
        onPressed: onPressed,
        child: Icon(icon),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final offset = 50.0;
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        _buildFab(icon: Icons.message, offset: offset * 3, onPressed: () => print("Message")),
        _buildFab(icon: Icons.photo, offset: offset * 2, onPressed: () => print("Photo")),
        _buildFab(icon: Icons.location_on, offset: offset, onPressed: () => print("Location")),
        FloatingActionButton(
          mini: true,
          onPressed: _toggle,
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _animation,
          ),
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

class AnimatedStackMenu extends StatefulWidget {
  final List<Widget> children;
  final Widget Function(Animation<double> anim, VoidCallback toggle) toggleButton;
  final double spacing;
  final Duration duration;

  const AnimatedStackMenu({
    super.key,
    required this.children,
    required this.toggleButton,
    this.spacing = 60,
    this.duration = const Duration(milliseconds: 300),
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
              padding: EdgeInsets.only(bottom: offset * _animation.value),
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
      alignment: Alignment.bottomRight,
      clipBehavior: Clip.none,
      children: [
        ..._buildAnimatedChildren(),
        widget.toggleButton(_animation, _toggle),
      ],
    );
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
