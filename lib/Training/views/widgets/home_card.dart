import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          padding: EdgeInsets.symmetric(horizontal: 15),
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            // gradient: LinearGradient(
            //   colors: [
            //     Color.fromARGB(255, 170, 29, 76),
            //     Color.fromARGB(255, 139, 34, 158),
            //   ],
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            //   stops: [
            //     0.5,
            //     1,
            //   ],
            // ),
            borderRadius: BorderRadius.circular(15),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "PLayer Name",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
