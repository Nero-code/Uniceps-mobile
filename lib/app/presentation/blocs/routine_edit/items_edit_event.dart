part of 'items_edit_bloc.dart';

sealed class ItemsEditEvent extends Equatable {
  const ItemsEditEvent({required this.dayId});
  final int dayId;
  @override
  List<Object> get props => [];
}

class GetRoutineDayItemsEvent extends ItemsEditEvent {
  const GetRoutineDayItemsEvent({required super.dayId});
}

class AddRoutineItemsEvent extends ItemsEditEvent {
  final List<RoutineItem> items;

  const AddRoutineItemsEvent({required super.dayId, required this.items});
}

class RemoveRoutineItemEvent extends ItemsEditEvent {
  final RoutineItem exercise;

  const RemoveRoutineItemEvent({required super.dayId, required this.exercise});
}

class ReorderRoutineItemsEvent extends ItemsEditEvent {
  final List<RoutineItem> newOrder;

  const ReorderRoutineItemsEvent(
      {required super.dayId, required this.newOrder});
}
