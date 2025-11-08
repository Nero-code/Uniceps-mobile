part of 'measurment_bloc.dart';

sealed class MeasurementState extends Equatable {
  const MeasurementState();

  @override
  List<Object> get props => [];
}

final class MeasurementInitial extends MeasurementState {}

final class MeasurementLoadingState extends MeasurementState {}

final class MeasurementLoadedState extends MeasurementState {
  final List<Measurement> list;
  const MeasurementLoadedState({required this.list});
}

final class MeasurementErrorState extends MeasurementState {
  final Failure f;
  const MeasurementErrorState({required this.f});
}
