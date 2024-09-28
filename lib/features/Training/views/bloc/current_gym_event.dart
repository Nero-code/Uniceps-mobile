part of 'current_gym_bloc.dart';

sealed class CurrentGymEvent extends Equatable {
  const CurrentGymEvent();

  @override
  List<Object> get props => [];
}

final class SetSelectedGymEvent extends CurrentGymEvent {
  final String gymId;
  const SetSelectedGymEvent({required this.gymId});
}

final class GetSubscribedToGymEvent extends CurrentGymEvent {
  const GetSubscribedToGymEvent();
}
