part of 'sets_edit_bloc.dart';

sealed class SetsEditEvent extends Equatable {
  const SetsEditEvent({required this.itemId});
  final int itemId;
  @override
  List<Object> get props => [];
}

class GetSetsforRoutineEvent extends SetsEditEvent {
  const GetSetsforRoutineEvent({required super.itemId});
}

class AddSetEvent extends SetsEditEvent {
  final RoutineSet set;

  const AddSetEvent({required super.itemId, required this.set});
}

class UpdateSetEvent extends SetsEditEvent {
  final RoutineSet set;

  const UpdateSetEvent({required super.itemId, required this.set});
}

class ReorderSetsEvent extends SetsEditEvent {
  final List<RoutineSet> sets;

  const ReorderSetsEvent({required super.itemId, required this.sets});
}

class RemoveSetEvent extends SetsEditEvent {
  final RoutineSet set;

  const RemoveSetEvent({required super.itemId, required this.set});
}

class SaveSetsEvent extends SetsEditEvent {
  final List<RoutineSet> sets;

  const SaveSetsEvent({required super.itemId, required this.sets});
}
