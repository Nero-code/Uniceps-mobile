import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/constants.dart';

class CaptainUniCard extends StatelessWidget {
  const CaptainUniCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        Container(
          margin:
              EdgeInsets.only(top: screenSize.width * .18, left: 10, right: 10),
          padding: const EdgeInsets.all(8.0),
          width: screenSize.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              SizedBox(width: screenSize.width * .31, height: 75),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "كابتن يوني:",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "الالتزام التمرين يساعدك بالاقتراب من اهدافك تدرب الان!!"
                      "الالتزام التمرين يساعدك بالاقتراب من اهدافك تدرب الان!!"
                      "الالتزام التمرين يساعدك بالاقتراب من اهدافك تدرب الان!!",
                      softWrap: true,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Align(
        //   alignment: Alignment.topRight,
        //   child: Transform.flip(
        //     flipX: true,
        //     child: Image(
        //       image: const AssetImage(IMG_CAP_INFO),
        //       width: screenSize.width * 0.50,
        //     ),
        //   ),
        // ),
        Positioned(
          top: 0.0,
          right: -screenSize.width * 0.05,
          child: Transform.flip(
            flipX: false,
            child: Image(
              image: const AssetImage(IMG_CAP_MOTIVE),
              width: screenSize.width * 0.50,
            ),
          ),
        ),
      ],
    );
  }
}
