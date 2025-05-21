part of 'muscle_group_bloc.dart';

sealed class MuscleGroupState extends Equatable {
  const MuscleGroupState();

  @override
  List<Object> get props => [];
}

final class MuscleGroupInitial extends MuscleGroupState {}

class MuscleGroupLoadingState extends MuscleGroupState {}

class MuscleGroupLoadedState extends MuscleGroupState {
  final List<MuscleGroup> groups;
  const MuscleGroupLoadedState({required this.groups});
}

class MuscleGroupErrorState extends MuscleGroupState {
  final Failure failure;
  const MuscleGroupErrorState({required this.failure});
}
