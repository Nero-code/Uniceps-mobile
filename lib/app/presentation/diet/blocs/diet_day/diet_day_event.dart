part of 'diet_day_bloc.dart';

@freezed
abstract class DietDayEvent with _$DietDayEvent {
  const factory DietDayEvent.getDays(int planId) = _GetDays;
  const factory DietDayEvent.addDay(int planId, DietDay day) = _AddDay;
  const factory DietDayEvent.updateDay(int planId, DietDay day) = _UpdateDay;
  const factory DietDayEvent.deleteDay(int planId, int id) = _DeleteDay;
  const factory DietDayEvent.reorderDays(int planId, List<DietDay> days) = _ReorderDays;
}
