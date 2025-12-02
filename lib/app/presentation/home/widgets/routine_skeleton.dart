import 'package:flutter/material.dart';
import 'package:uniceps/core/widgets/loading_page.dart';

class RoutineSkeleton extends StatelessWidget {
  const RoutineSkeleton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Ink(
          // borderRadius: BorderRadius.circular(15.0),

          // shape: const OutlineInputBorder(
          //   borderRadius: BorderRadius.all(Radius.circular(15)),
          //   borderSide: BorderSide(color: Colors.grey, width: 0.5),
          // ),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(29, 96, 125, 139),
          ),
          // elevation: 1,
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            onTap: onTap,
            child: Center(
              child: onTap != null ? const Icon(Icons.add, size: 50, color: Colors.grey) : const LoadingIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
