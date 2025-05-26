import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'stopwatch_state.dart';

class StopwatchCubit extends Cubit<StopwatchState> {
  final _stopwatch = Stopwatch();
  bool get isRunning => _stopwatch.isRunning;
  Timer? _timer;
  StopwatchCubit()
      : super(const StopwatchState(time: "00:00:00", isRunning: false));

  void startStopWatch() {
    _stopwatch.start();
    _timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) => emit(StopwatchState(
            time: formatDuration(_stopwatch.elapsed), isRunning: true)));
  }

  void stopStopwatch() {
    _stopwatch.stop();
    _timer?.cancel();
    emit(StopwatchState(
        time: formatDuration(_stopwatch.elapsed), isRunning: false));
  }

  void resetStopwatch() {
    _stopwatch.reset();
    emit(StopwatchState(
        time: formatDuration(_stopwatch.elapsed), isRunning: true));
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));

    return "$hours:$minutes:$seconds";
  }

  @override
  Future<void> close() {
    _stopwatch.stop();
    _timer?.cancel();
    return super.close();
  }
}
