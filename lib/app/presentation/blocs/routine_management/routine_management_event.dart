part of 'routine_management_bloc.dart';

sealed class RoutineManagementEvent extends Equatable {
  const RoutineManagementEvent();

  @override
  List<Object> get props => [];
}

class AddDayEvent extends RoutineManagementEvent {
  final String initialDayName;
  const AddDayEvent({required this.initialDayName});
}

class RemoveDayEvent extends RoutineManagementEvent {
  final RoutineDay day;
  const RemoveDayEvent({required this.day});
}

class RenameDayEvent extends RoutineManagementEvent {
  final RoutineDay day;
  const RenameDayEvent({required this.day});
}

class AddExerciseEvent extends RoutineManagementEvent {}

class RemoveExerciseEvent extends RoutineManagementEvent {}

class ReorderExerciseEvent extends RoutineManagementEvent {}

class AddSetsEvent extends RoutineManagementEvent {}

class RemoveSetEvent extends RoutineManagementEvent {}

class ReorderSetsEvent extends RoutineManagementEvent {}
