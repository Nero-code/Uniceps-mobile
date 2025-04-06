part of 'items_edit_bloc.dart';

sealed class ItemsEditEvent extends Equatable {
  const ItemsEditEvent();

  @override
  List<Object> get props => [];
}

class AddRoutineItemsEvent extends ItemsEditEvent {
  final List<RoutineItem> exercises;
  const AddRoutineItemsEvent({required this.exercises});
}

class RemoveRoutineItemEvent extends ItemsEditEvent {
  final RoutineItem exercise;
  const RemoveRoutineItemEvent({required this.exercise});
}

class ReorderRoutineItemsEvent extends ItemsEditEvent {
  final List<RoutineItem> newOrder;
  const ReorderRoutineItemsEvent({required this.newOrder});
}
