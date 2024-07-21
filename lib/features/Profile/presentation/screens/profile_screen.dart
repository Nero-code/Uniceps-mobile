import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/widgets/reload_wiget.dart';
import 'package:uniceps/features/Profile/domain/entities/gym.dart';
import 'package:uniceps/features/Profile/presentation/bloc/gyms_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/profile_bloc.dart';
import 'package:uniceps/features/Profile/presentation/widgets/gym_widget.dart';
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
                              onPressed: () {},
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
                const SizedBox(height: 50),
                Center(
                  child: Image(
                    width: MediaQuery.of(context).size.width * 0.4,
                    image: const AssetImage("images/logo/Logo-dark.png"),
                  ),
                ),
                const SizedBox(height: 50),
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileLoadedState) {
                      return Card(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(AppLocalizations.of(context)!.pName),
                                    Text(state.player.name),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                        AppLocalizations.of(context)!.phoneNum),
                                    Text(state.player.phoneNum),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(AppLocalizations.of(context)!.gender),
                                    Text(state.player.gender == Gender.male
                                        ? AppLocalizations.of(context)!.male
                                        : AppLocalizations.of(context)!.female),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(AppLocalizations.of(context)!
                                        .birthDate),
                                    Text(state.player.birthDate),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
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
                    }
                    return const CircularProgressIndicator();
                  },
                ),
                const SizedBox(height: 50),
                BlocBuilder<GymsBloc, GymsState>(
                  builder: (context, state) {
                    if (state is GymsLoadedState) {
                      if (state.list.isEmpty) {
                        return const SizedBox();
                      }
                      return GymWidget(
                        gyms: [
                          for (var i in state.list)
                            Gym(
                              name: i.name,
                              gymId: i.gymId,
                              isCurrent: i.isCurrent,
                              logo: i.logo,
                            ),
                        ],
                      );
                    } else if (state is GymsErrorState) {
                      return ReloadScreenWiget(
                        image: const Icon(Icons.error),
                        message: Text(AppLocalizations.of(context)!.error),
                        callBack: IconButton(
                          icon: const Icon(Icons.refresh),
                          onPressed: () {
                            BlocProvider.of<GymsBloc>(context)
                                .add(const GetAllGymsEvent());
                          },
                        ),
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ),
                const SizedBox(height: 10),
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
                SettingTile(
                  title: AppLocalizations.of(context)!.profile,
                  onPressed: () {},
                  isRtl: st.locale.languageCode == "ar",
                  icon: Icon(
                    Icons.person_pin_rounded,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                SettingTile(
                  icon: Icon(
                    Icons.info_outline,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  title: AppLocalizations.of(context)!.about,
                  isRtl: st.locale.languageCode == "ar",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
