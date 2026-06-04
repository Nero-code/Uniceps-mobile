import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_day.dart';
import 'package:uniceps/app/domain/commands/diet/diet_commands.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'diet_day_bloc.freezed.dart';
part 'diet_day_event.dart';
part 'diet_day_state.dart';

class DietDayBloc extends Bloc<DietDayEvent, DietDayState> {
  final DietCommands _commands;

  DietDayBloc(this._commands) : super(const DietDayState.initial()) {
    on<_GetDays>((event, emit) async {
      emit(const DietDayState.loading());
      final res = await _commands.getDietDays(event.planId);
      res.fold((l) => emit(DietDayState.error(l)), (days) => emit(DietDayState.loaded(days)));
    });

    on<_AddDay>((event, emit) async {
      final res = await _commands.addDietDay(event.planId, event.day);
      res.fold((l) => emit(DietDayState.error(l)), (_) => add(DietDayEvent.getDays(event.planId)));
    });

    on<_UpdateDay>((event, emit) async {
      final res = await _commands.updateDietDay(event.day);
      res.fold((l) => emit(DietDayState.error(l)), (_) => add(DietDayEvent.getDays(event.planId)));
    });

    on<_DeleteDay>((event, emit) async {
      final res = await _commands.deleteDietDay(event.id);
      res.fold((l) => emit(DietDayState.error(l)), (_) => add(DietDayEvent.getDays(event.planId)));
    });

    on<_ReorderDays>((event, emit) async {
      final res = await _commands.reorderDietDays(event.planId, event.days);
      res.fold((l) => emit(DietDayState.error(l)), (_) => add(DietDayEvent.getDays(event.planId)));
    });
  }
}
