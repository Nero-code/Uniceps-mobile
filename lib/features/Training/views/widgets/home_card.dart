import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Auth/services/enitites/player.dart';
import 'package:uniceps/features/Profile/presentation/bloc/handshake_bloc.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.player,
    required this.onTap,
  });

  // final Gym gym;
  final Player player;
  final VoidCallback onTap;

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
                                player.name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      borderRadius: BorderRadius.circular(5),
                                      value: (player.level -
                                          player.level.toInt()) as double?,
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
                                          text: '${player.level.toInt()}',
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
                          child: BlocBuilder<HandshakeBloc, HandshakeState>(
                            builder: (context, state) {
                              print("HOME CARD PROBE: ${state.runtimeType}");
                              if (state is HandshakeLoadedState) {
                                final url = "$API"
                                    "$HTTP_GYMS"
                                    "$HTTP_GYM_LOGO"
                                    "/${state.handshakes.first.gymId}";
                                print(
                                    "HOME CARD PROBE: ${state.handshakes.first.gymId}");

                                return CachedNetworkImage(
                                  imageUrl: url,
                                  errorWidget: (context, url, error) =>
                                      const Image(
                                    image:
                                        AssetImage("images/logo/Logo-dark.png"),
                                  ),
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                );
                              } else if (state is HandshakeLoadingState) {
                                return const CircularProgressIndicator();
                              }
                              return const Image(
                                image: AssetImage("images/logo/Logo-dark.png"),
                              );
                            },
                          ),
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
