part of 'training_bloc.dart';

sealed class TrainingState extends Equatable {
  const TrainingState();

  @override
  List<Object> get props => [];
}

final class TrainingInitial extends TrainingState {}

///   Training States

final class TrainingProgramLoadedState extends TrainingState {}

final class TrainingProgramLoadingState extends TrainingState {}

final class TrainingProgramErrorState extends TrainingState {}

///   Exercises States

final class ExercisesLoadingState extends TrainingState {}

final class ExercisesLoadedState extends TrainingState {}

final class ExercisesErrorState extends TrainingState {}

///   Subscriptions States

final class SubscriptionsLoadingState extends TrainingState {}

final class SubscriptionsLoadedState extends TrainingState {}

final class SubscriptionsErrorState extends TrainingState {}

///   Measurements States

final class MeasurementsLoadingState extends TrainingState {}

final class MeasurementsLoadedState extends TrainingState {}

final class MeasurementsErrorState extends TrainingState {}
