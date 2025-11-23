import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uniceps/app/data/sources/services/media_helper.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_items_commands.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'items_edit_event.dart';
part 'items_edit_state.dart';

class ItemsEditBloc extends Bloc<ItemsEditEvent, ItemsEditState> {
  // List<RoutineItem> allItems = [];
  final MediaHelper _mediaHelper;
  final RoutineItemsCommands _commands;
  ItemsEditBloc({required RoutineItemsCommands commands, required MediaHelper mediaHelper})
      : _commands = commands,
        _mediaHelper = mediaHelper,
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
      final imgStream = _mediaHelper.saveImages(event.items.map((i) => i.imageUrl).toList());
      double sum = 0.0;
      await for (var i in imgStream) {
        sum += i;
        emit(ItemsDownloadingState(progress: sum));
      }

      print("eventitems l: ${event.items.length}");
      final either = await _commands.addItems(event.dayId, event.items);
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

    on<CopySetsToAll>((event, emit) async {
      final items = (state as ItemsEditLoadedState).items;
      emit(ItemsEditLoadingState());

      final either = await _commands.copySetsToAll(event.dayId, event.itemId);
      either.fold(
        (l) => emit(ItemsEditErrorState(failure: l)),
        (r) => emit(ItemsEditLoadedState(items: items)),
      );
    });
  }
}
