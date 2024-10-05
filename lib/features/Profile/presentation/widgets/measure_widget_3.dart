import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class MeasureWidget3 extends StatelessWidget {
  const MeasureWidget3({
    super.key,
    required this.title,
    required this.image,
    required this.value,
    required this.isLoading,
    this.isCm = true,
  });

  final String title, image;
  final double value;
  final bool isCm, isLoading;

  final shrinkSize = 50.0;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300, width: 2.0),
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              width: screen.width * 0.2,
              height: screen.width * 0.2,
              image: AssetImage("images/muscle-groups/$image"),
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            Text(
              "${intl.NumberFormat("###,###.#").format(value)} ${isCm ? "Cm" : "Kg"}",
              textDirection: TextDirection.ltr,
            ),
          ],
        ),
      ],
    );
  }
}
