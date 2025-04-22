import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'items_edit_event.dart';
part 'items_edit_state.dart';

class ItemsEditBloc extends Bloc<ItemsEditEvent, ItemsEditState> {
  List<RoutineItem> allItems = [];
  // final RoutineEditUsecases _editUsecases;
  ItemsEditBloc()
      :
        // _editUsecases = editUsecases,
        super(ItemsEditInitial()) {
    on<GetRoutineDayItemsEvent>(
      (event, emit) {
        final sublist =
            allItems.where((item) => item.dayId == event.dayId).toList();
        emit(ItemsEditLoadedState(dayId: event.dayId, items: sublist));
      },
    );
    on<AddRoutineItemsEvent>(
      (event, emit) {
        emit(ItemsEditLoadingState());
        print("items l:      ${allItems.length}");
        print("eventitems l: ${event.items.length}");
        allItems.addAll(event.items);
        print("items l:      ${allItems.length}");
        print("eventitems l: ${event.items.length}");
        emit(ItemsEditLoadedState(dayId: event.dayId, items: allItems));
      },
    );
    on<RemoveRoutineItemEvent>(
      (event, emit) {
        emit(ItemsEditLoadingState());
      },
    );
    on<ReorderRoutineItemsEvent>(
      (event, emit) {
        emit(ItemsEditLoadingState());
      },
    );
  }
}
