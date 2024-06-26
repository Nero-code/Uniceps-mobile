part of 'subs_bloc.dart';

sealed class SubsEvent extends Equatable {
  const SubsEvent();

  @override
  List<Object> get props => [];
}

final class GetSubsEvent extends SubsEvent {
  final String gymId;
  const GetSubsEvent({required this.gymId});
}
