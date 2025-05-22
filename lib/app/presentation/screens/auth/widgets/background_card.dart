import 'package:flutter/material.dart';
// import 'package:uniceps/core/Themes/light_theme.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key, this.child, this.back});

  final Widget? child;
  final Color? back;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: back ?? Theme.of(context).colorScheme.surface,
      ),
      child: child,
    );
  }
}
