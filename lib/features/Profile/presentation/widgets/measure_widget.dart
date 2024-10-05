import 'package:flutter/material.dart';
// import 'package:uniceps/features/Profile/domain/entities/measrument.dart';

class MeasureWidget extends StatelessWidget {
  const MeasureWidget({
    super.key,
    required this.title,
    required this.isSymmetric,
    required this.image,
    required this.lValue,
    this.rValue = 0,
    this.isCm = true,
  });

  final bool isSymmetric, isCm;
  final String image, title;
  final double lValue, rValue;
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
        textDirection: TextDirection.ltr,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage("images/muscle-groups/$image"),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(title),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        if (!isSymmetric) const Text("Left"),
                        Text("$lValue ${isCm ? "(Cm)" : "(Kg)"}"),
                      ],
                    ),
                    if (!isSymmetric)
                      Column(
                        children: [
                          const Text("Right"),
                          Text("$rValue ${isCm ? "(Cm)" : "(Kg)"}"),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
