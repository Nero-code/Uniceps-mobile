part of 'player_gym_bloc.dart';

sealed class PlayerGymState extends Equatable {
  const PlayerGymState();

  @override
  List<Object> get props => [];
}

final class PlayerGymInitial extends PlayerGymState {}

final class PlayerInGymLoadingState extends PlayerGymState {}

final class PlayerInGymLoadedState extends PlayerGymState {
  final PlayerInGym data;
  const PlayerInGymLoadedState({required this.data});
}

final class PlayerInGymErrorState extends PlayerGymState {
  final Failure f;
  const PlayerInGymErrorState(this.f);
}
