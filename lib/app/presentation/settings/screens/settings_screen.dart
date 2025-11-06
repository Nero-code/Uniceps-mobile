import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/app/presentation/blocs/account/account_cubit.dart';
import 'package:uniceps/app/presentation/blocs/locale/locale_cubit.dart';
import 'package:uniceps/app/presentation/blocs/membership/membership_bloc.dart';
import 'package:uniceps/app/presentation/home/widgets/alert_bar.dart';
import 'package:uniceps/app/presentation/settings/widgets/premium_banner.dart';
import 'package:uniceps/app/presentation/settings/widgets/settings_tile.dart';
import 'package:uniceps/core/constants/app_routes.dart';
import 'package:uniceps/core/constants/constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(locale.scrTitleSettings)),
      body: Column(
        children: [
          Builder(builder: (context) {
            final accountCubit = context.watch<AccountCubit>();
            final membershipBloc = context.watch<MembershipBloc>();

            return accountCubit.state.map(
              initial: (_) => const SizedBox(),
              unauthenticated: (_) => AlertBar(
                content: Text(locale.signinAlert),
                actionText: locale.signin,
                action: () => Navigator.pushNamed(context, AppRoutes.auth),
              ),
              hasAccount: (acc) => membershipBloc.state.map(
                initial: (_) => const SizedBox(),
                loading: (_) => const SizedBox(),
                loaded: (m) => Container(
                    child: Text(m.m.endDate
                        .difference(DateTime.now())
                        .inDays
                        .toString())),
                error: (value) => const PremiumBanner(),
              ),
            );
          }),

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
                    title: locale.profile,
                    subtitle: "",
                    onPressed: null,
                  ),
                  SettingsTile(
                    icon: Icons.fitness_center_rounded,
                    iconsColor: Colors.blue,
                    title: locale.gyms,
                    subtitle: "yoyoyoyo",
                    onPressed: () {},
                  ),
                ],
              ),
              TableRow(
                children: [
                  SettingsTile(
                    icon: Icons.leaderboard,
                    iconsColor: Colors.green,
                    title: locale.measurements,
                    subtitle: "yoyoyoyo",
                    onPressed: () {},
                  ),
                  SettingsTile(
                    icon: Icons.language,
                    iconsColor: Colors.blue,
                    title: locale.language,
                    subtitle: "",
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (c) {
                          final languageCode = context
                              .read<LocaleCubit>()
                              .state
                              .locale
                              .languageCode;
                          return AlertDialog(
                            title: Text(locale.chooseLang),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                for (var i in Lang.values)
                                  RadioListTile(
                                      title: Text(
                                          i == Lang.en ? "English" : "العربية"),
                                      value: languageCode == i.name,
                                      groupValue: true,
                                      onChanged: (newVal) {
                                        context
                                            .read<LocaleCubit>()
                                            .changeLanguage(
                                                i.name == "en" ? "en" : "ar");
                                        Navigator.pop(context);
                                      }),
                              ],
                            ),
                          ).build(context);
                        },
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
                    title: locale.about,
                    subtitle: "yoyoyoyo",
                    onPressed: () =>
                        Navigator.of(context).pushNamed(ROUTE_ABOUT),
                  ),
                  SettingsTile(
                    icon: Icons.logout_rounded,
                    iconsColor: Colors.red,
                    title: locale.logout,
                    subtitle: "",
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(locale.logoutAlert),
                            content: Text(locale.logoutAlertContents),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(locale.cancel),
                              ),
                              TextButton(
                                onPressed: () async {},
                                child: Text(
                                  locale.ok,
                                  style: const TextStyle(color: Colors.red),
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
        ],
      ),
    );
  }
}
