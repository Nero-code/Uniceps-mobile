part of 'routine_management_bloc.dart';

sealed class RoutineManagementState extends Equatable {
  const RoutineManagementState();

  @override
  List<Object> get props => [];
}

final class RoutineManagementInitial extends RoutineManagementState {}

final class RoutineManagementLoadingState extends RoutineManagementState {}

final class RoutineManagementLoadedState extends RoutineManagementState {
  final List<Routine> routines;
  const RoutineManagementLoadedState({required this.routines});
}

final class RoutineManagementErrorState extends RoutineManagementState {
  final Failure failure;
  const RoutineManagementErrorState({required this.failure});
}
