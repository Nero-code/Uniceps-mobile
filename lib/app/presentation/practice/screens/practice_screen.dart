import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uniceps/app/presentation/practice/widgets/practice_widget.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  final _stopwatch = Stopwatch();
  Timer? _timer;

  void _startStopWatch() {
    _stopwatch.start();
    _timer =
        Timer.periodic(const Duration(seconds: 1), (timer) => setState(() {}));
  }

  void _stopStopwatch() {
    _stopwatch.stop();
    _timer?.cancel();
  }

  void _resetStopwatch() {
    _stopwatch.reset();
    setState(() {});
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));

    return "$hours:$minutes:$seconds";
  }

  @override
  void dispose() {
    _stopwatch.stop();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        centerTitle: true,
        title: Text(
          formatDuration(_stopwatch.elapsed),
          style: TextStyle(
            fontWeight: FontWeight.w100,
            color: Colors.grey.shade700,
            fontSize: 26,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        child: _stopwatch.isRunning
            ? const Icon(Icons.pause, size: 25)
            : const Icon(Icons.play_arrow_rounded, size: 30),
        onPressed: () {
          if (_stopwatch.isRunning) {
            _stopStopwatch();
          } else {
            _startStopWatch();
          }
          setState(() {});
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: ListView.builder(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          itemCount: 5,
          itemBuilder: (context, index) {
            return PracticeWidget(isExpanded: index == 0);
          }),
    );
  }
}
