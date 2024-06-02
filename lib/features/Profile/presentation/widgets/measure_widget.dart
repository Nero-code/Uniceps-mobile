import 'package:flutter/material.dart';
// import 'package:uniceps/features/Profile/domain/entities/measrument.dart';

class MeasureWidget extends StatelessWidget {
  const MeasureWidget(
      {super.key,
      required this.isSymmetric,
      required this.image,
      required this.number});

  final bool isSymmetric;
  final String image;
  final int number;
  // final Measurement object;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        // gradient: LinearGradient(
        //   colors: [
        //     Colors.grey.shade300,
        //     Theme.of(context).colorScheme.background,
        //     Colors.grey.shade300,
        //   ],
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        // ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage("images/muscle-groups/" + image),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                // Text("L"),
                Text("$number (cm)"),
              ],
            ),
          ),
          if (!isSymmetric)
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text("R"),
                  Text("y (cm)"),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
