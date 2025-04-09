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
  // final RoutineDay day;
  // const AddDayEvent({required this.day});
}

class RemoveDayEvent extends DaysEditEvent {
  final RoutineDay day;
  const RemoveDayEvent({required this.day});
}

class RenameDayEvent extends DaysEditEvent {
  final RoutineDay day;
  const RenameDayEvent({required this.day});
}

class ReorderDaysEvent extends DaysEditEvent {
  final List<RoutineDay> newOrder;
  const ReorderDaysEvent({required this.newOrder});
}
