part of 'sets_edit_bloc.dart';

sealed class SetsEditState extends Equatable {
  const SetsEditState();

  @override
  List<Object> get props => [];
}

final class SetsEditInitial extends SetsEditState {}

final class SetsEditLoadingState extends SetsEditState {}

final class SetsEditLoadedState extends SetsEditState {
  final List<RoutineSet> sets;
  const SetsEditLoadedState({
    required this.sets,
  });
  @override
  List<Object> get props => sets;
}

final class SetsEditErrorState extends SetsEditState {
  final Failure failure;
  const SetsEditErrorState({required this.failure});
}
