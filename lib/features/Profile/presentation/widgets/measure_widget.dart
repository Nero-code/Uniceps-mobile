import 'package:flutter/material.dart';

class MeasureWidget extends StatelessWidget {
  const MeasureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.width * 0.5,
          margin: EdgeInsets.only(top: 60, left: 10, right: 10),
          child: PhysicalModel(
            elevation: 5,
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("L-Arm"),
                    Text("150 cm"),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("R-Arm"),
                    Text("100 cm"),
                  ],
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.lerp(Alignment.topCenter, Alignment.center, 0.3)
              as Alignment,
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Theme.of(context).colorScheme.secondary,
            ),
            // child: Center(
            //   child: Icon(Icons.image),
            // ),
          ),
        ),
      ],
    );
  }
}
