part of 'diet_logger_bloc.dart';

@freezed
class DietLoggerEvent with _$DietLoggerEvent {
  const factory DietLoggerEvent.started() = _Started;
  const factory DietLoggerEvent.logServing({required DietLog log}) = _LogServing;
}
