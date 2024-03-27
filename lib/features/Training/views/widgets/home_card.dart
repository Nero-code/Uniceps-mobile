import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/features/Training/views/Screens/Measurements_and_profile_page.dart';

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
            color: Theme.of(context).colorScheme.primary,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.helloWorld,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            value: 0.5,
                            color: Colors.amber,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text("LVL: 9"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 15),
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
