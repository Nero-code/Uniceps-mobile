import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/widgets/reload_widget.dart';
import 'package:uniceps/features/Auth/views/bloc/auth_bloc.dart';
import 'package:uniceps/features/Auth/views/screens/player_info_screen.dart';
import 'package:uniceps/features/Profile/presentation/bloc/gyms_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/measurment_bloc.dart';
// import 'package:uniceps/features/Auth/views/bloc/auth_bloc.dart';
// import 'package:uniceps/features/Auth/views/screens/player_info_screen.dart';
// import 'package:uniceps/features/Profile/presentation/bloc/gyms_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/profile_bloc.dart';
import 'package:uniceps/features/Profile/presentation/screens/measurement_screen_3.dart';
import 'package:uniceps/features/Profile/presentation/widgets/profile_back_circle.dart';
// import 'package:uniceps/features/Profile/presentation/widgets/settings_tile.dart';
import 'package:uniceps/features/Profile/presentation/widgets/settings_tile_2.dart';
import 'package:uniceps/main_cubit/locale_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// backgroundColor: Theme.of(context).colorScheme.background,
// appBar: AppBar(
//   title: const Text("Uniceps"),
//   // backgroundColor: Theme.of(context).colorScheme.background,
//   backgroundColor: Colors.transparent,
//   actions: [
//     IconButton(
//       onPressed: () {
//         showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 title:
//                     Text(local.logoutAlert),
//                 content: Text(local
//                     .logoutAlertContents),
//                 actions: [
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: Text(local.cancel),
//                   ),
//                   TextButton(
//                     onPressed: () async {
//                       BlocProvider.of<AuthBloc>(context)
//                           .add(LogoutEvent());
//                       final bloc =
//                           await BlocProvider.of<AuthBloc>(context)
//                               .stream
//                               .skip(1)
//                               .first;
//                       print("Test");
//                       print("Bloc: ${bloc.runtimeType}");
//                       if (bloc is AuthLoggedoutState) {
//                         Navigator.pop(context);
//                         Navigator.pop(context);
//                         Navigator.pushReplacementNamed(
//                             context, ROUTE_AUTH);
//                       }
//                     },
//                     child: Text(local.ok),
//                   ),
//                 ],
//               ).build(context);
//             });
//       },
//       icon: const Icon(Icons.logout_rounded),
//     ),
//   ],
// ),

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final screen = MediaQuery.sizeOf(context);
    return BlocBuilder<LocaleCubit, ChangedLangState>(
      builder: (context, st) {
        return Scaffold(
          body: SizedBox(
            width: screen.width,
            height: screen.height,
            child: Stack(
              children: [
                Positioned(
                  bottom: 10.0,
                  child: Center(
                    child: SizedBox(
                      width: screen.width,
                      height: 20,
                      child: const Image(
                        image: AssetImage("images/logo/Logo_Trio.png"),
                      ),
                    ),
                  ),
                ),
                // Container(
                //   height: MediaQuery.of(context).size.height * 0.3,
                //   width: MediaQuery.of(context).size.width,
                //   decoration: BoxDecoration(
                //     borderRadius: ,
                //     gradient: LinearGradient(
                //       colors: [
                //         Theme.of(context).colorScheme.primary,
                //         Theme.of(context).colorScheme.secondary,
                //         // Theme.of(context).colorScheme.background,
                //       ],
                //       begin: Alignment.topCenter,
                //       end: Alignment.bottomCenter,
                //       stops: const [
                //         0.1,
                //         // 0.4,
                //         1,
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                  child: CustomPaint(
                    painter: ProfileBackgroundCircle(),
                  ),
                ),
                SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () async {
                                showDialog(
                                    context: context,
                                    builder: (c) => AlertDialog(
                                          title: Text(local.chooseLang),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              for (var i in Lang.values)
                                                RadioListTile(
                                                    title: Text(i == Lang.en
                                                        ? "English"
                                                        : "العربية"),
                                                    value: st.locale
                                                            .languageCode ==
                                                        i.name,
                                                    groupValue: true,
                                                    onChanged: (newVal) {
                                                      BlocProvider.of<
                                                                  LocaleCubit>(
                                                              context)
                                                          .changeLanguage(
                                                              i.name == "en"
                                                                  ? "en"
                                                                  : "ar");
                                                      Navigator.pop(context);
                                                    }),
                                            ],
                                          ),
                                        ).build(context));
                              },
                              icon: Icon(
                                Icons.language,
                                size: 30,
                                color: Colors.white70,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(local.logoutAlert),
                                        content:
                                            Text(local.logoutAlertContents),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(local.cancel),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              BlocProvider.of<AuthBloc>(context)
                                                  .add(LogoutEvent());
                                              final bloc = await BlocProvider
                                                      .of<AuthBloc>(context)
                                                  .stream
                                                  .skip(1)
                                                  .first;
                                              print("Test");
                                              print(
                                                  "Bloc: ${bloc.runtimeType}");
                                              if (bloc is AuthLoggedoutState) {
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                                Navigator.pushReplacementNamed(
                                                    context, ROUTE_AUTH);
                                              }
                                            },
                                            child: Text(local.ok),
                                          ),
                                        ],
                                      ).build(context);
                                    });
                              },
                              icon: Icon(
                                Icons.logout,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        BlocBuilder<ProfileBloc, ProfileState>(
                          builder: (context, state) {
                            print(state.runtimeType);
                            if (state is ProfileLoadedState) {
                              return Column(
                                children: [
                                  Text(
                                    state.player.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white70,
                                        ),
                                  ),
                                  // Text(
                                  //   state.player.phoneNum,
                                  //   style: TextStyle(
                                  //     color: Colors.white70,
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                    ),
                                    padding: const EdgeInsets.all(30),
                                    child: const Image(
                                      width: 70,
                                      image: AssetImage("images/logo/Logo.png"),
                                    ),
                                  ),
                                ],
                              );
                            } else if (state is ProfileErrorState) {
                              return ReloadScreenWidget(
                                f: state.failure,
                                callBack: () {
                                  BlocProvider.of<ProfileBloc>(context)
                                      .add(const GetProfileDataEvent());
                                },
                              );
                            } else if (state is ProfileSubmittedState) {
                              BlocProvider.of<ProfileBloc>(context)
                                  .add(const GetProfileDataEvent());
                            }
                            return const CircularProgressIndicator();
                          },
                        ),
                        const SizedBox(height: 30),

                        //
                        //  S E T T I N G S   T A B L E
                        //

                        Table(
                          children: [
                            TableRow(
                              children: [
                                SettingsTile2(
                                  icon: Icons.account_circle,
                                  iconsColor: Colors.deepOrange,
                                  title: local.profile,
                                  subtitle: "",
                                  onPressed: () async {
                                    final res =
                                        await Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const PlayerInfoScreen(),
                                      ),
                                    );
                                    print("Profile result: $res");
                                  },
                                ),
                                SettingsTile2(
                                  icon: Icons.fitness_center_rounded,
                                  iconsColor: Colors.blue,
                                  title: local.gyms,
                                  subtitle: "yoyoyoyo",
                                  onPressed: () {
                                    BlocProvider.of<GymsBloc>(context)
                                        .add(const GetAllAvailableGymsEvent());
                                    Navigator.of(context)
                                        .pushNamed(ROUTE_GYMS_LIST);
                                  },
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                SettingsTile2(
                                    icon: Icons.leaderboard,
                                    iconsColor: Colors.green,
                                    title: local.measurements,
                                    subtitle: "yoyoyoyo",
                                    // onPressed: () => Navigator.of(context)
                                    //     .pushNamed(ROUTE_MEASUREMENTS),
                                    onPressed: () {
                                      BlocProvider.of<MeasurmentBloc>(context)
                                          .add(GetMeasurementsEvent());
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            MeasurementScreen3(),
                                      ));
                                    }),
                                SettingsTile2(
                                  icon: Icons.info,
                                  iconsColor: Colors.amber,
                                  title: local.about,
                                  subtitle: "yoyoyoyo",
                                  onPressed: () => Navigator.of(context)
                                      .pushNamed(ROUTE_ABOUT),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 50),

                        // ActionChip.elevated(
                        //   elevation: 3.0,
                        //   pressElevation: 0.0,
                        //   backgroundColor: Color.fromARGB(255, 209, 74, 74),
                        //   // side: BorderSide(color: Colors.red),
                        //   label: SizedBox(
                        //     width: MediaQuery.of(context).size.width - 100,
                        //     child: Center(
                        //       child: Text(
                        //         "Logout",
                        //         style: TextStyle(color: Colors.white),
                        //       ),
                        //     ),
                        //   ),
                        //   onPressed: () {
                        //     showDialog(
                        //         context: context,
                        //         builder: (context) {
                        //           return AlertDialog(
                        //             title: Text(local.logoutAlert),
                        //             content: Text(local.logoutAlertContents),
                        //             actions: [
                        //               TextButton(
                        //                 onPressed: () {
                        //                   Navigator.pop(context);
                        //                 },
                        //                 child: Text(local.cancel),
                        //               ),
                        //               TextButton(
                        //                 onPressed: () async {
                        //                   BlocProvider.of<AuthBloc>(context)
                        //                       .add(LogoutEvent());
                        //                   final bloc =
                        //                       await BlocProvider.of<AuthBloc>(
                        //                               context)
                        //                           .stream
                        //                           .skip(1)
                        //                           .first;
                        //                   print("Test");
                        //                   print("Bloc: ${bloc.runtimeType}");
                        //                   if (bloc is AuthLoggedoutState) {
                        //                     Navigator.pop(context);
                        //                     Navigator.pop(context);
                        //                     Navigator.pushReplacementNamed(
                        //                         context, ROUTE_AUTH);
                        //                   }
                        //                 },
                        //                 child: Text(local.ok),
                        //               ),
                        //             ],
                        //           ).build(context);
                        //         });
                        //   },
                        // ),

                        // SettingTile(
                        //   icon: Icon(
                        //     Icons.language,
                        //     color: Theme.of(context).colorScheme.onPrimaryContainer,
                        //   ),
                        //   title: local.language,
                        //   isRtl: st.locale.languageCode == "ar",
                        //   onPressed: () async {
                        //   showDialog(
                        //       context: context,
                        //       builder: (c) => AlertDialog(
                        //             title: Text(local.chooseLang),
                        //             content: Column(
                        //               mainAxisSize: MainAxisSize.min,
                        //               children: [
                        //                 for (var i in Lang.values)
                        //                   RadioListTile(
                        //                       title: Text(i == Lang.en
                        //                           ? "English"
                        //                           : "العربية"),
                        //                       value:
                        //                           st.locale.languageCode == i.name,
                        //                       groupValue: true,
                        //                       onChanged: (newVal) {
                        //                         BlocProvider.of<LocaleCubit>(
                        //                                 context)
                        //                             .changeLanguage(i.name == "en"
                        //                                 ? "en"
                        //                                 : "ar");
                        //                         Navigator.pop(context);
                        //                       }),
                        //               ],
                        //             ),
                        //           ).build(context));
                        // },
                        // ),
                        // //
                        // //        P R O F I L E   O P T I O N
                        // //
                        // BlocBuilder<ProfileBloc, ProfileState>(
                        //   builder: (context, state) {
                        //     if (state is ProfileLoadedState) {
                        //       return SettingTile(
                        //         title: local.profile,
                        //         onPressed: () async {
                        //           final res = await Navigator.of(context).push(
                        //             MaterialPageRoute(
                        //               builder: (context) => const PlayerInfoScreen(),
                        //             ),
                        //           );
                        //           print("Profile result: $res");
                        //         },
                        //         isRtl: st.locale.languageCode == "ar",
                        //         icon: Icon(
                        //           Icons.person_pin_rounded,
                        //           color: Theme.of(context)
                        //               .colorScheme
                        //               .onPrimaryContainer,
                        //         ),
                        //       );
                        //     }
                        //     return const SizedBox();
                        //   },
                        // ),
                        // //
                        // //      G Y M S   L I S T   O P T I O N
                        // //

                        // SettingTile(
                        //   icon: Icon(
                        //     Icons.fitness_center_rounded,
                        //     color: Theme.of(context).colorScheme.onPrimaryContainer,
                        //   ),
                        //   title: local.gyms,
                        //   isRtl: st.locale.languageCode == "ar",
                        //   onPressed: () {
                        //     BlocProvider.of<GymsBloc>(context)
                        //         .add(const GetAllAvailableGymsEvent());
                        //     Navigator.pushNamed(context, ROUTE_GYMS_LIST);
                        //   },
                        // ),

                        // SettingTile(
                        //   icon: Icon(
                        //     Icons.leaderboard_rounded,
                        //     color: Theme.of(context).colorScheme.onPrimaryContainer,
                        //   ),
                        //   title: local.measurements,
                        //   isRtl: st.locale.languageCode == "ar",
                        //   onPressed: () {
                        //     Navigator.pushNamed(context, ROUTE_MEASUREMENTS);
                        //   },
                        // ),

                        // //
                        // //      A B O U T   O P T I O N
                        // //
                        // SettingTile(
                        //   icon: Icon(
                        //     Icons.info_outline,
                        //     color: Theme.of(context).colorScheme.onPrimaryContainer,
                        //   ),
                        //   title: local.about,
                        //   isRtl: st.locale.languageCode == "ar",
                        //   onPressed: () async {
                        //     Navigator.pushNamed(context, ROUTE_ABOUT);
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
