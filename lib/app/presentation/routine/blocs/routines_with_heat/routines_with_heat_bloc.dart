import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/data/models/routine_result.dart';
import 'package:uniceps/app/data/services/unifile/unifile.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_heat.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_with_heat_commands.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'routines_with_heat_bloc.freezed.dart';
part 'routines_with_heat_event.dart';
part 'routines_with_heat_state.dart';

class RoutinesWithHeatBloc extends Bloc<RoutinesWithHeatEvent, RoutinesWithHeatState> {
  final RoutineWithHeatCommands _usecases;
  RoutinesWithHeatBloc(this._usecases) : super(const _Initial()) {
    on<_GetRoutines>((event, emit) async {
      final either = await _usecases.getAllRoutinesWithHeat();
      either.fold((l) => emit(.error(l)), (r) => emit(.loaded(r)));
    });
    on<_Import>((event, emit) async {
      var importRoutine = _usecases.importRoutine();
      await for (final res in importRoutine) {
        emit(_Importing(result: res));
      }
    });
    on<_ImportUniFile>((event, emit) async {
      var importRoutine = _usecases.importUniFile(event.file);
      await for (final res in importRoutine) {
        emit(_Importing(result: res));
      }
    });
    on<_Create>((event, emit) async {
      emit(const _Loading());

      final either = await _usecases.createRoutine(event.name, event.description);
      either.fold((l) => emit(.error(l)), (r) => emit(.loaded(r)));
    });
    on<_Update>((event, emit) async {
      emit(const .loading());

      final either = await _usecases.updateRoutine(event.update);
      either.fold((l) => emit(.error(l)), (r) => emit(.loaded(r)));
    });
    on<_Delete>((event, emit) async {
      emit(const .loading());

      final either = await _usecases.deleteRoutine(event.delete);
      either.fold((l) => emit(.error(l)), (r) => emit(.loaded(r)));
    });
    on<_SetCurrent>((event, emit) async {
      emit(const .loading());

      final either = await _usecases.setCurrentRoutine(event.update);
      either.fold((l) => emit(.error(l)), (r) => emit(.loaded(r)));
    });
    on<_Export>((event, emit) async {
      await _usecases.shareRoutine(event.routineId);
    });
    on<_Duplicate>((event, emit) async {
      emit(const .loading());

      final either = await _usecases.duplicateRoutine(event.source, event.heat);
      // either.fold((l) => .error(l), (r) => add(const .getRoutines()));
      either.fold((l) => emit(.error(l)), (r) => emit(.loaded(r)));
    });
  }
}
