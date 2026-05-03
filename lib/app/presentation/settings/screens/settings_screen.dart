import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/blocs/account/account_cubit.dart';
import 'package:uniceps/app/presentation/blocs/exercise_lib/exercise_lib_cubit.dart';
import 'package:uniceps/app/presentation/blocs/membership/membership_bloc.dart';
import 'package:uniceps/app/presentation/home/widgets/alert_bar.dart';
import 'package:uniceps/app/presentation/settings/dialogs/content_lang_dialog.dart';
import 'package:uniceps/app/presentation/settings/dialogs/lang_alert_dialog.dart';
import 'package:uniceps/app/presentation/settings/dialogs/logout_alert_dialog.dart';
import 'package:uniceps/app/presentation/settings/widgets/premium_banner.dart';
import 'package:uniceps/app/presentation/settings/widgets/settings_tile.dart';
import 'package:uniceps/app/presentation/settings/widgets/uniceps_premium.dart';
import 'package:uniceps/app/services/language_cache_helper.dart';
import 'package:uniceps/core/constants/app_routes.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/injection_dependency.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  final double shift = 0.25;
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    // final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(title: Text(locale.scrTitleSettings)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Builder(
              builder: (context) {
                final accountCubit = context.watch<AccountCubit>();
                final membershipBloc = context.watch<MembershipBloc>();

                return accountCubit.state.map(
                  initial: (_) => const SizedBox(),
                  unauthenticated: (_) => SizedBox(
                    height: 35,
                    child: AlertBar(
                      content: Text(locale.signinAlert, style: const TextStyle(fontSize: 12)),
                      actionText: locale.signin,
                      action: () => Navigator.pushNamed(context, AppRoutes.auth),
                    ),
                  ),
                  hasAccount: (acc) => membershipBloc.state.map(
                    initial: (_) => const SizedBox(),
                    loading: (_) => const SizedBox(),
                    error: (value) => const PremiumBanner(),
                    loaded: (m) => UnicepsPremium(membership: m.m),
                  ),
                );
              },
            ),

            //
            //  S E T T I N G S   T A B L E
            //
            const SizedBox(height: 10),
            SettingsTile(
              icon: Icons.account_circle,
              iconsColor: Colors.deepOrange,
              title: locale.profile,
              onPressed: () => Navigator.pushNamed(context, AppRoutes.profile),
            ),
            // SettingsTile(
            //   icon: Icons.fitness_center_rounded,
            //   iconsColor: Colors.blue,
            //   title: locale.gyms,
            //   onPressed: null,
            // ),
            // SettingsTile(
            //   icon: Icons.straighten_rounded,
            //   iconsColor: Colors.green,
            //   title: locale.measurements,
            //   onPressed: () => Navigator.pushNamed(context, AppRoutes.measurements),
            // ),
            SettingsTile(
              icon: Icons.language,
              iconsColor: Colors.blue,
              title: locale.language,
              onPressed: () => showDialog(context: context, builder: (_) => const LangAlertDialog()),
            ),
            SettingsTile(
              icon: Icons.swap_horiz,
              iconsColor: Colors.red,
              title: locale.changeExercisesLang,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => ContentLangDialog(
                    onLangChanged: (code) => showDialog(
                      context: context,
                      builder: (context) => BlocProvider(
                        create: (context) => ExerciseLibCubit(sl()),
                        child: Builder(
                          builder: (context) {
                            return AlertDialog(
                              content: FutureBuilder(
                                future: () async {
                                  final res = await context.read<ExerciseLibCubit>().changeLibLanguage(code);
                                  if (res) {
                                    await sl<LanguageCacheHelper>().saveExercisesLibContentLanguage(code);
                                  }
                                  return res;
                                }(),
                                builder: (context, asyncSnapshot) {
                                  if (asyncSnapshot.connectionState == ConnectionState.done) {
                                    if (!asyncSnapshot.data!) return Text(locale.errNoInternet);
                                    Navigator.pop(context);
                                  }
                                  return SizedBox.square(
                                    dimension: 50,
                                    child: Center(
                                      child: LoadingIndicator(
                                        backgroundColor: Colors.transparent,
                                        elevated: false,
                                        size: Size.square(50),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            SettingsTile(
              icon: Icons.info,
              iconsColor: Colors.amber,
              title: locale.about,
              onPressed: () => Navigator.pushNamed(context, AppRoutes.about),
            ),
            BlocBuilder<AccountCubit, AccountState>(
              builder: (context, state) {
                return SettingsTile(
                  icon: Icons.logout_rounded,
                  iconsColor: Colors.red,
                  title: locale.logout,
                  onPressed: state.whenOrNull(
                    hasAccount: (_) =>
                        () => showDialog(context: context, builder: (context) => const LogoutAlertDialog()),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
