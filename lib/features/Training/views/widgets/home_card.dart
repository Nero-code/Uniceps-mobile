import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          height: MediaQuery.of(context).size.height * 0.1,
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
              stops: [
                0.3,
                1,
              ],
            ),
            // boxShadow: [
            //   BoxShadow(
            //     // color: Theme.of(context).colorScheme.onBackground,
            //     color: const Color.fromARGB(146, 0, 0, 0),
            //     offset: Offset(
            //       0,
            //       2,
            //     ),
            //     blurRadius: 3,
            //   ),
            // ],
            borderRadius: BorderRadius.circular(15),
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
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            // AppLocalizations.of(context)!.helloWorld,
                            "Yazan Abo Shash",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: LinearProgressIndicator(
                                  value: 0.5,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                              ),
                              const SizedBox(width: 10),
                              RichText(
                                text: TextSpan(
                                  text: "Level: ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '9',
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
                      child:
                          Image(image: AssetImage("images/logo/Logo-dark.png")),
                    ),
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
