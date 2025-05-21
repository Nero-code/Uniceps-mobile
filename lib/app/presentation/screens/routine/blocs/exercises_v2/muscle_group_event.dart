part of 'muscle_group_bloc.dart';

sealed class MuscleGroupEvent extends Equatable {
  const MuscleGroupEvent();

  @override
  List<Object> get props => [];
}

class GetMuscleGroupsEvent extends MuscleGroupEvent {}
