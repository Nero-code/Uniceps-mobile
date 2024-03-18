part of 'training_bloc.dart';

sealed class TrainingState extends Equatable {
  const TrainingState();

  @override
  List<Object> get props => [];
}

final class TrainingInitial extends TrainingState {}

final class TrainingProgramLoadedState extends TrainingState {}

final class TrainingProgramLoadingState extends TrainingState {}

final class ExercisesLoadingState extends TrainingState {}

final class ExercisesLoadedState extends TrainingState {}

final class SubscriptionsLoadingState extends TrainingState {}

final class SubscriptionsLoadedState extends TrainingState {}
