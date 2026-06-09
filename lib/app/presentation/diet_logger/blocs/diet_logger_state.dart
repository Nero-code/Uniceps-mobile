part of 'diet_logger_bloc.dart';

@freezed
class DietLoggerState with _$DietLoggerState {
  const factory DietLoggerState.initial() = _Initial;
  const factory DietLoggerState.loading() = _Loading;
  const factory DietLoggerState.success({required List<DietLog> logs}) = _Success;
  const factory DietLoggerState.failure({required Failure failure}) = _Failure;
}
