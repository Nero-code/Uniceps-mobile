import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_circular_progress_indicator/gradient_circular_progress_indicator.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Auth/services/enitites/player.dart';
import 'package:uniceps/features/Profile/presentation/bloc/gyms_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/handshake_bloc.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.player,
    required this.openGymSheet,
    required this.openQRPopup,
  });

  // final Gym gym;
  final Player player;
  final VoidCallback openGymSheet, openQRPopup;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          // padding: const EdgeInsets.symmetric(vertical: 10.0),
          // height: 100.0,
          decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   colors: [
            //     // Color.fromARGB(255, 170, 29, 76),
            //     // Color.fromARGB(255, 139, 34, 158),
            //     Theme.of(context).colorScheme.primary,
            //     Theme.of(context).colorScheme.secondary,
            //   ],
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            //   // stops: [
            //   //   0.3,
            //   //   1,
            //   // ],
            // ),
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
            // color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            // border: Border.all(width: 0.5),
          ),
          child: Material(
            // color: Color(0xFF00A9B9),
            // color: Colors.blueGrey,
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            elevation: 3,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Material(
                                // elevation: 3,
                                borderRadius: BorderRadius.circular(8),
                                // color: Color.fromARGB(138, 41, 91, 121),
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withAlpha(190),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(8),
                                  onTap: openGymSheet,
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.0, vertical: 3.0),
                                    child: Icon(
                                      Icons.cached,
                                      color: Colors.white,
                                    ),
                                    // Text(
                                    //   "تبديل",
                                    //   style: TextStyle(
                                    //     fontSize: 16,
                                    //     fontWeight: FontWeight.bold,
                                    //     color: Color.fromARGB(
                                    //         255, 255, 255, 255),
                                    //   ),
                                    // ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Material(
                                // elevation: 3,
                                borderRadius: BorderRadius.circular(8),
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withAlpha(100),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(8),
                                  onTap: openQRPopup,
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.0, vertical: 3.0),
                                    child: Icon(Icons.qr_code),
                                    // Text(
                                    //   "111111",
                                    //   style: TextStyle(
                                    //     fontWeight: FontWeight.bold,
                                    //     color: const Color.fromARGB(
                                    //         255, 11, 81, 138),
                                    //   ),
                                    // ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // const SizedBox(height: 5),
                          BlocBuilder<GymsBloc, GymsState>(
                            builder: (context, state) {
                              if (state is GymsLoadedState) {
                                final name = state.list.first.name.split("-");
                                return Row(
                                  children: [
                                    Container(
                                      // color: Colors.amber,
                                      // padding: EdgeInsets.all(1.0),
                                      child: CachedNetworkImage(
                                        width: 60,
                                        imageUrl: "$API"
                                            "$HTTP_GYMS"
                                            "$HTTP_GYM_LOGO"
                                            "/${state.list.first.id}",
                                        errorWidget: (context, url, error) {
                                          return const Image(
                                            image: AssetImage(
                                              "images/logo/Logo-dark.png",
                                            ),
                                            width: 30,
                                          );
                                        },
                                      ),
                                    ),
                                    // SizedBox(width: 5),
                                    Text(
                                      // "${name[0].trim()}"
                                      // "\n"
                                      "${name[1].trim()}",
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          color: Colors.black54,
                                          // color:
                                          //     Theme.of(context).colorScheme.secondary,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                );
                              }
                              return const SizedBox();
                            },
                          ),
                          // const SizedBox(height: 5),
                          Column(
                            children: [
                              // Expanded(
                              //   child: LinearProgressIndicator(
                              //     minHeight: 7,
                              //     borderRadius: BorderRadius.circular(5),
                              //     // backgroundColor:
                              //     // Colors.black.withAlpha(100),
                              //     backgroundColor: Theme.of(context)
                              //         .colorScheme
                              //         .secondary
                              //         .withAlpha(50),
                              //     color: Theme.of(context)
                              //         .colorScheme
                              //         .secondary,
                              //     value: (player.level -
                              //         player.level.toInt()) as double?,

                              //     // color: Colors.black,
                              //   ),
                              // ),
                              Text(
                                "تاريخ نهاية الاشتراك:",
                                style: const TextStyle(
                                  color: Colors.black45,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                ),
                              ),
                              Text(
                                "10/10/2024",
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      BlocBuilder<HandshakeBloc, HandshakeState>(
                        builder: (context, state) {
                          print("HOME CARD PROBE: ${state.runtimeType}");
                          if (state is HandshakeLoadedState) {
                            final url = "$API"
                                "$HTTP_GYMS"
                                "$HTTP_GYM_LOGO"
                                "/${state.handshakes.first.gymId}";
                            print(
                                "HOME CARD PROBE: ${state.handshakes.first.gymId}");

                            return Center(
                              child: SizedBox(
                                width:
                                    MediaQuery.of(context).size.height * 0.13,
                                height:
                                    MediaQuery.of(context).size.height * 0.13,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  // child: CircularProgressIndicator(
                                  //   value: 0.9,
                                  //   strokeCap: StrokeCap.round,
                                  //   strokeWidth: 10,
                                  //   backgroundColor:
                                  //       mainBlueDark.withAlpha(50),
                                  //   // color: Theme.of(context)
                                  //   //     .colorScheme
                                  //   //     .secondary,
                                  //   color: mainBlue,
                                  // ),
                                  child: GradientCircularProgressIndicator(
                                    progress:
                                        -(player.level - player.level.toInt()),
                                    backgroundColor: Colors.grey.shade200,
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Theme.of(context).colorScheme.secondary,
                                        Theme.of(context).colorScheme.primary,
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "lvl: ${player.level.toInt()}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        Text(
                                          "${((player.level - player.level.toInt()) * 100).toInt()}%",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                            // CachedNetworkImage(
                            //   imageUrl: url,
                            //   errorWidget: (context, url, error) =>
                            //       const Image(
                            //     color: Colors.cyan,
                            //     image:
                            //         AssetImage("images/logo/Logo-dark.png"),
                            //   ),
                            //   placeholder: (context, url) =>
                            //       const CircularProgressIndicator(),
                            // );
                          } else if (state is HandshakeLoadingState) {
                            return const CircularProgressIndicator();
                          }
                          return const Image(
                            image: AssetImage("images/logo/Logo-dark.png"),
                          );
                        },
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
      ],
    );
  }
}
