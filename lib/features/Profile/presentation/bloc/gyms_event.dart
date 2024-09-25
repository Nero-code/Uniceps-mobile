part of 'gyms_bloc.dart';

sealed class GymsEvent extends Equatable {
  const GymsEvent();

  @override
  List<Object> get props => [];
}

final class GetAllAvailableGymsEvent extends GymsEvent {
  const GetAllAvailableGymsEvent();
}

final class GetSubscribedToGym extends GymsEvent {
  const GetSubscribedToGym();
}

final class HandShakeGym extends GymsEvent {
  final String qrCode;
  const HandShakeGym({required this.qrCode});
}

final class GymAddAttendance extends GymsEvent {
  final String data;
  const GymAddAttendance({required this.data});
}

final class GymGetAttendanceLog extends GymsEvent {
  final String gymId;
  const GymGetAttendanceLog({required this.gymId});
}
