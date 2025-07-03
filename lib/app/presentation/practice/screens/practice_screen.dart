import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_log.dart';
import 'package:uniceps/app/presentation/practice/blocs/practice/practice_cubit.dart';
import 'package:uniceps/app/presentation/home/blocs/session/session_bloc.dart';
import 'package:uniceps/app/presentation/home/blocs/stopwatch/stopwatch_cubit.dart';
import 'package:uniceps/app/presentation/practice/dialogs/confirmation_dialog.dart';
import 'package:uniceps/app/presentation/practice/dialogs/session_complete_dialog.dart';
import 'package:uniceps/app/presentation/practice/widgets/practice_body.dart';
import 'package:uniceps/app/presentation/practice/widgets/practice_header.dart';
import 'package:uniceps/app/presentation/screens/loading_page.dart';
import 'package:uniceps/injection_dependency.dart' as di;

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  int? expandedId;

  @override
  Widget build(BuildContext context) {
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
        }
      },
      child: BlocConsumer<SessionBloc, SessionState>(
        // --------------------------------------------------------
        // Closing-Session State
        listenWhen: (previous, current) =>
            (previous is SessionLoadingState) &&
            (current is NoActiveSessionState),
        listener: (context, state) async {
          print("b finished Session ${state.runtimeType}");
          await showDialog(
              context: context,
              builder: (context) => const SessionCompleteDialog());
          print("a finished Session ${state.runtimeType}");
          // ignore: use_build_context_synchronously
          Navigator.pop(context);
        },
        // --------------------------------------------------------
        builder: (context, sessionState) {
          if (sessionState is SessionLoadedState) {
            return BlocProvider(
              create: (context) => PracticeCubit(commands: di.sl())
                ..getPracticeDay(sessionState.session.dayId),
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  centerTitle: true,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocSelector<PracticeCubit, PracticeState, String>(
                        selector: (state) => (state is PracticeLoadedState)
                            ? state.day.name
                            : "",
                        builder: (context, dayName) => Text(dayName),
                      ),
                      BlocBuilder<StopwatchCubit, StopwatchState>(
                        builder: (context, state) => Text(
                          state.time,
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                            color: Colors.grey.shade700,
                            fontSize: 26,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                body: Stack(
                  children: [
                    const SizedBox.expand(),
                    BlocBuilder<PracticeCubit, PracticeState>(
                      builder: (context, state) {
                        if (state is PracticeLoadedState) {
                          return SingleChildScrollView(
                            padding: const EdgeInsets.only(bottom: 100),
                            child: ExpansionPanelList(
                              expandedHeaderPadding: EdgeInsets.zero,
                              expansionCallback: _expansionCallback,
                              children: state.day.exercises
                                  .map((i) => ExpansionPanel(
                                        backgroundColor: const Color.fromARGB(
                                            255, 250, 250, 250),
                                        isExpanded: expandedId == i.index,
                                        canTapOnHeader: true,
                                        headerBuilder: (_, isExpanded) =>
                                            PracticeHeader(item: i),
                                        body: PracticeBody(
                                          sets: i.sets,
                                          logs: sessionState.session.logs
                                              .where((log) =>
                                                  log.exerciseId ==
                                                  i.exercise.apiId)
                                              .toList(),
                                          onPressed: (set, weight, oldLog) {
                                            if (oldLog == null) {
                                              context.read<SessionBloc>().add(
                                                    LogSetEvent(
                                                      log: TLog(
                                                          id: null,
                                                          sessionId:
                                                              sessionState
                                                                  .session.id!,
                                                          exerciseId:
                                                              i.exercise.apiId!,
                                                          exerciseIndex:
                                                              i.index,
                                                          setIndex: set.index,
                                                          reps: set.reps,
                                                          weight: weight,
                                                          completedAt:
                                                              DateTime.now(),
                                                          apiId: null),
                                                    ),
                                                  );
                                            } else {
                                              context
                                                  .read<SessionBloc>()
                                                  .add(LogSetEvent(
                                                    log: oldLog.copywith(
                                                        weight: weight),
                                                  ));
                                            }
                                          },
                                        ),
                                      ))
                                  .toList(),
                            ),
                          );
                        } else if (state is PracticeErrorState) {
                          return Center(
                              child: Text(state.failure.getErrorMessage() +
                                  " practice state"));
                        }
                        return const LoadingPage();
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
                              _finishSession(context, sessionState);
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.bolt, size: 25),
                                // TODO: Translate
                                Text(
                                  "Finish",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (sessionState is SessionErrorState) {
            return Material(
              child: Center(
                child: Text(
                    sessionState.failure.getErrorMessage() + " session state"),
              ),
            );
          }
          return const Material(child: LoadingPage());
        },
      ),
    );
  }

  void _finishSession(BuildContext context, SessionLoadedState sState) async {
    print("Finishing proccess");
    final confirmation = await showDialog<bool>(
        context: context, builder: (context) => const ConfirmationDialog());
    if ((confirmation ?? false) && context.mounted) {
      context
          .read<SessionBloc>()
          .add(StopSessionEvent(session: sState.session));
      context.read<StopwatchCubit>()
        ..stopStopwatch()
        ..resetStopwatch();
    }
  }

  void _expansionCallback(int panelIndex, bool isExpanded) {
    isExpanded ? expandedId = panelIndex : expandedId = null;
    setState(() {});
  }
}
