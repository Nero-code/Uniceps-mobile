import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/constants.dart';

class GoldPremium extends StatelessWidget {
  const GoldPremium({
    super.key,
    required this.screenSize,
    required this.shift,
  });

  final Size screenSize;
  final double shift;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          // color: Colors.amber.shade300,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.amber.shade700,
              Colors.amber.shade400,
            ],
          ),
          border: Border.all(width: 2, color: Colors.amber),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 3),
              color: Colors.grey.shade300,
              blurRadius: 2,
              spreadRadius: 1,
            ),
          ],
        ),
        width: screenSize.width,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [
                Color.fromARGB(0, 255, 255, 255),
                Colors.white54,
                Colors.white54,
                Color.fromARGB(0, 255, 255, 255),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.4, 0.48, 0.52, 0.6].map((e) => e + shift).toList(),
            ),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                children: [
                  const Image(
                    image: AssetImage(IMG_PREMIUM),
                    // color: Colors.amber.shade700,
                    color: Colors.white,
                    width: 40,
                  ),
                  Image(
                    image: const AssetImage(APP_LOGO_LIGHT),
                    color: Colors.white,
                    width: screenSize.width * .25,
                  ),
                ],
              ),
              const SizedBox(width: 20),
              const Column(
                children: [
                  Text(
                    'Premium',
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '\$3',
                        style: TextStyle(
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '/30 Days',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      // Icon(Icons.calendar_month),
                      Text(
                        'dd/mm/yyyy',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Icon(Icons.keyboard_arrow_down_rounded, size: 15),
                  Text(
                    'dd/mm/yyyy',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
