import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_items_commands.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'items_edit_event.dart';
part 'items_edit_state.dart';

class ItemsEditBloc extends Bloc<ItemsEditEvent, ItemsEditState> {
  // List<RoutineItem> allItems = [];
  final RoutineItemsCommands _commands;
  ItemsEditBloc({required RoutineItemsCommands commands})
      : _commands = commands,
        super(ItemsEditInitial()) {
    on<GetRoutineDayItemsEvent>(
      (event, emit) async {
        // if(state is ItemsEditLoadedState){
        //   if(state.)
        // }
        emit(ItemsEditLoadingState());

        final either = await _commands.getItemsUnderDay(event.dayId);
        either.fold(
          (l) => emit(ItemsEditErrorState(failure: l)),
          (r) => emit(ItemsEditLoadedState(items: r)),
        );
      },
      transformer: (events, mapper) => events.asyncExpand(mapper),
    );

    on<AddRoutineItemsEvent>((event, emit) async {
      emit(ItemsEditLoadingState());

      print("eventitems l: ${event.items.length}");
      final either = await _commands.addItems(event.items);
      either.fold(
        (l) => emit(ItemsEditErrorState(failure: l)),
        (r) => emit(ItemsEditLoadedState(items: r)),
      );
    });

    on<RemoveRoutineItemEvent>((event, emit) async {
      emit(ItemsEditLoadingState());

      final either = await _commands.removeItem(event.exercise);
      either.fold(
        (l) => emit(ItemsEditErrorState(failure: l)),
        (r) => emit(ItemsEditLoadedState(items: r)),
      );
    });

    on<ReorderRoutineItemsEvent>((event, emit) async {
      for (final i in event.newOrder) {
        print("${i.exercise.name} : ${i.id} : ${i.index}");
      }
      final list = <RoutineItem>[];
      for (int i = 0; i < event.newOrder.length; i++) {
        list.add(event.newOrder[i].copyWith(index: i));
      }
      for (final i in list) {
        print("${i.exercise.name} : ${i.id} : ${i.index}");
      }
      final either = await _commands.reorderItems(list);
      either.fold(
        (l) => emit(ItemsEditErrorState(failure: l)),
        (r) => emit(ItemsEditLoadedState(items: r, version: event.version + 1)),
      );
    });
  }
}
