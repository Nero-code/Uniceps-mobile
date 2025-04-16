import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_edit.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'sets_edit_event.dart';
part 'sets_edit_state.dart';

class SetsEditBloc extends Bloc<SetsEditEvent, SetsEditState> {
  final List<RoutineSet> sets = [];
  // final RoutineEditUsecases editUsecases;
  SetsEditBloc() : super(SetsEditInitial()) {
    on<AddSetEvent>((event, emit) {
      // emit(SetsEditLoadingState());
      sets.add(event.set);
      emit(SetsEditLoadedState(sets: sets));
    });
  }
}
