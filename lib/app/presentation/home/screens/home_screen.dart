import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:uniceps/app/presentation/blocs/account/account_cubit.dart';
import 'package:uniceps/app/presentation/blocs/membership/membership_bloc.dart';
import 'package:uniceps/app/presentation/home/widgets/alert_bar.dart';
import 'package:uniceps/app/presentation/home/widgets/captain_uni_card.dart';
import 'package:uniceps/app/presentation/home/widgets/practice_day_item.dart';
import 'package:uniceps/app/presentation/home/blocs/current_routine/current_routine_cubit.dart';
import 'package:uniceps/app/presentation/home/blocs/session/session_bloc.dart';
import 'package:uniceps/app/presentation/home/blocs/stopwatch/stopwatch_cubit.dart';
import 'package:uniceps/app/presentation/home/widgets/practice_panel.dart';
import 'package:uniceps/app/presentation/home/widgets/routine_skeleton.dart';
import 'package:uniceps/app/presentation/practice/screens/practice_screen.dart';
import 'package:uniceps/app/presentation/routine/widgets/routine_with_heat.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/core/constants/app_routes.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/injection_dependency.dart' as di;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final panelController = PanelController();

  bool notifyUpgrade = true;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final locale = AppLocalizations.of(context)!;
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
        create: (context) => StopwatchCubit(prefs: di.sl())..getStopwatchTime(),
        lazy: false,
        child: Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Theme.of(context).colorScheme.surface,
                title: const Text(APP_NAME),
                leading: const Center(
                  child: Image(image: AssetImage(APP_LOGO), height: 30, width: 30),
                ),
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
                                  loaded: (s) => () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => BlocProvider.value(
                                                value: context.read<StopwatchCubit>()..startStopWatch(),
                                                child: const PracticeScreen(),
                                              ))),
                                  error: (e) => () => print(e.getErrorMessage()),
                                  orElse: () => () {}),
                              onSettings: () => Navigator.pushNamed(context, AppRoutes.settings),
                              onAnalytics: () => Navigator.pushNamed(context, AppRoutes.performance),
                              mainIcon: state.maybeWhen(
                                loading: () => const LoadingIndicator(),
                                noActiveSession: () => Icon(
                                  Icons.rocket,
                                  size: 50,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                loaded: (s) => const Icon(
                                  Icons.rocket_launch,
                                  size: 50,
                                  color: Colors.amber,
                                ),
                                error: (f) => const Icon(
                                  Icons.refresh,
                                  color: Colors.red,
                                  size: 50,
                                ),
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
                                    }),
                                error: (state) => RoutineSkeleton(onTap: () async {
                                      await Navigator.pushNamed(context, AppRoutes.routineManager);
                                      if (context.mounted) {
                                        context.read<CurrentRoutineCubit>().getCurrentRoutine();
                                      }
                                    }));
                          },
                        ),
                        const SizedBox(),
                        CaptainUniCard(
                          imagePath: IMG_CAP_MOTIVE,
                          needsFlip: false,
                          content: "content",
                          gradient: LinearGradient(colors: [
                            Theme.of(context).colorScheme.primary,
                            Theme.of(context).colorScheme.secondary,
                          ]),
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
                                        color: Colors.teal,
                                        foregroundColor: Colors.white70,
                                        content: Text(
                                          locale.upgradeAlert,
                                          style:
                                              const TextStyle(fontSize: 12, color: Color.fromARGB(255, 255, 222, 132)),
                                        ),
                                        actionText: locale.upgrade,
                                        action: () => Navigator.pushNamed(context, AppRoutes.plans),
                                        close: () => setState(() => notifyUpgrade = false))
                                    : const SizedBox()),
                          ),
                        );
                      },
                    ),
                  ),
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
                            child: const Image(image: AssetImage(IMG_CAP_SELECT_DAY)),
                          ),
                          Text(locale.dayQuete),
                          ...state.c.trainingDays.map((day) => PracticeDayItem(
                                day: day,
                                isSelected: state.heat.lastdayId == day.id,
                                onSelect: () async {
                                  context.read<SessionBloc>().add(SessionEvent.startSession(day.id!));
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => MultiBlocProvider(
                                          providers: [
                                            BlocProvider.value(
                                              value: context.read<SessionBloc>(),
                                            ),
                                            BlocProvider.value(
                                              value: context.read<StopwatchCubit>()..startStopWatch(),
                                            ),
                                          ],
                                          child: const PracticeScreen(),
                                        ),
                                      ));
                                  await panelController.close();
                                },
                              )),
                        ],
                      ),
                      orElse: () => Column(
                        children: [
                          Image(
                            image: const AssetImage(IMG_BLANK),
                            width: screenSize.width * .75,
                          ),
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
