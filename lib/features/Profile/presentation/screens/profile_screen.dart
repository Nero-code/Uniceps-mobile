import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/widgets/reload_wiget.dart';
import 'package:uniceps/features/Auth/views/bloc/auth_bloc.dart';
import 'package:uniceps/features/Auth/views/screens/player_info_screen.dart';
import 'package:uniceps/features/Profile/presentation/bloc/gyms_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/profile_bloc.dart';
import 'package:uniceps/features/Profile/presentation/widgets/profile_card.dart';
import 'package:uniceps/features/Profile/presentation/widgets/profile_card_2.dart';
import 'package:uniceps/features/Profile/presentation/widgets/settings_tile.dart';
import 'package:uniceps/main_cubit/locale_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, ChangedLangState>(
      builder: (context, st) {
        return Scaffold(
          // backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            title: const Text("Uniceps"),
            backgroundColor: Theme.of(context).colorScheme.background,
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title:
                              Text(AppLocalizations.of(context)!.logoutAlert),
                          content: Text(AppLocalizations.of(context)!
                              .logoutAlertContents),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(AppLocalizations.of(context)!.cancel),
                            ),
                            TextButton(
                              onPressed: () async {
                                BlocProvider.of<AuthBloc>(context)
                                    .add(LogoutEvent());
                                final bloc =
                                    await BlocProvider.of<AuthBloc>(context)
                                        .stream
                                        .skip(1)
                                        .first;
                                print("Test");
                                print("Bloc: ${bloc.runtimeType}");
                                if (bloc is AuthLoggedoutState) {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pushReplacementNamed(
                                      context, ROUTE_AUTH);
                                }
                              },
                              child: Text(AppLocalizations.of(context)!.ok),
                            ),
                          ],
                        ).build(context);
                      });
                },
                icon: const Icon(Icons.logout_rounded),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // const SizedBox(height: 50),
                // Center(
                //   child: Image(
                //     width: MediaQuery.of(context).size.width * 0.4,
                //     image: const AssetImage("images/logo/Logo-dark.png"),
                //   ),
                // ),
                // const SizedBox(height: 50),
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    print(state.runtimeType);
                    if (state is ProfileLoadedState) {
                      // return ProfileCard(profile: state.player);
                      return ProfileCard2(player: state.player);

                      // return Card(
                      //   child: SizedBox(
                      //     width: MediaQuery.of(context).size.width,
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Column(
                      //         children: [
                      //           Row(
                      //             children: [
                      //               Text(AppLocalizations.of(context)!.pName),
                      //               Text(state.player.name),
                      //             ],
                      //           ),
                      //           Row(
                      //             children: [
                      //               Text(
                      //                   AppLocalizations.of(context)!.phoneNum),
                      //               Text(state.player.phoneNum),
                      //             ],
                      //           ),
                      //           Row(
                      //             children: [
                      //               Text(AppLocalizations.of(context)!.gender),
                      //               Text(state.player.gender == Gender.male
                      //                   ? AppLocalizations.of(context)!.male
                      //                   : AppLocalizations.of(context)!.female),
                      //             ],
                      //           ),
                      //           Row(
                      //             children: [
                      //               Text(AppLocalizations.of(context)!
                      //                   .birthDate),
                      //               Text(state.player.birthDate),
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // );
                    } else if (state is ProfileErrorState) {
                      return ReloadScreenWiget(
                        image: Icon(
                          Icons.error,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                        message: Text(AppLocalizations.of(context)!.error),
                        callBack: IconButton(
                          icon: const Icon(Icons.refresh),
                          onPressed: () {
                            BlocProvider.of<ProfileBloc>(context)
                                .add(const GetProfileDataEvent());
                          },
                        ),
                      );

                      // return ProfileCard(
                      //   profile: Player(
                      //     uid: "",
                      //       name: "abo ali",
                      //       phoneNum: "0987654321",
                      //       birthDate: "1987",
                      //       gender: Gender.male),
                      // );
                    } else if (state is ProfileSubmittedState) {
                      BlocProvider.of<ProfileBloc>(context)
                          .add(const GetProfileDataEvent());
                    }
                    return const CircularProgressIndicator();
                  },
                ),
                const SizedBox(height: 50),
                // BlocBuilder<GymsBloc, GymsState>(
                //   builder: (context, state) {
                //     if (state is GymsLoadedState) {
                //       if (state.list.isEmpty) {
                //         return const SizedBox();
                //       }
                //       return GymWidget(
                //         gyms: [
                //           for (var i in state.list)
                //             Gym(
                //               name: i.name,
                //               id: i.id,
                //               logo: i.logo,
                //               address: "address",
                //               ownerName: "flan al 3lany",
                //               phoneNum: "0987654321",
                //               telephone: "016 333 222",
                //             ),
                //         ],
                //       );
                //     } else if (state is GymsErrorState) {
                //       return ReloadScreenWiget(
                //         image: const Icon(Icons.error),
                //         message: Text(AppLocalizations.of(context)!.error),
                //         callBack: IconButton(
                //           icon: const Icon(Icons.refresh),
                //           onPressed: () {
                //             BlocProvider.of<GymsBloc>(context)
                //                 .add(const GetAllAvailableGymsEvent());
                //           },
                //         ),
                //       );
                //       // return const GymWidget(gyms: [
                //       //   Gym(name: "Platinum", gymId: "0", isCurrent: true)
                //       // ]);
                //     }
                //     return const CircularProgressIndicator();
                //   },
                // ),
                // const SizedBox(height: 10),
                SettingTile(
                  icon: Icon(
                    Icons.language,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  title: AppLocalizations.of(context)!.language,
                  isRtl: st.locale.languageCode == "ar",
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (c) => AlertDialog(
                              title: Text(
                                  AppLocalizations.of(context)!.chooseLang),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  for (var i in Lang.values)
                                    RadioListTile(
                                        title: Text(i == Lang.en
                                            ? "English"
                                            : "العربية"),
                                        value: st.locale.languageCode == i.name,
                                        groupValue: true,
                                        onChanged: (newVal) {
                                          BlocProvider.of<LocaleCubit>(context)
                                              .changeLanguage(
                                                  i.name == "en" ? "en" : "ar");
                                          Navigator.pop(context);
                                        }),
                                ],
                              ),
                            ).build(context));
                  },
                ),
                //
                //        P R O F I L E   O P T I O N
                //
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileLoadedState) {
                      return SettingTile(
                        title: AppLocalizations.of(context)!.profile,
                        onPressed: () async {
                          // Navigator.pushNamed(
                          //   context,
                          //   ROUTE_PLAYER_INFO,
                          //   arguments: PlayerArguments(
                          //       hasData: true,
                          //       // data: Player(
                          //       //     name: "aaaaa",
                          //       //     phoneNum: "0987654321",
                          //       //     birthDate: "1999",
                          //       //     gender: Gender.male),
                          //       data: state.player),
                          // );
                          final res = await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const PlayerInfoScreen(),
                            ),
                          );
                          print("Profile result: $res");
                        },
                        isRtl: st.locale.languageCode == "ar",
                        icon: Icon(
                          Icons.person_pin_rounded,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
                //
                //      G Y M S   L I S T   O P T I O N
                //
                SettingTile(
                  icon: Icon(
                    Icons.fitness_center_rounded,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  title: AppLocalizations.of(context)!.gyms,
                  isRtl: st.locale.languageCode == "ar",
                  onPressed: () {
                    BlocProvider.of<GymsBloc>(context)
                        .add(const GetAllAvailableGymsEvent());
                    Navigator.pushNamed(context, ROUTE_GYMS_LIST);
                  },
                ),
                SettingTile(
                  icon: Icon(
                    Icons.leaderboard_rounded,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  // title: AppLocalizations.of(context)!.about,
                  title: AppLocalizations.of(context)!.measurements,
                  isRtl: st.locale.languageCode == "ar",
                  onPressed: () {
                    Navigator.pushNamed(context, ROUTE_MEASUREMENTS);
                    // BlocProvider.of<HandshakeBloc>(context)
                    //     .add(RequestAttendanceEvent("11"));
                  },
                ),

                //
                //      A B O U T   O P T I O N
                //
                SettingTile(
                  icon: Icon(
                    Icons.info_outline,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  title: AppLocalizations.of(context)!.about,
                  // title: "Hand Shake",
                  isRtl: st.locale.languageCode == "ar",
                  onPressed: () async {
                    print("onpressed");
                    print(await FirebaseMessaging.instance.getToken());
                    // BlocProvider.of<HandshakeBloc>(context)
                    //     .add(GetAllHandShakeEvent());
                  },
                ),

                // SettingTile(
                //   icon: Icon(
                //     Icons.medical_information_outlined,
                //     color: Theme.of(context).colorScheme.onPrimaryContainer,
                //   ),
                //   // title: AppLocalizations.of(context)!.about,
                //   title: "",
                //   isRtl: st.locale.languageCode == "ar",
                //   onPressed: () {
                //     // BlocProvider.of<HandshakeBloc>(context)
                //     //     .add(RequestAttendanceEvent("11"));
                //   },
                // ),
                // SettingTile(
                //   icon: Icon(
                //     Icons.medical_information_outlined,
                //     color: Theme.of(context).colorScheme.onPrimaryContainer,
                //   ),
                //   title: AppLocalizations.of(context)!.about,
                //   isRtl: st.locale.languageCode == "ar",
                //   onPressed: () {
                //     // BlocProvider.of<HandshakeBloc>(context)
                //     // .add();
                //   },
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
