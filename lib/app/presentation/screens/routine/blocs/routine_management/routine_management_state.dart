part of 'routine_management_bloc.dart';

sealed class RoutineManagementState extends Equatable {
  const RoutineManagementState();

  @override
  List<Object> get props => [];
}

final class RoutineManagementInitial extends RoutineManagementState {}

final class RoutineManagementLoadingState extends RoutineManagementState {}

final class RoutineManagementLoadedState extends RoutineManagementState {
  final int version;
  final List<Routine> routines;
  const RoutineManagementLoadedState(
      {required this.routines, this.version = 0});

  @override
  List<Object> get props => [routines.length, version];
}

final class RoutineManagementErrorState extends RoutineManagementState {
  final Failure failure;
  const RoutineManagementErrorState({required this.failure});
}
