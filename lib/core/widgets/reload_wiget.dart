import 'package:flutter/material.dart';

class ReloadScreenWiget extends StatelessWidget {
  const ReloadScreenWiget({
    super.key,
    required this.image,
    required this.message,
    required this.callBack,
    this.gapSize = 5,
  });

  final Widget image, message, callBack;
  final double gapSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        image,
        SizedBox(height: gapSize),
        message,
        SizedBox(height: gapSize),
        callBack,
      ],
    );
  }
}
