import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_session.dart';
import 'package:uniceps/app/presentation/home/blocs/current_routine/current_routine_cubit.dart';
import 'package:uniceps/app/presentation/practice/blocs/practice/practice_cubit.dart';
import 'package:uniceps/app/presentation/home/blocs/session/session_bloc.dart';
import 'package:uniceps/app/presentation/home/blocs/stopwatch/stopwatch_cubit.dart';
import 'package:uniceps/app/presentation/practice/dialogs/confirmation_dialog.dart';
import 'package:uniceps/app/presentation/practice/dialogs/session_complete_dialog.dart';
import 'package:uniceps/app/presentation/practice/widgets/practice_body.dart';
import 'package:uniceps/app/presentation/practice/widgets/practice_header.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/injection_dependency.dart' as di;

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  int? expandedId, totalProgress;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final screenSize = MediaQuery.sizeOf(context);
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (kDebugMode) {
          print("didPop:  $didPop");
          print("result:  $result");
          print("mounted: ${context.mounted}");
        }
        if (context.mounted) {
          context.read<StopwatchCubit>().stopStopwatch();
          context.read<CurrentRoutineCubit>().getCurrentRoutine();
        }
      },
      child: BlocConsumer<SessionBloc, SessionState>(
        // --------------------------------------------------------
        // Closing-Session State
        // When: (previous, current) => current is NoActiveSessionState,
        listenWhen: (previous, current) => current.maybeWhen(orElse: () => false, noActiveSession: () => true),
        listener: (context, state) async {
          await showDialog(context: context, builder: (context) => const SessionCompleteDialog());
          if (context.mounted) Navigator.pop(context);
        },
        // --------------------------------------------------------
        buildWhen: (previous, current) => current.maybeWhen(orElse: () => false, loaded: (session) => true),
        builder: (context, sessionState) {
          return sessionState.map(
            initial: (_) => const SizedBox(),
            loading: (_) => const Material(child: LoadingIndicator()),
            noActiveSession: (_) => const SizedBox(),
            error: (state) => Material(
              child: Center(
                child: Text(state.failure.getErrorMessage()),
              ),
            ),
            loaded: (sessionState) => BlocProvider(
              create: (context) => PracticeCubit(commands: di.sl())..getPracticeDay(sessionState.session.dayId),
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  centerTitle: true,

                  shadowColor: Colors.black,
                  bottom: PreferredSize(
                    preferredSize: Size(screenSize.width, 30),
                    child: BlocBuilder<StopwatchCubit, StopwatchState>(
                      builder: (context, state) => Text(
                        state.time,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          // color: Colors.grey.shade700,
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  title: BlocSelector<PracticeCubit, PracticeState, String>(
                    selector: (state) => (state is PracticeLoadedState) ? state.day.name : "",
                    builder: (context, dayName) => Text(dayName, style: TextStyle(color: Colors.grey.shade700)),
                  ),
                  // title: Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Expanded(
                  //       child: BlocSelector<PracticeCubit, PracticeState, String>(
                  //         selector: (state) => (state is PracticeLoadedState) ? state.day.name : "",
                  //         builder: (context, dayName) => Text(dayName),
                  //       ),
                  //     ),
                  //     const SizedBox(width: 5),
                  //     BlocBuilder<StopwatchCubit, StopwatchState>(
                  //       builder: (context, state) => Text(
                  //         state.time,
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.w100,
                  //           color: Colors.grey.shade700,
                  //           fontSize: 26,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ),
                body: Stack(
                  children: [
                    const SizedBox.expand(),
                    BlocBuilder<PracticeCubit, PracticeState>(
                      buildWhen: (previous, current) => current is PracticeLoadedState,
                      builder: (context, state) {
                        if (state is PracticeLoadedState) {
                          if (state.day.exercises.isNotEmpty) {
                            totalProgress = state.day.exercises.map((e) => e.sets.length).reduce((a, b) => a + b);
                          }

                          return SingleChildScrollView(
                            padding: const EdgeInsets.only(bottom: 100),
                            child: ExpansionPanelList(
                              animationDuration: const Duration(milliseconds: 500),
                              expandedHeaderPadding: EdgeInsets.zero,
                              expansionCallback: _expansionCallback,
                              children: state.day.exercises
                                  .map(
                                    (i) => ExpansionPanel(
                                      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
                                      isExpanded: expandedId == i.index,
                                      canTapOnHeader: true,
                                      headerBuilder: (_, __) => PracticeHeader(item: i),
                                      body: PracticeBody(
                                        sessionId: sessionState.session.id!,
                                        exId: i.exercise.apiId,
                                        exIndex: i.index,
                                        sets: i.sets,
                                        totalProgress: totalProgress ?? 0,
                                        logs: sessionState.session.logs
                                            .where((log) => log.exerciseId == i.exercise.apiId)
                                            .toList(),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          );
                        } else if (state is PracticeErrorState) {
                          return Center(child: Text(state.failure.getErrorMessage()));
                        }
                        return const LoadingIndicator();
                      },
                    ),
                    Positioned(
                      bottom: 0.0,
                      width: screenSize.width,
                      child: Container(
                        height: 60,
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.white,
                        child: ElevatedButton(
                            onPressed: () {
                              final fullSession = sessionState.session.logs.length == totalProgress;
                              _finishSession(context, sessionState.session, fullSession);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.bolt, size: 25),
                                Text(
                                  locale.finish,
                                  style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _finishSession(BuildContext context, TSession session, bool fullSession) {
    showDialog<bool>(
        context: context,
        builder: (_) {
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(value: context.read<SessionBloc>()),
              BlocProvider.value(value: context.read<StopwatchCubit>()),
              BlocProvider.value(value: context.read<CurrentRoutineCubit>()),
            ],
            child: ConfirmationDialog(
              onConfirm: () {
                context.read<SessionBloc>().add(SessionEvent.stopSession(session, fullSession));
                context.read<StopwatchCubit>().resetStopwatch();
                context.read<CurrentRoutineCubit>().getCurrentRoutine();
              },
            ),
          );
        });
  }

  void _expansionCallback(int panelIndex, bool isExpanded) {
    isExpanded ? expandedId = panelIndex : expandedId = null;
    setState(() {});
  }
}
