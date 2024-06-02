import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Profile/presentation/bloc/profile_bloc.dart';
import 'package:uniceps/features/Profile/presentation/widgets/gym_widget.dart';
import 'package:uniceps/features/Profile/presentation/widgets/settings_tile.dart';
import 'package:uniceps/main_cubit/locale_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, ChangedLangState>(
      builder: (context, st) {
        return Scaffold(
          // backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            title: Text("Uniceps"),
            backgroundColor: Theme.of(context).colorScheme.background,
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Logout?"),
                          content: Text(
                              "You are about to Logout of the app some of your data may be lost, Are you sure?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Cancel"),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("OK"),
                            ),
                          ],
                        ).build(context);
                      });
                },
                icon: Icon(Icons.logout_rounded),
              ),
            ],
          ),
          body: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Center(
                      child: Image(
                        width: MediaQuery.of(context).size.width * 0.4,
                        image: AssetImage("images/logo/Logo-dark.png"),
                      ),
                    ),
                    SizedBox(height: 50),
                    // SettingTile(
                    //   title: "Measurements",
                    //   onPressed: () async {
                    //     // BlocProvider.of<ProfileBloc>(context)
                    //     //     .add(GetMearumentsEvent(gymId: state.toString()));
                    //     Navigator.pushNamed(context, ROUTE_MEASUREMENTS);
                    //   },
                    // ),
                    GymWidget(
                      gyms: [],
                    ),

                    SettingTile(
                      title: "Language",
                      isRtl: st.locale.languageCode == "ar",
                      onPressed: () async {
                        showDialog(
                            context: context,
                            builder: (c) => AlertDialog(
                                  title: Text("Choose language:"),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      for (var i in Lang.values)
                                        RadioListTile(
                                            title: Text(i == Lang.en
                                                ? "English"
                                                : "عربي"),
                                            value: st.locale.languageCode ==
                                                i.name,
                                            groupValue: true,
                                            onChanged: (newVal) {
                                              BlocProvider.of<LocaleCubit>(
                                                      context)
                                                  .changeLanguage(i.name == "en"
                                                      ? "en"
                                                      : "ar");
                                              Navigator.pop(context);
                                            }),
                                    ],
                                  ),
                                ).build(context));
                      },
                    ),
                    SettingTile(
                      title: "About",
                      isRtl: st.locale.languageCode == "ar",
                      onPressed: () {},
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
