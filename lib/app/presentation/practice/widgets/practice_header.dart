import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/constants.dart';

class PracticeHeader extends StatelessWidget {
  const PracticeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
                image: const AssetImage(IMG_BACK),
                width: screenSize.width * 0.3),
          ),
          const SizedBox(width: 10),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("------------------------------------"),
              Text("/////////"),
            ],
          )),
        ],
      ),
    );
  }
}
