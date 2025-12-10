import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'stopwatch_state.dart';

class StopwatchCubit extends Cubit<StopwatchState> {
  final stopwatch = Stopwatch();
  // bool get isRunning => stopwatch.isRunning;
  Timer? _timer;
  // Duration? _duration;
  final SharedPreferences prefs;
  StopwatchCubit({required this.prefs}) : super(const StopwatchState(time: "00:00:00", isRunning: false));

  // void getStopwatchTime() {
  //   final time = prefs.getString('time');
  //   if (time != null) {
  //     final parseTime = time.split(':').map(int.parse).toList();
  //     _duration = Duration(
  //       hours: parseTime[0],
  //       minutes: parseTime[1],
  //       seconds: parseTime[2],
  //     );
  //     emit(StopwatchState(isRunning: false, time: time));
  //   }
  // }

  void startStopWatch([Duration elapsed = Duration.zero]) {
    _timer?.cancel();
    stopwatch.start();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      emit(StopwatchState(time: formatDuration(elapsed + stopwatch.elapsed), isRunning: true));
    });
  }

  // void stopStopwatch() async {
  //   stopwatch.stop();
  //   _timer?.cancel();
  //   await prefs.setString("time", formatDuration(stopwatch.elapsed + (_duration ?? Duration.zero)));
  // }

  void resetStopwatch() async {
    _timer?.cancel();
    stopwatch.stop();
    stopwatch.reset();
    // _duration = null;

    // await prefs.setString("time", formatDuration(Duration.zero));
    emit(StopwatchState(time: formatDuration(stopwatch.elapsed), isRunning: false));
  }

  // Duration get stoptime => stopwatch.elapsed + (_duration ?? Duration.zero);

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));

    return "$hours:$minutes:$seconds";
  }

  @override
  Future<void> close() async {
    stopwatch.reset();
    _timer?.cancel();
    // await prefs.setString("time", formatDuration(stopwatch.elapsed + (_duration ?? Duration.zero)));
    await super.close();
  }
}
