part of 'current_routine_cubit.dart';

sealed class CurrentRoutineState extends Equatable {
  const CurrentRoutineState();
  @override
  List<Object?> get props => [];
}

final class CurrentRoutineInitial extends CurrentRoutineState {}

final class CurrentRoutineLoadingState extends CurrentRoutineState {}

final class CurrentRoutineLoadedState extends CurrentRoutineState {
  final int? lastDayId;
  final Routine routine;

  const CurrentRoutineLoadedState({required this.routine, this.lastDayId});
}

final class CurrentRoutineErrorState extends CurrentRoutineState {
  final Failure failure;
  const CurrentRoutineErrorState({required this.failure});
}
