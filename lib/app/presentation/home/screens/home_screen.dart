import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:uniceps/app/presentation/blocs/account/account_cubit.dart';
import 'package:uniceps/app/presentation/blocs/locale/locale_cubit.dart';
import 'package:uniceps/app/presentation/blocs/membership/membership_bloc.dart';
import 'package:uniceps/app/presentation/home/blocs/current_routine/current_routine_cubit.dart';
import 'package:uniceps/app/presentation/home/blocs/daily_quote/daily_quote_cubit.dart';
import 'package:uniceps/app/presentation/home/blocs/session/session_bloc.dart';
import 'package:uniceps/app/presentation/home/blocs/stopwatch/stopwatch_cubit.dart';
import 'package:uniceps/app/presentation/home/dialogs/membership_congrats_dialog.dart';
import 'package:uniceps/app/presentation/home/widgets/alert_bar.dart';
import 'package:uniceps/app/presentation/home/widgets/captain_uni_card.dart';
import 'package:uniceps/app/presentation/home/widgets/practice_day_item.dart';
import 'package:uniceps/app/presentation/home/widgets/practice_panel.dart';
import 'package:uniceps/app/presentation/home/widgets/routine_skeleton.dart';
import 'package:uniceps/app/presentation/practice/screens/practice_screen.dart';
import 'package:uniceps/app/presentation/routine/widgets/routine_with_heat.dart';
import 'package:uniceps/app/presentation/settings/dialogs/qr_alert_dialog.dart';
import 'package:uniceps/core/constants/app_routes.dart';
import 'package:uniceps/core/constants/cap_images.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/injection_dependency.dart' as di;
import 'package:uniceps/l10n/app_localizations.dart';

