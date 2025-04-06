part of 'sets_edit_bloc.dart';

sealed class SetsEditEvent extends Equatable {
  const SetsEditEvent();

  @override
  List<Object> get props => [];
}

class AddSetsEvent extends SetsEditEvent {
  final List<RoutineSet> sets;
  const AddSetsEvent({required this.sets});
}
