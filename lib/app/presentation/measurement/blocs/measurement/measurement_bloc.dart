import "package:flutter_bloc/flutter_bloc.dart";
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/classes/profile_classes/measurement.dart';
import 'package:uniceps/app/domain/commands/measurement_usecases/measurement_commands.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'measurement_bloc.freezed.dart';
part 'measurement_event.dart';
part 'measurement_state.dart';

class MeasurementBloc extends Bloc<MeasurementEvent, MeasurementState> {
  final MeasurementCommands commands;
  MeasurementBloc(this.commands) : super(const _Initial()) {
    on<_GetMeasurements>((event, emit) async {
      emit(const _Loading());
      final either = await commands.getMeasurements();
      either.fold((f) => emit(_Error(f)), (list) => emit(_Loaded(list)));
    });

    on<_CreateMeasurement>((event, emit) async {
      emit(const _Loading());
      final either = await commands.createMeasurements(event.m);
      either.fold((f) => emit(_Error(f)), (list) => emit(const _Dirty()));
    });
    on<_UpdateMeasurement>((event, emit) async {
      emit(const _Loading());
      final either = await commands.updateMeasurements(event.m);
      either.fold((f) => emit(_Error(f)), (list) => emit(const _Dirty()));
    });
    on<_DeleteMeasurement>((event, emit) async {
      emit(const _Loading());
      final either = await commands.deleteMeasurements(event.m);
      either.fold((f) => emit(_Error(f)), (list) => emit(const _Dirty()));
    });
  }
}
