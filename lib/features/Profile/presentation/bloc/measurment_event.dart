part of 'measurment_bloc.dart';

sealed class MeasurmentEvent extends Equatable {
  const MeasurmentEvent();

  @override
  List<Object> get props => [];
}

final class GetMeasurementsEvent extends MeasurmentEvent {
  final String gymId;
  const GetMeasurementsEvent({required this.gymId});
}
