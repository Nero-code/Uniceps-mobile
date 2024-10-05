part of 'training_bloc.dart';

sealed class TrainingEvent extends Equatable {
  const TrainingEvent();

  @override
  List<Object> get props => [];
}

final class GetProgramEvent extends TrainingEvent {
  final int filter;
  final String gymId = '';
  const GetProgramEvent({this.filter = 1});
}

final class UpdateLastWeightExerciseEvent extends TrainingEvent {
  final double newVal;
  final String eId;
  const UpdateLastWeightExerciseEvent({
    required this.eId,
    required this.newVal,
  });
}

// final class GetExercisesEvent extends TrainingEvent {
//   const GetExercisesEvent();
// }

// final class ChangeFilterEvent extends TrainingEvent {
//   final int filter;
//   const ChangeFilterEvent({required this.filter});
// }
