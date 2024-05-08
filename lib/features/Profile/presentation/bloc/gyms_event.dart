part of 'gyms_bloc.dart';

sealed class GymsEvent extends Equatable {
  const GymsEvent();

  @override
  List<Object> get props => [];
}

final class GetAllGymsEvent extends GymsEvent {
  const GetAllGymsEvent();
}
