part of 'sets_edit_bloc.dart';

sealed class SetsEditEvent extends Equatable {
  const SetsEditEvent();

  @override
  List<Object> get props => [];
}

class AddSetEvent extends SetsEditEvent {
  final RoutineSet set;
  const AddSetEvent({required this.set});
}
