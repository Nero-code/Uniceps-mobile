part of 'gyms_bloc.dart';

sealed class GymsState extends Equatable {
  const GymsState();

  @override
  List<Object> get props => [];
}

final class GymsInitial extends GymsState {}

final class GymsLoadingState extends GymsState {}

final class GymsLoadedState extends GymsState {
  final List<Gym> list;
  const GymsLoadedState({required this.list});
}

final class GymsErrorState extends GymsState {
  final Failure f;
  const GymsErrorState({required this.f});
}
