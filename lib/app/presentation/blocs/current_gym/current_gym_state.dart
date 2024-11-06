part of 'current_gym_bloc.dart';

sealed class CurrentGymState extends Equatable {
  const CurrentGymState();

  @override
  List<Object> get props => [];
}

final class CurrentGymInitial extends CurrentGymState {}

final class CurrentGymLoadingState extends CurrentGymState {}

final class CurrentGymLoadedState extends CurrentGymState {
  final List<Gym> myGyms;
  final Gym current;
  const CurrentGymLoadedState(this.myGyms, this.current);
}

final class CurrentGymErrorState extends CurrentGymState {
  final Failure f;
  const CurrentGymErrorState(this.f);
}

final class CurrentGymUpdatedState extends CurrentGymState {}
