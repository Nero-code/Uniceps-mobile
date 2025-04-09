import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_edit.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'days_edit_event.dart';
part 'days_edit_state.dart';

class DaysEditBloc extends Bloc<DaysEditEvent, DaysEditState> {
  // final RoutineEditUsecases _usecases;
  final List<RoutineDay> days = List.generate(
    5,
    (index) => RoutineDay(
        id: null,
        apiId: null,
        routineId: 0,
        name: "day $index",
        index: index,
        exercises: [],
        version: 0,
        isSynced: false),
  );
  DaysEditBloc()
      :
        //  _usecases = usecases,
        super(DaysEditInitial()) {
    on<GetDaysEvent>((event, emit) async {
      emit(DaysEditLoadedState(days: days));
    });
    on<AddDayEvent>((event, emit) async {
      // final either = await _usecases.addDay(event.day);
      // either.fold(
      //   (f) => emit(DaysEditErrorState(failure: f)),
      //   (s) => emit(DaysEditLoadedState(days: s)),
      // );
      print("inside Days Bloc: ${days.length}");
      days.add(RoutineDay(
          id: null,
          apiId: null,
          routineId: 0,
          version: 0,
          name: "day ${days.length}",
          index: days.length,
          exercises: [],
          isSynced: false));

      print("inside Days Bloc: ${days.length}");
      emit(DaysEditLoadedState(days: days));
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
