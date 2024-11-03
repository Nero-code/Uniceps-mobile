part of 'subs_bloc.dart';

sealed class SubsEvent extends Equatable {
  const SubsEvent();

  @override
  List<Object> get props => [];
}

final class GetSubsEvent extends SubsEvent {
  final String gymId, pid;
  const GetSubsEvent({required this.gymId, required this.pid});

  @override
  List<Object> get props => [gymId];
}
