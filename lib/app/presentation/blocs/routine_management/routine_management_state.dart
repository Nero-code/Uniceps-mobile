part of 'routine_management_bloc.dart';

sealed class RoutineManagementState extends Equatable {
  const RoutineManagementState();
  
  @override
  List<Object> get props => [];
}

final class RoutineManagementInitial extends RoutineManagementState {}
