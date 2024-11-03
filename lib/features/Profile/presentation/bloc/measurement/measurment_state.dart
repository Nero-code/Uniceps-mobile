part of 'measurment_bloc.dart';

sealed class MeasurmentState extends Equatable {
  const MeasurmentState();

  @override
  List<Object> get props => [];
}

final class MeasurmentInitial extends MeasurmentState {}

final class MeasurementLoadingState extends MeasurmentState {}

final class MeasurementLoadedState extends MeasurmentState {
  final List<Measurement> list;
  const MeasurementLoadedState({required this.list});
}

final class MeasurementErrorState extends MeasurmentState {
  final Failure f;
  const MeasurementErrorState({required this.f});
}
