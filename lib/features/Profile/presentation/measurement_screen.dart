import 'package:flutter/material.dart';
import 'package:uniceps/features/Profile/presentation/widgets/measure_widget.dart';

class MeasurementScreen extends StatelessWidget {
  const MeasurementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_new),
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(child: Text("17/02/2024")),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward_ios_outlined),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView(
              padding: EdgeInsets.only(bottom: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              children: [
                for (int i = 0; i < 8; i++) MeasureWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
