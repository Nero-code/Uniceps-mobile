import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_days_commands.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'days_edit_event.dart';
part 'days_edit_state.dart';

class DaysEditBloc extends Bloc<DaysEditEvent, DaysEditState> {
  final RoutineDaysCommands _commands;

  DaysEditBloc({required RoutineDaysCommands commands})
      : _commands = commands,
        super(DaysEditInitial()) {
    on<GetDaysEvent>((event, emit) async {
      emit(DaysEditLoadingState());

      final either = await _commands.getDaysUnderRoutine(event.routineId);
      either.fold(
        (l) => emit(DaysEditErrorState(failure: l)),
        (r) => emit(DaysEditLoadedState(days: r)),
      );
    });
    on<AddDayEvent>((event, emit) async {
      emit(DaysEditLoadingState());

      final either = await _commands.addDay(event.day);
      either.fold(
        (l) => emit(DaysEditErrorState(failure: l)),
        (r) => emit(DaysEditLoadedState(days: r)),
      );
    });
    on<RemoveDayEvent>((event, emit) async {
      emit(DaysEditLoadingState());

      final either = await _commands.removeDay(event.dayToRemove);
      either.fold(
        (l) => emit(DaysEditErrorState(failure: l)),
        (r) => emit(DaysEditLoadedState(days: r)),
      );
    });
    on<RenameDayEvent>((event, emit) async {
      emit(DaysEditLoadingState());

      final either = await _commands.renameDay(event.day);
      either.fold(
        (l) => emit(DaysEditErrorState(failure: l)),
        (r) => emit(DaysEditLoadedState(days: r)),
      );
    });
    on<ReorderDaysEvent>((event, emit) async {
      emit(DaysEditLoadingState());

      final either = await _commands.reorderDays(event.newOrder);
      either.fold(
        (l) => emit(DaysEditErrorState(failure: l)),
        (r) => emit(DaysEditLoadedState(days: List.from(r), version: event.version)),
      );
    });
  }
}
