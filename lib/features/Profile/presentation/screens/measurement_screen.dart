import 'package:flutter/material.dart';
// import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/features/Profile/presentation/widgets/measure_widget.dart';

class MeasurementScreen extends StatelessWidget {
  MeasurementScreen({super.key});

  final numbers = [180, 70, 0, 120, 95, 0, 30, 76, 30];
  final trImg = [
    "Height.png",
    "Weight.png",
    "Neck.png",
    "Shoulder.png",
    "Chest.png",
    "Waist.png",
    "ForeArm.png",
    "Thigh.png",
    "Leg.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      appBar: AppBar(
        title: const Text("Uniceps"),
        // backgroundColor: Theme.of(context).colorScheme.background,
        backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      ),
      body: Column(
        children: [
          SizedBox(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios_new),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        "17/02/2024",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward_ios_outlined),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 9,
              itemBuilder: (context, index) {
                return MeasureWidget(
                  isSymmetric: true,
                  number: numbers[index],
                  image: trImg[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
