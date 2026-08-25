import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/blocs/app_config/app_config_cubit.dart';
import 'package:uniceps/app/presentation/blocs/membership/membership_bloc.dart';
import 'package:uniceps/app/presentation/blocs/update/update_cubit.dart';
import 'package:uniceps/app/presentation/home/blocs/current_routine/current_routine_cubit.dart';
import 'package:uniceps/app/presentation/home/blocs/daily_quote/daily_quote_cubit.dart';
import 'package:uniceps/app/presentation/home/blocs/session/session_bloc.dart';
import 'package:uniceps/app/presentation/home/blocs/stopwatch/stopwatch_cubit.dart';
import 'package:uniceps/app/presentation/home/dialogs/membership_congrats_dialog.dart';
import 'package:uniceps/app/presentation/home/widgets/alert_banner_section.dart';
import 'package:uniceps/app/presentation/home/widgets/captain_uni_card.dart';
import 'package:uniceps/app/presentation/home/widgets/secondary_actions_bar.dart';
import 'package:uniceps/app/presentation/home/widgets/smart_day_selector_card.dart';
import 'package:uniceps/app/presentation/practice/screens/practice_screen.dart';
import 'package:uniceps/app/presentation/settings/dialogs/qr_alert_dialog.dart';
import 'package:uniceps/app/services/file_handler_service.dart';
import 'package:uniceps/core/constants/app_routes.dart';
import 'package:uniceps/core/constants/cap_images.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/logging/app_logger.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/injection_dependency.dart' as di;
import 'package:uniceps/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

