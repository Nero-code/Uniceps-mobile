part of 'handshake_bloc.dart';

sealed class HandshakeEvent extends Equatable {
  const HandshakeEvent();

  @override
  List<Object> get props => [];
}

final class GetAllHandShakeEvent extends HandshakeEvent {}

final class GetAllAttendanceEvent extends HandshakeEvent {
  final String gymId;
  const GetAllAttendanceEvent(this.gymId);
}
