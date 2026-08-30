part of 'diet_logger_bloc.dart';

@freezed
class DietLoggerEvent with _$DietLoggerEvent {
  const factory DietLoggerEvent.started({DateTime? date}) = _Started;
  const factory DietLoggerEvent.logServing({required DietLog log}) = _LogServing;
  const factory DietLoggerEvent.deleteLog({required DietLog log}) = _DeleteLog;
}
