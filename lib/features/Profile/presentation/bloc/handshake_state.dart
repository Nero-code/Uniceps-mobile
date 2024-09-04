part of 'handshake_bloc.dart';

sealed class HandshakeState extends Equatable {
  const HandshakeState();

  @override
  List<Object> get props => [];
}

final class HandshakeInitial extends HandshakeState {}

final class HandshakeLoadingState extends HandshakeState {}

final class HandshakeLoadedState extends HandshakeState {
  final List<HandShake> handshakes;
  const HandshakeLoadedState({required this.handshakes});
}

final class HandshakeErrorState extends HandshakeState {
  final Failure f;
  const HandshakeErrorState({required this.f});
}

final class AttLoadingState extends HandshakeState {}

final class AttDoneState extends HandshakeState {
  final List<Attendence> list;
  const AttDoneState({required this.list});
}

final class AttErrorState extends HandshakeState {
  final Failure f;
  const AttErrorState({required this.f});
}
