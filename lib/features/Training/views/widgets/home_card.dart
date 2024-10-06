import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_circular_progress_indicator/gradient_circular_progress_indicator.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/widgets/error_widget.dart';
import 'package:uniceps/features/Auth/services/enitites/player.dart';
import 'package:uniceps/features/Profile/presentation/bloc/handshake_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/features/Training/views/bloc/current_gym_bloc.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    // required this.myGym,
    required this.player,
    required this.openGymSheet,
    required this.openQRPopup,
    required this.openSectionSheet,
    required this.section,
  });

  // final Gym myGym;
  final Player player;
  final VoidCallback openGymSheet, openQRPopup, openSectionSheet;
  final String? section;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Stack(
        children: [
          Positioned(
            bottom: 0.0,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: FittedBox(
                child: Material(
                  elevation: 1,
                  color: secondaryLighter,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                  child: InkWell(
                    onTap: openSectionSheet,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 30,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(section ?? "الخطة"),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_drop_down_rounded,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 30),
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
              elevation: 1,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<CurrentGymBloc, CurrentGymState>(
                      builder: (context, state) {
                        if (state is CurrentGymLoadedState) {
                          return Column(
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
                                      // onTap: openQRPopup,
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  // title:
                                                  content: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      QrImageView(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(15.0),
                                                        data: player.uid,
                                                      ),
                                                      const Divider(),
                                                      Center(
                                                        child: Text(
                                                          player.name,
                                                          style: const TextStyle(
                                                              fontSize: 25,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ).build(context));
                                      },
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
                              Row(
                                children: [
                                  CachedNetworkImage(
                                    width: 40,
                                    imageUrl: "$API"
                                        "$HTTP_GYMS"
                                        "$HTTP_GYM_LOGO"
                                        "/${state.current.id}",
                                    imageBuilder: (context, imageProvider) =>
                                        ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image(image: imageProvider),
                                    ),
                                    errorWidget: (context, url, error) {
                                      return const Image(
                                        image: AssetImage(
                                          "images/logo/Logo-dark.png",
                                        ),
                                        width: 30,
                                      );
                                    },
                                  ),
                                  const SizedBox(width: 5),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    // height: 30,
                                    child: Text(
                                      // "${name[0].trim()}"
                                      // "\n"
                                      // "${name[1].trim()}",
                                      // "النادي العربي الرياضي الاوحد",
                                      state.current.name,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.black54,
                                          // color:
                                          //     Theme.of(context).colorScheme.secondary,
                                          fontSize: state.current.name.length <
                                                  14
                                              ? 20
                                              : state.current.name.length <= 20
                                                  ? 15
                                                  : 11,
                                          // fontSize: 35 - myGym.name.length.toDouble(),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),

                              // const SizedBox(height: 5),
                              Column(
                                children: [
                                  Text(
                                    local.endOfSubDate,
                                    style: const TextStyle(
                                      color: Colors.black45,
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 11,
                                    ),
                                  ),
                                  Text(
                                    state.current.end,
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        } else if (state is CurrentGymErrorState) {
                          return ErrorScreenWidget(f: state.f, callback: null);
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                    BlocBuilder<ProfileBloc, ProfileState>(
                      builder: (context, state) {
                        print("HOME CARD PROBE: ${state.runtimeType}");
                        if (state is ProfileLoadedState) {
                          return Center(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.height * 0.13,
                              height: MediaQuery.of(context).size.height * 0.13,
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
                                  progress: -(state.player.level -
                                      state.player.level.toInt()),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "lvl: ${state.player.level.toInt()}",
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      Text(
                                        "${((state.player.level - state.player.level.toInt()) * 100).toInt()}%",
                                        style: const TextStyle(
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// double fontsize(String gymName){
//   switch (gymName.length) {
//     case 14:
//       break;
//     default:
//   }
// }
