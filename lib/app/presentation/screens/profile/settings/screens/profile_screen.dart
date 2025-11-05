import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/widgets/reload_widget.dart';
import 'package:uniceps/app/presentation/blocs/gyms/gyms_bloc.dart';
import 'package:uniceps/app/presentation/blocs/measurement/measurment_bloc.dart';
import 'package:uniceps/app/presentation/blocs/profile/profile_bloc.dart';
import 'package:uniceps/app/presentation/screens/profile/settings/screens/measurement_screen.dart';
import 'package:uniceps/app/presentation/screens/profile/settings/widgets/profile_back_circle.dart';
import 'package:uniceps/app/presentation/screens/profile/settings/widgets/settings_tile.dart';
import 'package:uniceps/app/presentation/blocs/locale/locale_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool loggingOut = false;

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
                      height: 15,
                      child: const Image(
                        image: AssetImage("images/logo/Logo_Trio.png"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.32,
                  width: MediaQuery.of(context).size.width,
                  child: CustomPaint(
                    painter: ProfileBackgroundCircle(),
                  ),
                ),
                SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: screen.height * 0.05),
                        BlocBuilder<ProfileBloc, ProfileState>(
                          builder: (context, state) {
                            // print(state.runtimeType);
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
                                      color:
                                          Theme.of(context).colorScheme.surface,
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
                                SettingsTile(
                                  icon: Icons.account_circle,
                                  iconsColor: Colors.deepOrange,
                                  title: local.profile,
                                  subtitle: "",
                                  onPressed: () async {
                                    // await Navigator.of(context).push(
                                    //   MaterialPageRoute(
                                    //     builder: (context) =>
                                    //         const PlayerInfoScreen(),
                                    //   ),
                                    // );
                                    // print("Profile result: $res");
                                  },
                                ),
                                SettingsTile(
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
                                SettingsTile(
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
                                            const MeasurementScreen3(),
                                      ));
                                    }),
                                SettingsTile(
                                  icon: Icons.language,
                                  iconsColor: Colors.blue,
                                  title: local.language,
                                  subtitle: "",
                                  onPressed: () {
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
                                                  value:
                                                      st.locale.languageCode ==
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
                                      ).build(context),
                                    );
                                  },
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                SettingsTile(
                                  icon: Icons.info,
                                  iconsColor: Colors.amber,
                                  title: local.about,
                                  subtitle: "yoyoyoyo",
                                  onPressed: () => Navigator.of(context)
                                      .pushNamed(ROUTE_ABOUT),
                                ),
                                SettingsTile(
                                  icon: Icons.logout_rounded,
                                  iconsColor: Colors.red,
                                  title: local.logout,
                                  subtitle: "",
                                  // onPressed: () => Navigator.of(context)
                                  //     .pushNamed(ROUTE_ABOUT),
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
                                                // BlocProvider.of<AuthBloc>(
                                                //         context)
                                                //     .add(LogoutEvent());
                                                // final bloc = await BlocProvider
                                                //         .of<AuthBloc>(context)
                                                //     .stream
                                                //     .skip(1)
                                                //     .first;
                                                // // print(
                                                // //     "Bloc: ${bloc.runtimeType}");
                                                // if (bloc
                                                //     is AuthLoggedoutState) {
                                                //   if (context.mounted) {
                                                //     Navigator.pop(context);
                                                //     Navigator.pop(context);
                                                //     Navigator
                                                //         .pushReplacementNamed(
                                                //             context,
                                                //             ROUTE_AUTH);
                                                //   }
                                                // } else {
                                                //   if (context.mounted) {
                                                //     Navigator.pop(context);
                                                //     ScaffoldMessenger.of(
                                                //             context)
                                                //         .clearSnackBars();
                                                //     ScaffoldMessenger.of(
                                                //             context)
                                                //         .showSnackBar(
                                                //       SnackBar(
                                                //         content:
                                                //             ErrorScreenWidget(
                                                //           f: NoInternetConnectionFailure(
                                                //               errMsg: ""),
                                                //           callback: null,
                                                //         ),
                                                //       ),
                                                //     );
                                                //   }
                                                // }
                                              },
                                              child: Text(
                                                local.ok,
                                                style: const TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ),
                                          ],
                                        ).build(context);
                                      },
                                    );
                                  },
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
                Positioned(
                  top: 30.0,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                    iconSize: 30,
                    color: Colors.white,
                  ),
                ),
                if (loggingOut)
                  SizedBox(
                    width: screen.width,
                    height: screen.height,
                    child: const ColoredBox(
                      color: Colors.white,
                      child: Center(
                        child: CircularProgressIndicator(),
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
