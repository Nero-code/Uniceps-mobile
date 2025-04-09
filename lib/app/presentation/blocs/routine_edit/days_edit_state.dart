part of 'days_edit_bloc.dart';

sealed class DaysEditState extends Equatable {
  const DaysEditState();

  @override
  List<Object> get props => [];
}

final class DaysEditInitial extends DaysEditState {}

final class DaysEditLoadingState extends DaysEditState {}

final class DaysEditLoadedState extends DaysEditState {
  final List<RoutineDay> days;
  const DaysEditLoadedState({required this.days});
  @override
  List<Object> get props => [days.length];
}

final class DaysEditErrorState extends DaysEditState {
  final Failure failure;
  const DaysEditErrorState({required this.failure});
}
