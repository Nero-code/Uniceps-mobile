part of 'measurment_bloc.dart';

sealed class MeasurementEvent extends Equatable {
  const MeasurementEvent();

  @override
  List<Object> get props => [];
}

final class GetMeasurementsEvent extends MeasurementEvent {
  const GetMeasurementsEvent();
}

final class AddMeasurementsEvent extends MeasurementEvent {
  final Measurement measurement;
  const AddMeasurementsEvent({required this.measurement});
}
