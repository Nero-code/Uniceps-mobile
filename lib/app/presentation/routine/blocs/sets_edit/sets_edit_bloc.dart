import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_sets_commands.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'sets_edit_event.dart';
part 'sets_edit_state.dart';

class SetsEditBloc extends Bloc<SetsEditEvent, SetsEditState> {
  // List<RoutineSet> sets = [];
  final RoutineSetsCommands _commands;
  SetsEditBloc({required RoutineSetsCommands commands})
      : _commands = commands,
        super(SetsEditInitial()) {
    on<GetSetsforRoutineItemEvent>((event, emit) async {
      emit(SetsEditLoadingState());

      final either = await _commands.getItemSets(event.itemId);
      either.fold(
        (l) => emit(SetsEditErrorState(failure: l)),
        (r) {
          // sets = r;
          emit(SetsEditLoadedState(sets: r));
        },
      );
    });

    on<AddSetEvent>((event, emit) async {
      emit(SetsEditLoadingState());

      // sets.add(event.rSet);

      final either = await _commands.addItemSets(event.itemId);
      either.fold(
        (l) => emit(SetsEditErrorState(failure: l)),
        (r) => emit(SetsEditLoadedState(sets: r)),
      );

      // emit(SetsEditLoadedState(itemId: event.itemId, sets: sets));
    });

    // on<SaveSetsEvent>((event, emit) async {
    //   emit(SetsEditLoadingState());

    //   final either = await _commands.saveAllSets(event.sets);
    //   either.fold(
    //     (l) => emit(SetsEditErrorState(failure: l)),
    //     (r) => emit(SetsEditLoadedState(sets: r, itemId: event.itemId)),
    //   );
    // });

    on<UpdateSetEvent>((event, emit) async {
      final either = await _commands.updateSet(event.set);
      either.fold(
        (l) => emit(SetsEditErrorState(failure: l)),
        (r) => emit(SetsEditLoadedState(sets: r)),
      );
    });

    on<RemoveSetEvent>((event, emit) async {
      emit(SetsEditLoadingState());

      final either = await _commands.removeItemSet(event.set);
      either.fold(
        (l) => emit(SetsEditErrorState(failure: l)),
        (r) => emit(SetsEditLoadedState(sets: List.from([...r]))),
      );
    });
  }
}
