part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoadingState extends ProfileState {}

final class ProfileLoadedState extends ProfileState {
  final Player player;
  const ProfileLoadedState({required this.player});
}

final class ProfileSubmittedState extends ProfileState {
  final Player player;
  const ProfileSubmittedState({required this.player});
}

final class ProfileErrorState extends ProfileState {
  final Failure failure;
  const ProfileErrorState({required this.failure});
}