// Light Theme Palette Constants
const lightBg = Color(0xFFF6F8FA);
const cardSurface = Colors.white;
const primaryDark = Color(0xFF1E293B);
const primaryTeal = Color(0xFF0EA5E9);
const accentMint = Color(0xFF10B981);
const textSubtle = Color(0xFF64748B);
const borderLight = Color(0xFFE2E8F0);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool notifyUpgrade = true;

  @override
  void initState() {
    super.initState();
    FileHandlerService().setAppReady();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final lang = context.read<AppConfigCubit>().state.config.appLanguage.languageCode;
    final membership = context.watch<MembershipBloc>().state;

    return BlocProvider(
      create: (context) => StopwatchCubit(prefs: di.sl()),
      lazy: false,
      child: Stack(
        children: [
          BlocListener<MembershipBloc, MembershipState>(
            child: const SizedBox(),
            listener: (context, state) => state.whenOrNull(
              loaded: (m) {
                if (!m.isNotified) {
                  showDialog(context: context, builder: (_) => const MembershipCongratsDialog());
                  context.read<MembershipBloc>().add(const MembershipEvent.notifyNewMembership());
                }
                return;
              },
            ),
          ),
          Scaffold(
            backgroundColor: lightBg,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: lightBg,
              elevation: 0,
              scrolledUnderElevation: 0,
              title: const Text(
                APP_NAME,
                style: TextStyle(fontFamily: 'Playwrite', color: primaryDark, fontWeight: FontWeight.bold),
              ),
              leading: IconButton(
                onPressed: () => showDialog(context: context, builder: (_) => const QrAlertDialog()),
                icon: const Icon(Icons.qr_code_2_outlined),
                color: primaryDark,
              ),
              actions: [
                IconButton(
                  iconSize: 25,
                  onPressed: () => Navigator.pushNamed(context, AppRoutes.settings),
                  icon: const Icon(Icons.settings_outlined, color: primaryDark),
                ),
              ],
            ),
            body: Column(
              children: [
                // App Version Update Listener
                BlocListener<UpdateCubit, UpdateState>(
                  listener: (context, state) => state.whenOrNull(
                    needsUpdate: (version) {
                      logger.t('Version: ${version.toJson()}');
                      return showDialog(
                        context: context,
                        barrierDismissible: !version.isUpdateUrgent,
                        builder: (context) => PopScope(
                          canPop: !version.isUpdateUrgent,
                          child: AlertDialog(
                            scrollable: true,
                            icon: Icon(
                              version.isUpdateUrgent ? Icons.nearby_error : Icons.verified,
                              color: version.isUpdateUrgent ? Colors.red : primaryTeal,
                              size: 50,
                            ),
                            title: Text('${locale.newVersion}\n${version.toString()}'),
                            content: Text(lang == 'ar' ? version.changeLogAr : version.changeLogEn),
                            actions: [
                              if (!version.isUpdateUrgent)
                                TextButton(onPressed: () => Navigator.pop(context), child: Text(locale.cancel)),
                              ElevatedButton(
                                style: version.isUpdateUrgent
                                    ? ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        foregroundColor: Colors.white,
                                      )
                                    : ElevatedButton.styleFrom(
                                        backgroundColor: primaryTeal,
                                        foregroundColor: Colors.white,
                                      ),
                                onPressed: () {
                                  launchUrl(
                                    Uri.parse("https://play.google.com/store/apps/details?id=com.trioverse.uniceps"),
                                    mode: LaunchMode.externalApplication,
                                  );
                                  if (!version.isUpdateUrgent) {
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text(locale.update),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  child: const SizedBox(),
                ),

                // Alert / Account Banner
                AlertBannerSection(
                  notifyUpgrade: notifyUpgrade,
                  onCloseUpgrade: () => setState(() => notifyUpgrade = false),
                ),

                // Main Scrollable Dashboard Content
                Expanded(
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      // Smart Day Selector Card (Dynamic Active Session CTA)
                      SliverToBoxAdapter(
                        child: BlocBuilder<SessionBloc, SessionState>(
                          builder: (context, sessionState) {
                            return BlocBuilder<CurrentRoutineCubit, CurrentRoutineState>(
                              builder: (context, routineState) {
                                return SmartDaySelectorCard(
                                  routine: routineState.maybeMap(loaded: (state) => state.c, orElse: () => null),
                                  lastCompletedDayId: routineState.maybeMap(
                                    loaded: (state) => state.heat.lastdayId,
                                    orElse: () => null,
                                  ),
                                  activeSessionState: sessionState,
                                  onSetupRoutine: () async {
                                    await Navigator.pushNamed(context, AppRoutes.routineManager);
                                    context.mounted ? context.read<CurrentRoutineCubit>().getCurrentRoutine() : null;
                                  },
                                  onStartSession: (selectedDay) {
                                    context.read<SessionBloc>().add(
                                      SessionEvent.startSession(selectedDay.id!, selectedDay.name),
                                    );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => MultiBlocProvider(
                                          providers: [
                                            BlocProvider.value(value: context.read<SessionBloc>()),
                                            BlocProvider.value(value: context.read<StopwatchCubit>()..startStopWatch()),
                                          ],
                                          child: PracticeScreen(dayName: selectedDay.name, startDate: DateTime.now()),
                                        ),
                                      ),
                                    );
                                  },
                                  onResumeSession: (session) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => BlocProvider.value(
                                          value: context.read<StopwatchCubit>()
                                            ..startStopWatch(DateTime.now().difference(session.createdAt)),
                                          child: PracticeScreen(dayName: session.dayName, startDate: session.createdAt),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),

                      // Diet Logger Action Banner
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: cardSurface,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: borderLight),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.02),
                                      blurRadius: 6,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(20),
                                    onTap: () => Navigator.pushNamed(context, AppRoutes.dietLogger),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: accentMint.withValues(alpha: 0.1),
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(Icons.restaurant_menu, color: accentMint, size: 22),
                                          ),
                                          const SizedBox(width: 14),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  locale.dietLogger,
                                                  style: const TextStyle(
                                                    color: primaryDark,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  locale.dietLoggerDescription,
                                                  style: const TextStyle(color: textSubtle, fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Icon(Icons.add_circle_outline_rounded, color: primaryTeal, size: 24),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (membership.maybeWhen(orElse: () => true, loaded: (m) => false))
                                Positioned.directional(
                                  textDirection: Directionality.of(context),
                                  child: Container(
                                    decoration: const BoxDecoration(shape: .circle, color: Colors.amber),
                                    padding: const .all(4.0),
                                    child: const Image(image: AssetImage(IMG_PREMIUM), width: 15, color: Colors.white),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),

                      // Quick Navigation Chips
                      SliverToBoxAdapter(
                        child: SecondaryActionsBar(
                          onAnalytics: () => Navigator.pushNamed(context, AppRoutes.performance),
                          onMeasurements: () => Navigator.pushNamed(context, AppRoutes.measurements),
                          onRoutineManager: () async {
                            await Navigator.pushNamed(context, AppRoutes.routineManager);
                            context.mounted ? context.read<CurrentRoutineCubit>().getCurrentRoutine() : null;
                          },
                        ),
                      ),

                      // Premade Routines Horizontal List
                      // SliverToBoxAdapter(
                      //   child: _PremadeRoutinesSection(
                      //     onSelectRoutine: (routine) {
                      //       Navigator.pushNamed(context, AppRoutes.routineManager);
                      //     },
                      //   ),
                      // ),

                      // Daily Motivational Quote Banner
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: BlocBuilder<DailyQuoteCubit, DailyQuoteState>(
                            builder: (context, state) => state.map(
                              initial: (_) => const LoadingIndicator(),
                              loaded: (s) => CaptainUniCard(
                                imagePath: CaptainImages.motive,
                                needsFlip: false,
                                content: s.quote.quote[parseLang(lang)]!,
                                gradient: const LinearGradient(colors: [primaryTeal, Color(0xFF0284C7)]),
                                // onCapTap: () => Navigator.pushNamed(context, AppRoutes.capAbout),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SliverToBoxAdapter(child: SizedBox(height: 24)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
