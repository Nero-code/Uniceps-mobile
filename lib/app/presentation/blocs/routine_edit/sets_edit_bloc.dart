import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_edit.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'sets_edit_event.dart';
part 'sets_edit_state.dart';

class SetsEditBloc extends Bloc<SetsEditEvent, SetsEditState> {
  // final RoutineEditUsecases _editUsecases;
  SetsEditBloc()
      :
        //  _editUsecases = editUsecases,
        super(SetsEditInitial()) {
    on<AddSetsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
