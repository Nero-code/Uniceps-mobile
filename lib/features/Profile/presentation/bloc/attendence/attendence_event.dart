part of 'attendence_bloc.dart';

sealed class AttendenceEvent extends Equatable {
  const AttendenceEvent();

  @override
  List<Object> get props => [];
}

final class GetAttendenceEvent extends AttendenceEvent {
  final String gymId, pid;
  const GetAttendenceEvent(this.gymId, this.pid);
}
