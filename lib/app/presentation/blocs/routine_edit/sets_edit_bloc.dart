import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'sets_edit_event.dart';
part 'sets_edit_state.dart';

class SetsEditBloc extends Bloc<SetsEditEvent, SetsEditState> {
  List<RoutineSet> sets = [];
  // final RoutineEditUsecases editUsecases;
  SetsEditBloc() : super(SetsEditInitial()) {
    on<GetSetsforRoutineEvent>((event, emit) {
      emit(SetsEditLoadingState());
      sets.clear();
    });
    on<AddSetEvent>((event, emit) {
      // emit(SetsEditLoadingState());
      sets.add(event.set);
      emit(SetsEditLoadedState(itemId: event.itemId, sets: sets));
    });

    on<UpdateSetEvent>((event, emit) {});

    on<RemoveSetEvent>((event, emit) {});

    on<SaveSetsEvent>((event, emit) {});
  }
}
