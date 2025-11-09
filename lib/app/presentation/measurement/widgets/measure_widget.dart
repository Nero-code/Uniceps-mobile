import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class MeasureWidget extends StatelessWidget {
  const MeasureWidget({
    super.key,
    required this.title,
    required this.image,
    required this.value,
    this.isCm = true,
    this.onPressed,
  });

  final String title, image;
  final double? value;
  final bool isCm;
  final VoidCallback? onPressed;

  // final shrinkSize = 50.0;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);
    // final isEdit = onPressed != null;
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: .5),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 3),
                    color: Colors.grey,
                    blurRadius: 3,
                    spreadRadius: -1,
                  ),
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                width: screen.width * .2,
                height: screen.width * .2,
                image: AssetImage(image),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 10),
              ),
              Text(
                "${value != null ? intl.NumberFormat("###,###.#").format(value) : '---'} ${isCm ? "Cm" : "Kg"}",
                textDirection: TextDirection.ltr,
                style: const TextStyle(fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
