import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/practice/cubit/stopwatch_cubit.dart';
import 'package:uniceps/app/presentation/practice/widgets/round_widget.dart';
import 'package:uniceps/core/constants/constants.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  // ---------------------------------------------------------------------------
  // TIMER Logic and STOPWATCH variables and functions are put here.
  final _stopwatch = Stopwatch();
  Timer? _timer;

  // void startStopWatch() {
  //   _stopwatch.start();
  //   _timer =
  //       Timer.periodic(const Duration(seconds: 1), (timer) => setState(() {}));
  // }

  // void stopStopwatch() {
  //   _stopwatch.stop();
  //   _timer?.cancel();
  // }

  // void resetStopwatch() {
  //   _stopwatch.reset();
  //   setState(() {});
  // }

  // String formatDuration(Duration duration) {
  //   String twoDigits(int n) => n.toString().padLeft(2, "0");
  //   String hours = twoDigits(duration.inHours);
  //   String minutes = twoDigits(duration.inMinutes.remainder(60));
  //   String seconds = twoDigits(duration.inSeconds.remainder(60));

  //   return "$hours:$minutes:$seconds";
  // }

  // ---------------------------------------------------------------------------

  // ---------------------------------------------------------------------------
  // Expansion list variable and flags will be put here.

  int? expandedIndex;

  // ---------------------------------------------------------------------------
  @override
  void initState() {
    super.initState();
    // startStopWatch();
  }

  @override
  void dispose() {
    _stopwatch.stop();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) => StopwatchCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("day 1"),
              BlocBuilder<StopwatchCubit, StopwatchState>(
                builder: (context, state) {
                  if (!state.isRunning) {
                    BlocProvider.of<StopwatchCubit>(context).startStopWatch();
                  }
                  return Text(
                    // formatDuration(_stopwatch.elapsed),
                    state.time,
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      color: Colors.grey.shade700,
                      fontSize: 26,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            SizedBox.expand(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 100),
                child: ExpansionPanelList(
                  expansionCallback: (panelIndex, isExpanded) {
                    print(
                        "Expansion Function: $panelIndex : $isExpanded : $expandedIndex");

                    isExpanded
                        ? expandedIndex = panelIndex
                        : expandedIndex = null;
                    setState(() {});
                  },
                  children: [0, 1, 2, 3]
                      .map(
                        (i) => ExpansionPanel(
                          isExpanded: expandedIndex == i,
                          canTapOnHeader: true,
                          headerBuilder: (context, isExpanded) {
                            print("widget isExpanded: $isExpanded");
                            return Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  Image(
                                      image: const AssetImage(IMG_BACK),
                                      width: screenSize.width * 0.3),
                                  const Text("name name name"),
                                ],
                              ),
                            );
                          },
                          body: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [0, 1, 2, 3]
                                .map((i) => RoundWidget(
                                    index: i + 1,
                                    controller: null,
                                    lastWeight: null))
                                .toList(),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              width: screenSize.width,
              child: Container(
                height: 60,
                padding: const EdgeInsets.all(8.0),
                color: Colors.white,
                child: ElevatedButton(
                    onPressed: () {}, child: const Icon(Icons.bolt)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
