import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_edit.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'items_edit_event.dart';
part 'items_edit_state.dart';

class ItemsEditBloc extends Bloc<ItemsEditEvent, ItemsEditState> {
  final RoutineEditUsecases _editUsecases;
  ItemsEditBloc({required RoutineEditUsecases editUsecases})
      : _editUsecases = editUsecases,
        super(ItemsEditInitial()) {
    on<ItemsEditEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
