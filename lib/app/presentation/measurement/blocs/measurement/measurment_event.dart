part of 'measurment_bloc.dart';

@freezed
class MeasurementEvent with _$MeasurementEvent {
  const factory MeasurementEvent.getMeasurements() = _GetMeasurements;
  const factory MeasurementEvent.createMeasurement(Measurement m) = _CreateMeasurement;
  const factory MeasurementEvent.updateMeasurement(Measurement m) = _UpdateMeasurement;
  const factory MeasurementEvent.deleteMeasurement(Measurement m) = _DeleteMeasurement;
}
