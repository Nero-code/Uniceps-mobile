import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:uniceps/app/presentation/home/widgets/home_card.dart';
import 'package:uniceps/app/presentation/home/widgets/routine_day_item.dart';
import 'package:uniceps/app/presentation/home/blocs/current_routine/current_routine_cubit.dart';
import 'package:uniceps/app/presentation/home/blocs/session/session_bloc.dart';
import 'package:uniceps/app/presentation/home/blocs/stopwatch/stopwatch_cubit.dart';
import 'package:uniceps/app/presentation/practice/screens/practice_screen.dart';
import 'package:uniceps/app/presentation/practice/widgets/play_widget.dart';
import 'package:uniceps/app/presentation/screens/loading_page.dart';
import 'package:uniceps/app/presentation/screens/profile/settings/widgets/settings_tile.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/widgets/error_widget.dart';
import 'package:uniceps/injection_dependency.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final locale = AppLocalizations.of(context)!;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (panelController.isPanelOpen) {
          panelController.close();
          return;
        }
        SystemNavigator.pop();
      },
      child: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  CurrentRoutineCubit(commands: sl())..getCurrentRoutine(),
              lazy: false,
            ),
            BlocProvider(
              create: (context) =>
                  SessionBloc(commands: sl())..add(GetLastActiveSessionEvent()),
            ),
            BlocProvider(
              create: (context) =>
                  StopwatchCubit(prefs: sl())..getStopwatchTime(),
              lazy: false,
            ),
          ],
          child: Stack(
            children: [
              //
              //  G R A D I E N T   B A C K G R O U N D
              //
              Container(
                height: screenSize.height * 0.27,
                width: screenSize.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      // mainBlueDark,
                      Theme.of(context).colorScheme.primary,
                      // Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary,

                      Theme.of(context).colorScheme.surface,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [
                      0.1,
                      // 0.5,
                      0.8,
                      1,
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  SafeArea(
                    child: SizedBox(
                      height: kToolbarHeight,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: IconButton(
                                  onPressed: () {},
                                  color: Colors.white,
                                  icon: const Icon(Icons.person)),
                            ),
                            const Expanded(
                              flex: 4,
                              child: Center(
                                  child: Text(
                                "Hello flan",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )),
                            ),
                            const Expanded(child: SizedBox()),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const HomeCard(),
                  const SizedBox(height: 10), // Divider
                  //
                  // Stop watch widget
                  //
                  BlocBuilder<StopwatchCubit, StopwatchState>(
                      builder: (context, state) =>
                          Text(state.time == "00:00:00" ? "" : state.time)),
                  //
                  // Practice Panel
                  //
                  SizedBox(
                    width: screenSize.width * 0.9,
                    // height: screenSize.width * 0.17,
                    child: BlocConsumer<SessionBloc, SessionState>(
                      listener: (context, state) async {
                        final sessionBloc = context.read<SessionBloc>();
                        final stopwatchCubit = context.read<StopwatchCubit>();
                        final currentRoutineCubit =
                            context.read<CurrentRoutineCubit>();

                        await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MultiBlocProvider(
                                  providers: [
                                    BlocProvider.value(value: sessionBloc),
                                    BlocProvider.value(
                                        value: stopwatchCubit
                                          ..startStopWatch()),
                                  ],
                                  child: const PracticeScreen(),
                                )));
                        currentRoutineCubit.getCurrentRoutine();
                      },
                      //
                      listenWhen: (previous, current) =>
                          (previous is NoActiveSessionState) &&
                          (current is SessionLoadedState),
                      //
                      builder: (context, state) {
                        if (state is SessionLoadedState) {
                          return PlayWidget(
                            hasOldSession: true,
                            onClose: () {
                              context.read<SessionBloc>().add(
                                  StopSessionEvent(session: state.session));
                              context.read<StopwatchCubit>().resetStopwatch();
                            },
                            onStart: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => MultiBlocProvider(
                                  providers: [
                                    BlocProvider.value(
                                      value: context.read<SessionBloc>(),
                                    ),
                                    BlocProvider.value(
                                      value: context.read<StopwatchCubit>()
                                        ..startStopWatch(),
                                    ),
                                  ],
                                  child: const PracticeScreen(),
                                ),
                              ),
                            ),
                          );
                        } else if (state is NoActiveSessionState) {
                          return PlayWidget(
                            hasOldSession: false,
                            onStart: () async => await panelController.open(),
                          );
                        } else if (state is SessionErrorState) {
                          return ErrorScreenWidget(f: state.failure);
                        }
                        return const LoadingPage();
                      },
                    ),
                  ),
                  const SizedBox(height: 20), // Divider
                  Table(
                    children: [
                      TableRow(
                        children: [
                          SettingsTile(
                            icon: Icons.account_circle,
                            iconsColor: Colors.deepOrange,
                            title: locale.profile,
                            subtitle: "",
                            onPressed: () async {},
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
                              // onPressed: () => Navigator.of(context)
                              //     .pushNamed(ROUTE_MEASUREMENTS),
                              onPressed: () {}),
                          SettingsTile(
                            icon: Icons.language,
                            iconsColor: Colors.blue,
                            title: locale.language,
                            subtitle: "",
                            onPressed: () {},
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
                            // onPressed: () => Navigator.of(context)
                            //     .pushNamed(ROUTE_ABOUT),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SlidingUpPanel(
                minHeight: 0.0,
                maxHeight: screenSize.height - kToolbarHeight,
                backdropEnabled: true,
                color: Colors.white,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15)),
                controller: panelController,
                panel: BlocBuilder<CurrentRoutineCubit, CurrentRoutineState>(
                  builder: (context, state) {
                    if (state is CurrentRoutineLoadedState) {
                      return Column(
                        children: [
                          const SizedBox(height: 10),
                          SizedBox(
                            height: screenSize.height * 0.3,
                            child: const Image(image: AssetImage(IMG_BACK)),
                          ),
                          Text(locale.dayQuete),
                          ...state.routine.trainingDays
                              .map((day) => RoutineDayItem(
                                    day: day,
                                    isSelected: state.lastDayId == day.id,
                                    onSelect: () async {
                                      context.read<SessionBloc>().add(
                                          StartSessionEvent(dayId: day.id!));
                                      await panelController.close();
                                    },
                                  )),
                        ],
                      );
                    }
                    return const LoadingPage();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
