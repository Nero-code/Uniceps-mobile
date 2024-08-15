import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.onTap,
    this.percentage = 0.0,
    this.level = 0,
  });

  final VoidCallback onTap;
  final double percentage;
  final int level;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          // padding: const EdgeInsets.symmetric(vertical: 10.0),
          // height: 100.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // Color.fromARGB(255, 170, 29, 76),
                // Color.fromARGB(255, 139, 34, 158),
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              // stops: [
              //   0.3,
              //   1,
              // ],
            ),
            // boxShadow: [
            //   BoxShadow(
            //     color: Theme.of(context).colorScheme.secondary,
            //     // color: Color.fromARGB(255, 145, 2, 68),
            //     offset: Offset(
            //       1,
            //       1,
            //     ),
            //     blurRadius: 1,
            //   ),
            //   BoxShadow(
            //     color: Theme.of(context).colorScheme.primary,
            //     // color: Color.fromARGB(255, 168, 9, 9),
            //     offset: Offset(
            //       -1,
            //       -1,
            //     ),
            //     blurRadius: 5,
            //   ),
            // ],
            borderRadius: BorderRadius.circular(15),
            // border: Border.all(width: 0.5),
          ),
          child: Material(
            // color: Color(0xFF00A9B9),
            // color: Colors.blueGrey,
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15),
            child: InkWell(
              onTap: onTap,
              highlightColor: Theme.of(context).colorScheme.onBackground,
              borderRadius: BorderRadius.circular(15),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Yazan Abo Shash",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      value: percentage,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  RichText(
                                    text: TextSpan(
                                      text:
                                          "${AppLocalizations.of(context)!.level} ",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '$level',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 15),
                        Container(
                          width: 35,
                          height: 35,
                          decoration: const BoxDecoration(
                            // color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Image(
                              image: AssetImage("images/logo/Logo-dark.png")),
                        ),
                      ],
                    ),
                    // Container(
                    //   child: Material(
                    //     borderRadius: BorderRadius.circular(10.0),
                    //     child: InkWell(
                    //       borderRadius: BorderRadius.circular(10.0),
                    //       onTap: () {},
                    //       child: Padding(
                    //         padding: EdgeInsets.symmetric(
                    //             horizontal: 15.0, vertical: 0.0),
                    //         child: Text("shoulder + neck"),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
