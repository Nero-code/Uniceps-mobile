part of 'training_bloc.dart';

sealed class TrainingState extends Equatable {
  const TrainingState();

  @override
  List<Object> get props => [];
}

final class TrainingInitial extends TrainingState {}

///   Training States

final class TrainingProgramLoadedState extends TrainingState {
  final TrainingProgram program;
  // final List<Exercise> filterList;
  const TrainingProgramLoadedState({required this.program});
}

final class TrainingProgramLoadingState extends TrainingState {}

final class TrainingProgramErrorState extends TrainingState {
  final Failure f;
  const TrainingProgramErrorState({required this.f});
}

///   Exercises States

// final class ExercisesLoadingState extends TrainingState {}

// final class ExercisesLoadedState extends TrainingState {
//   final List<Exercise> list;
//   const ExercisesLoadedState({required this.list});
// }

// final class ExercisesErrorState extends TrainingState {
//   final Failure f;
//   const ExercisesErrorState({required this.f});
// }
