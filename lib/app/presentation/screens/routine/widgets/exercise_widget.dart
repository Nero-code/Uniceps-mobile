import 'package:flutter/material.dart';

class ExerciseWidget extends StatelessWidget {
  const ExerciseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15.0),
      color: Colors.grey.shade200,
      child: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image(
            //   width: 100,
            //   height: 100,
            //   image: AssetImage('images/logo/Logo.png'),
            // ),
            FlutterLogo(size: 100),
            SizedBox(height: 8.0),
            Text("Exercise"),
          ],
        ),
      ),
    );
  }
}
