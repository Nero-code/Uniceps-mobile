import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:uniceps/app/presentation/blocs/app_state/app_state_cubit.dart';
import 'package:uniceps/app/presentation/home/widgets/alert_bar.dart';
import 'package:uniceps/app/presentation/home/widgets/captain_uni_card.dart';
import 'package:uniceps/app/presentation/home/widgets/current_routine_card.dart';
import 'package:uniceps/app/presentation/home/widgets/level_indicator.dart';
import 'package:uniceps/app/presentation/home/widgets/routine_day_item.dart';
import 'package:uniceps/app/presentation/home/blocs/current_routine/current_routine_cubit.dart';
import 'package:uniceps/app/presentation/home/blocs/session/session_bloc.dart';
import 'package:uniceps/app/presentation/home/blocs/stopwatch/stopwatch_cubit.dart';
import 'package:uniceps/app/presentation/screens/loading_page.dart';
import 'package:uniceps/core/constants/app_routes.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/widgets/box_botton.dart';
import 'package:uniceps/injection_dependency.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final panelController = PanelController();

  // C O N S T A N T S ----------------

  final double smallBtnIcon = 30;
  final double smallBtnSize = 60;

  final double largeBtnIcon = 50;
  final double largeBtnSize = 140;

  final btnBackgroundColor = const Color.fromARGB(29, 96, 125, 139);

  final bool isSigned = false;

  // ----------------------------------
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
      child: MultiBlocProvider(
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
            Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Theme.of(context).colorScheme.surface,
                title: const Text(
                  APP_NAME,
                  // style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: const Center(
                  child:
                      Image(image: AssetImage(APP_LOGO), height: 30, width: 30),
                ),
              ),
              body: Stack(
                fit: StackFit.expand,
                children: [
                  //
                  //  G R A D I E N T   B A C K G R O U N D
                  //

                  // Container(
                  //   height: screenSize.height * 0.50,
                  //   width: screenSize.width,
                  //   decoration: BoxDecoration(
                  //     gradient: RadialGradient(
                  //       colors: [
                  //         // mainBlueDark,
                  //         Theme.of(context).colorScheme.primary,
                  //         // Theme.of(context).colorScheme.primary,
                  //         Theme.of(context).colorScheme.secondary,
                  //         Theme.of(context).colorScheme.surface,
                  //       ],
                  //       // begin: Alignment.topCenter,
                  //       // end: Alignment.bottomCenter,
                  //       center: Alignment.topCenter,
                  //       stops: const [
                  //         0.1,
                  //         // 0.5,
                  //         0.8,
                  //         1,
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: screenSize.width,
                          height: screenSize.height * .30,
                          margin: const EdgeInsets.only(top: 50),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Stack(
                                  children: [
                                    SizedBox.square(
                                      dimension: 140,
                                      child: CircularProgressIndicator(
                                        strokeCap: StrokeCap.round,
                                        // color: Colors.blue.shade200,

                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        strokeWidth: 5,
                                        value: 0.0,
                                      ),
                                    ),
                                    BoxButton(
                                      isCircle: true,
                                      width: largeBtnSize,
                                      height: largeBtnSize,
                                      background: const Color.fromARGB(
                                          29, 154, 178, 190),
                                      // background: Color.fromARGB(37, 76, 175, 137),
                                      onTap: () {
                                        panelController.open();
                                      },
                                      child: Icon(
                                        Icons.rocket,
                                        size: largeBtnIcon,
                                        // color: Colors.green,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.lerp(Alignment.bottomLeft,
                                    Alignment.topCenter, .20)!,
                                child: BoxButton(
                                  isCircle: true,
                                  width: smallBtnSize,
                                  height: smallBtnSize,
                                  background: btnBackgroundColor,
                                  onTap: () {},
                                  child: Icon(
                                    Icons.bar_chart_rounded,
                                    size: smallBtnIcon,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.lerp(Alignment.bottomRight,
                                    Alignment.topCenter, .20)!,
                                child: BoxButton(
                                  isCircle: true,
                                  width: smallBtnSize,
                                  height: smallBtnSize,
                                  background: btnBackgroundColor,
                                  onTap: () {},
                                  child: Icon(
                                    Icons.settings,
                                    size: smallBtnIcon,
                                    // color: Colors.black54,
                                    color: Colors.blueGrey.shade700,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.lerp(Alignment.topLeft,
                                    Alignment.topCenter, 0.2)!,
                                child: BoxButton(
                                  isCircle: true,
                                  width: smallBtnSize,
                                  height: smallBtnSize,
                                  background: btnBackgroundColor,
                                  onTap: () {},
                                  child: const Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.local_fire_department,
                                          color: Colors.orange,
                                          size: 30,
                                        ),
                                        Text(
                                          "115",
                                          style: TextStyle(fontSize: 9),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.lerp(Alignment.topRight,
                                    Alignment.topCenter, 0.2)!,
                                child: const LevelIndicator(size: 60),
                              ),
                            ],
                          ),
                        ),
                        const CurrentRoutineCard(),
                        const SizedBox(),
                        const CaptainUniCard(),
                      ],
                    ),
                  ),

                  Positioned(
                    top: 0.0,
                    width: screenSize.width,
                    height: 35,
                    child: BlocBuilder<AppStateCubit, AppStateState>(
                      builder: (context, state) {
                        return state.maybeWhen<Widget>(
                            unauthenticated: () => AlertBar(
                                  content:
                                      "Hello Guest, sign in to see all features",
                                  actionText: "Sign In",
                                  action: () async {
                                    await Navigator.pushNamed(
                                        context, AppRoutes.auth);

                                    if (context.mounted) {
                                      context
                                          .read<AppStateCubit>()
                                          .getUserAccount();
                                    }
                                  },
                                ),
                            orElse: () => const SizedBox());
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
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              controller: panelController,
              panel: BlocBuilder<CurrentRoutineCubit, CurrentRoutineState>(
                builder: (context, state) {
                  if (state is CurrentRoutineLoadedState) {
                    return Material(
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          SizedBox(
                            height: screenSize.height * 0.3,
                            child: const Image(
                                image: AssetImage(IMG_CAP_SELECT_DAY)),
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
                      ),
                    );
                  }
                  return const LoadingPage();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
