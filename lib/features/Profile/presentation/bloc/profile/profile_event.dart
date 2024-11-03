part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class GetProfileDataEvent extends ProfileEvent {
  const GetProfileDataEvent();
}

final class ProfileSubmitEvent extends ProfileEvent {
  final PlayerModel player;
  final bool isCreate;
  const ProfileSubmitEvent({required this.player, required this.isCreate});
}
