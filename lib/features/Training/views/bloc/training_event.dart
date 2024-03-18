part of 'training_bloc.dart';

sealed class TrainingEvent extends Equatable {
  const TrainingEvent();

  @override
  List<Object> get props => [];
}

final class ProgramLoadingEvent extends TrainingEvent {}

final class GetProgramEvent extends TrainingEvent {}

final class ExercisesLoadingEvent extends TrainingEvent {}

final class GetExercisesEvent extends TrainingEvent {}

final class MeasurementsLoadingEvent extends TrainingEvent {}

final class GetMeasurementsEvent extends TrainingEvent {}

final class SubscriptionsLoadingEvent extends TrainingEvent {}

final class GetSubscriptionsEvent extends TrainingEvent {}