import '../../../../core/errors/failure.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  final panelController = PanelController();

  bool notifyUpgrade = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    final hasMem = context.read<MembershipBloc>().state.maybeWhen(loaded: (_) => true, orElse: () => false);
    if (state == AppLifecycleState.resumed && !hasMem) {
      context.read<MembershipBloc>().add(MembershipEvent.getCurrentPlan());
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final locale = AppLocalizations.of(context)!;
    final lang = context.read<LocaleCubit>().state.locale.languageCode;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (panelController.isPanelOpen || panelController.isPanelAnimating) {
          panelController.close();
          return;
        }
        SystemNavigator.pop();
      },
      child: BlocProvider(
        create: (context) => StopwatchCubit(prefs: di.sl()),
        lazy: false,
        child: Stack(
          children: [
            BlocListener<MembershipBloc, MembershipState>(
              child: const SizedBox(),
              listener: (context, state) => state.whenOrNull(
                loaded: (m) {
                  if (!m.isNotified) {
                    showDialog(context: context, builder: (_) => MembershipCongratsDialog());
                    context.read<MembershipBloc>().add(MembershipEvent.notifyNewMembership());
                  }
                  return;
                },
              ),
            ),

            Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Theme.of(context).colorScheme.surface,
                title: Text(
                  APP_NAME,
                  style: TextStyle(fontFamily: 'Playwrite', color: Theme.of(context).colorScheme.primary),
                ),
                leading: IconButton(
                  onPressed: () => showDialog(context: context, builder: (_) => const QrAlertDialog()),
                  icon: const Icon(Icons.qr_code_2_outlined),
                  color: Colors.blueGrey,
                ),
                actions: [
                  IconButton(
                    iconSize: 25,
                    onPressed: () => Navigator.pushNamed(context, AppRoutes.settings),
                    icon: const Icon(Icons.settings, color: Colors.blueGrey),
                  ),
                ],
              ),
              body: Stack(
                fit: StackFit.expand,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        //
                        // Practice Panel
                        //
                        BlocBuilder<SessionBloc, SessionState>(
                          builder: (context, state) {
                            return PracticePanel(
                              onPractice: state.maybeWhen(
                                noActiveSession: () => panelController.open,
                                loaded: (s) =>
                                    () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => BlocProvider.value(
                                          value: context.read<StopwatchCubit>()
                                            ..startStopWatch(DateTime.now().difference(s.createdAt)),
                                          child: PracticeScreen(dayName: s.dayName, startDate: s.createdAt),
                                        ),
                                      ),
                                    ),
                                // ignore: avoid_print
                                error: (e) =>
                                    () => print(e.getErrorMessage()),
                                orElse: () => () {},
                              ),
                              onMeasurement: () => Navigator.pushNamed(context, AppRoutes.measurements),
                              onAnalytics: () => Navigator.pushNamed(context, AppRoutes.performance),
                              mainIcon: state.maybeWhen(
                                loading: () => const LoadingIndicator(),
                                noActiveSession: () =>
                                    Icon(Icons.rocket, size: 50, color: Theme.of(context).colorScheme.primary),
                                loaded: (s) => const Icon(Icons.rocket_launch, size: 50, color: Colors.green),
                                error: (f) => const Icon(Icons.refresh, color: Colors.red, size: 50),
                                orElse: () => const SizedBox(),
                              ),
                            );
                          },
                        ),
                        BlocBuilder<CurrentRoutineCubit, CurrentRoutineState>(
                          builder: (context, state) {
                            return state.map(
                              initial: (_) => const SizedBox(),
                              loading: (_) => const RoutineSkeleton(),
                              loaded: (state) => RoutineWithHeat(
                                routine: state.c,
                                heat: state.heat,
                                onMenu: null,
                                onTap: () async {
                                  await Navigator.pushNamed(context, AppRoutes.routineManager);
                                  if (context.mounted) {
                                    context.read<CurrentRoutineCubit>().getCurrentRoutine();
                                  }
                                },
                              ),
                              error: (state) => RoutineSkeleton(
                                onTap: () async {
                                  await Navigator.pushNamed(context, AppRoutes.routineManager);
                                  if (context.mounted) {
                                    context.read<CurrentRoutineCubit>().getCurrentRoutine();
                                  }
                                },
                              ),
                            );
                          },
                        ),
                        const SizedBox(),
                        BlocBuilder<DailyQuoteCubit, DailyQuoteState>(
                          builder: (context, state) => state.map(
                            initial: (_) => const LoadingIndicator(),
                            loaded: (s) => CaptainUniCard(
                              imagePath: CaptainImages.motive,
                              needsFlip: false,
                              content: s.quote.quote[parseLang(lang)]!,
                              gradient: LinearGradient(
                                colors: [
                                  Theme.of(context).colorScheme.primary,
                                  Theme.of(context).colorScheme.secondary,
                                ],
                              ),
                              onCapTap: () => Navigator.pushNamed(context, AppRoutes.capAbout),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0.0,
                    width: screenSize.width,
                    height: 35,
                    child: Builder(
                      builder: (context) {
                        final accountCubit = context.watch<AccountCubit>();
                        final membershipBloc = context.watch<MembershipBloc>();

                        return accountCubit.state.map(
                          initial: (s) => const SizedBox(),
                          unauthenticated: (s) => AlertBar(
                            content: Text(locale.signinAlert, style: const TextStyle(fontSize: 12)),
                            actionText: locale.signin,
                            action: () => Navigator.pushNamed(context, AppRoutes.auth),
                          ),
                          hasAccount: (acc) => membershipBloc.state.maybeMap(
                            orElse: () => const SizedBox(),
                            error: (err) => err.f.maybeMap(
                              orElse: () => notifyUpgrade
                                  ? AlertBar(
                                      color: Colors.amber.shade300,
                                      foregroundColor: Colors.black87,
                                      content: Text(
                                        locale.upgradeAlert,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Color.fromRGBO(47, 53, 53, 1),
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      actionText: locale.upgrade,
                                      action: () => Navigator.pushNamed(context, AppRoutes.plans),
                                      close: () => setState(() => notifyUpgrade = false),
                                    )
                                  : const SizedBox(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Center(
                  //   child: SizedBox(
                  //     width: 100,
                  //     height: 100,
                  //     child: ElevatedButton(onPressed: () {}, child: Text('')),
                  //   ),
                  // ),
                ],
              ),
            ),
            SlidingUpPanel(
              minHeight: 0.0,
              maxHeight: screenSize.height - kToolbarHeight,
              backdropEnabled: true,
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              controller: panelController,
              panel: Material(
                color: Colors.transparent,
                child: BlocBuilder<CurrentRoutineCubit, CurrentRoutineState>(
                  builder: (context, state) {
                    return state.maybeMap(
                      loaded: (state) => Column(
                        children: [
                          const SizedBox(height: 10),
                          SizedBox(
                            height: screenSize.height * 0.3,
                            child: const Image(image: AssetImage(CaptainImages.selectDay)),
                          ),
                          Text(locale.dayQuete),
                          ...state.c.trainingDays.map(
                            (day) => PracticeDayItem(
                              day: day,
                              isSelected: state.heat.lastdayId == day.id,
                              onSelect: () async {
                                context.read<SessionBloc>().add(SessionEvent.startSession(day.id!, day.name));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => MultiBlocProvider(
                                      providers: [
                                        BlocProvider.value(value: context.read<SessionBloc>()),
                                        BlocProvider.value(value: context.read<StopwatchCubit>()..startStopWatch()),
                                      ],
                                      child: PracticeScreen(dayName: day.name, startDate: DateTime.now()),
                                    ),
                                  ),
                                );
                                panelController.close();
                              },
                            ),
                          ),
                        ],
                      ),
                      orElse: () => Column(
                        children: [
                          Image(image: const AssetImage(CaptainImages.noTrainingDays), width: screenSize.width * .60),
                          Text(locale.noTrainingProgram),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
