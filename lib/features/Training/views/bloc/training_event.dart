part of 'training_bloc.dart';

sealed class TrainingEvent extends Equatable {
  const TrainingEvent();

  @override
  List<Object> get props => [];
}

final class GetProgramEvent extends TrainingEvent {
  const GetProgramEvent();
}

final class GetExercisesEvent extends TrainingEvent {
  const GetExercisesEvent();
}

final class ChangeFilterEvent extends TrainingEvent {
  final String filter;
  const ChangeFilterEvent({required this.filter});
}
