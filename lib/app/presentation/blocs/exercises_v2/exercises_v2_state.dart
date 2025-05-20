part of 'exercises_v2_bloc.dart';

sealed class ExercisesV2State extends Equatable {
  const ExercisesV2State();

  @override
  List<Object> get props => [];
}

final class ExercisesV2Initial extends ExercisesV2State {}

final class ExercisesV2LoadingState extends ExercisesV2State {}

final class ExercisesV2LoadedState extends ExercisesV2State {
  final List<ExerciseV2> list, selected;
  const ExercisesV2LoadedState({required this.list, required this.selected});

  @override
  List<Object> get props => [list.length, selected.length];
}

final class ExercisesV2ErrorState extends ExercisesV2State {
  final Failure failure;

  const ExercisesV2ErrorState({required this.failure});
}
