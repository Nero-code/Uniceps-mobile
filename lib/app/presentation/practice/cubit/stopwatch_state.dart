part of 'stopwatch_cubit.dart';

class StopwatchState extends Equatable {
  final String time;
  final bool isRunning;
  const StopwatchState({required this.isRunning, required this.time});

  @override
  List<Object?> get props => [time];
}
