part of 'subs_bloc.dart';

sealed class SubsState extends Equatable {
  const SubsState();

  @override
  List<Object> get props => [];
}

final class SubsInitial extends SubsState {}

final class SubsLoadingState extends SubsState {}

final class SubsLoadedState extends SubsState {
  final List<Subscription> list;
  const SubsLoadedState({required this.list});
}

final class SubsErrorState extends SubsState {
  final Failure f;
  const SubsErrorState({required this.f});
}
