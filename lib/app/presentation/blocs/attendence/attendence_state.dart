part of 'attendence_bloc.dart';

sealed class AttendenceState extends Equatable {
  const AttendenceState();

  @override
  List<Object> get props => [];
}

final class AttendenceInitial extends AttendenceState {}

final class AttenedenceLoadingState extends AttendenceState {}

final class AttenedenceLoadedState extends AttendenceState {
  final List<Attendence> list;
  const AttenedenceLoadedState(this.list);
}

final class AttenedenceErrorState extends AttendenceState {
  final Failure f;
  const AttenedenceErrorState(this.f);
}
