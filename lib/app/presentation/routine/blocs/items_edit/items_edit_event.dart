part of 'items_edit_bloc.dart';

sealed class ItemsEditEvent extends Equatable {
  const ItemsEditEvent();
  // final int dayId;
  @override
  List<Object> get props => [];
}

class GetRoutineDayItemsEvent extends ItemsEditEvent {
  final int dayId;
  const GetRoutineDayItemsEvent({required this.dayId});
}

class AddRoutineItemsEvent extends ItemsEditEvent {
  final int dayId;
  final List<ExerciseV2> items;
  const AddRoutineItemsEvent({required this.dayId, required this.items});
}

class RemoveRoutineItemEvent extends ItemsEditEvent {
  final RoutineItem exercise;
  const RemoveRoutineItemEvent({required this.exercise});
}

class ReorderRoutineItemsEvent extends ItemsEditEvent {
  final int version;
  final List<RoutineItem> newOrder;
  const ReorderRoutineItemsEvent({required this.newOrder, this.version = 0});
}

class CopySetsToAll extends ItemsEditEvent {
  final int dayId, itemId;
  const CopySetsToAll({required this.dayId, required this.itemId});
}
