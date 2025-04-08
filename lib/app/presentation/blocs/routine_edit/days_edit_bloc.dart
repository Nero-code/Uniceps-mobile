import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_edit.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'days_edit_event.dart';
part 'days_edit_state.dart';

class DaysEditBloc extends Bloc<DaysEditEvent, DaysEditState> {
  final RoutineEditUsecases _usecases;
  DaysEditBloc({required RoutineEditUsecases usecases})
      : _usecases = usecases,
        super(DaysEditInitial()) {
    on<AddDayEvent>((event, emit) async {
      final either = await _usecases.addDay(event.day);
      either.fold(
        (f) => emit(DaysEditErrorState(failure: f)),
        (s) => emit(DaysEditLoadedState(days: s)),
      );
    });
    on<RemoveDayEvent>((event, emit) async {
      // TODO: implement event handler
    });
    on<RenameDayEvent>((event, emit) async {
      // TODO: implement event handler
    });
    on<ReorderDaysEvent>((event, emit) async {
      // TODO: implement event handler
    });
  }
}
