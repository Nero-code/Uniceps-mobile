part of 'exercises_bloc.dart';

sealed class ExercisesState extends Equatable {
  const ExercisesState();

  @override
  List<Object> get props => [];
}

final class ExercisesInitial extends ExercisesState {}

final class ExercisesLoadedState extends ExercisesState {
  final List<Exercise> list;
  const ExercisesLoadedState(this.list);
}

final class ExercisesErrorState extends ExercisesState {
  final Failure f;
  const ExercisesErrorState(this.f);
}

final class ExercisesLoadingState extends ExercisesState {}

final class ExercisesUpdatedState extends ExercisesState {}
