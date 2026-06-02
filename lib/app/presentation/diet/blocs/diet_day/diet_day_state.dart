part of 'diet_day_bloc.dart';

@freezed
class DietDayState with _$DietDayState {
  const factory DietDayState.initial() = _Initial;
  const factory DietDayState.loading() = _Loading;
  const factory DietDayState.loaded(List<DietDay> days) = _Loaded;
  const factory DietDayState.error(Failure f) = _Error;
}
