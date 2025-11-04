import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CaptainUniCard extends StatelessWidget {
  const CaptainUniCard(
      {super.key,
      required this.imagePath,
      required this.needsFlip,
      required this.content,
      this.background,
      this.gradient});

  final String imagePath;
  final bool needsFlip;
  final String content;
  final Color? background;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
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
            color: background,
            gradient: gradient,
          ),
          child: Row(
            children: [
              SizedBox(width: screenSize.width * .31, height: 75),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      locale.captainUni,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "$content الالتزام التمرين يساعدك بالاقتراب من اهدافك تدرب الان!!الالتزام التمرين يساعدك بالاقتراب من اهدافك تدرب الان!!",
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
            flipX: needsFlip,
            child: Image(
              image: AssetImage(imagePath),
              width: screenSize.width * 0.50,
            ),
          ),
        ),
      ],
    );
  }
}
