part of 'sets_edit_bloc.dart';

sealed class SetsEditEvent extends Equatable {
  const SetsEditEvent();

  @override
  List<Object> get props => [];
}

class GetSetsforRoutineItemEvent extends SetsEditEvent {
  final int itemId;
  const GetSetsforRoutineItemEvent({required this.itemId});
}

// class AddSetEvent extends SetsEditEvent {
//   final List<RoutineSet> oldSets;

//   const AddSetEvent({required super.itemId, required this.oldSets});
// }

class AddSetEvent extends SetsEditEvent {
  final int itemId;
  const AddSetEvent({required this.itemId});
}

class UpdateSetEvent extends SetsEditEvent {
  final RoutineSet set;
  const UpdateSetEvent({required this.set});
}

class ReorderSetsEvent extends SetsEditEvent {
  final List<RoutineSet> sets;
  const ReorderSetsEvent({required this.sets});
}

class RemoveSetEvent extends SetsEditEvent {
  final RoutineSet set;
  const RemoveSetEvent({required this.set});
}

// class SaveSetsEvent extends SetsEditEvent {
//   final List<RoutineSet> sets;
//   const SaveSetsEvent({required super.itemId, required this.sets});
// }
