part of 'gyms_bloc.dart';

sealed class GymsState extends Equatable {
  const GymsState();

  @override
  List<Object> get props => [];
}

final class GymsInitial extends GymsState {}

final class GymsLoadingState extends GymsState {}

final class GymsLoadedState extends GymsState {
  final List<Gym> restList, myGyms;

  const GymsLoadedState({
    required this.restList,
    required this.myGyms,
  });
}

final class GymsErrorState extends GymsState {
  final Failure f;
  const GymsErrorState({required this.f});
}

final class GymSuccessfulHandshake extends GymsState {}

final class GymErrorHandshake extends GymsState {
  final Failure f;
  const GymErrorHandshake({required this.f});
}

final class GymLoadingHandshake extends GymsState {}

final class GymSuccessfulAttendance extends GymsState {}

final class GymErrorAttendance extends GymsState {
  final Failure f;
  const GymErrorAttendance({required this.f});
}

final class GymLoadingAttendance extends GymsState {}
