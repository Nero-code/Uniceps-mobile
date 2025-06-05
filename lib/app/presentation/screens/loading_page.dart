import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 45,
      height: 45,
      padding: const EdgeInsets.all(13.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              offset: Offset(0.0, 1.5),
              color: Color.fromARGB(180, 238, 238, 238),
              blurRadius: 1,
              spreadRadius: 1,
            )
          ]),
      child: CircularProgressIndicator(
        strokeWidth: 5.0,
        strokeCap: StrokeCap.round,
        color: Theme.of(context).colorScheme.secondary,
      ),
    ));
  }
}
