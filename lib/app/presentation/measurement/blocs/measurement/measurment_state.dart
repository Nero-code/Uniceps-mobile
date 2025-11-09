part of 'measurment_bloc.dart';

@freezed
class MeasurementState with _$MeasurementState {
  const factory MeasurementState.initial() = _Initial;
  const factory MeasurementState.loading() = _Loading;
  const factory MeasurementState.dirty() = _Dirty;
  const factory MeasurementState.loaded(List<Measurement> list) = _Loaded;
  const factory MeasurementState.error(MeasurementFailure f) = _Error;
}
