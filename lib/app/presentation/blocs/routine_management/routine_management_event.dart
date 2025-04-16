part of 'routine_management_bloc.dart';

sealed class RoutineManagementEvent extends Equatable {
  const RoutineManagementEvent();

  @override
  List<Object> get props => [];
}

//
//  Routine Events
//
class GetRoutinesEvent extends RoutineManagementEvent {}

class CreateRoutineEvent extends RoutineManagementEvent {
  final String name;
  const CreateRoutineEvent({required this.name});
}

class UpdateRoutineEvent extends RoutineManagementEvent {
  final Routine routineToUpdate;
  const UpdateRoutineEvent({required this.routineToUpdate});
}

class DeleteRoutineEvent extends RoutineManagementEvent {
  final Routine routineToDelete;
  const DeleteRoutineEvent({required this.routineToDelete});
}

class ShareRoutineEvent extends RoutineManagementEvent {
  final Routine routineToShare;
  const ShareRoutineEvent({required this.routineToShare});
}
