part of 'player_gym_bloc.dart';

sealed class PlayerGymEvent extends Equatable {
  const PlayerGymEvent();

  @override
  List<Object> get props => [];
}

final class GetPlayerInGymEvent extends PlayerGymEvent {
  final String gymId, pid;
  const GetPlayerInGymEvent({required this.gymId, required this.pid});
}
