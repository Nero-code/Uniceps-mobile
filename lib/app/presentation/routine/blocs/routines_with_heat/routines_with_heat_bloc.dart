import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_heat.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_with_heat_commands.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'routines_with_heat_event.dart';
part 'routines_with_heat_state.dart';
part 'routines_with_heat_bloc.freezed.dart';

class RoutinesWithHeatBloc extends Bloc<RoutinesWithHeatEvent, RoutinesWithHeatState> {
  final RoutineWithHeatCommands _usecases;
  RoutinesWithHeatBloc(this._usecases) : super(const _Initial()) {
    on<_GetRoutines>((event, emit) async {
      final either = await _usecases.getAllRoutinesWithHeat();
      either.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
    on<_Create>((event, emit) async {
      // TODO: implement event handler
    });
    on<_Update>((event, emit) async {
      // TODO: implement event handler
    });
    on<_Delete>((event, emit) async {
      // TODO: implement event handler
    });
    on<_SetCurrent>((event, emit) async {
      // TODO: implement event handler
    });
  }
}
