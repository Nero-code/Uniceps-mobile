part of 'days_edit_bloc.dart';

sealed class DaysEditEvent extends Equatable {
  const DaysEditEvent();

  @override
  List<Object> get props => [];
}

//
//  Days Events
//
class GetDaysEvent extends DaysEditEvent {
  final int routineId;
  const GetDaysEvent({required this.routineId});
}

class AddDayEvent extends DaysEditEvent {
  final RoutineDay day;
  const AddDayEvent({required this.day});
}

class RemoveDayEvent extends DaysEditEvent {
  final RoutineDay dayToRemove;
  const RemoveDayEvent({required this.dayToRemove});
}

class RenameDayEvent extends DaysEditEvent {
  final RoutineDay day;
  const RenameDayEvent({required this.day});
}

class ReorderDaysEvent extends DaysEditEvent {
  final int version;
  final List<RoutineDay> newOrder;
  const ReorderDaysEvent({required this.newOrder, this.version = 0});

  @override
  List<Object> get props => [newOrder.length, version];
}
