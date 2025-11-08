import "package:flutter_bloc/flutter_bloc.dart";
import 'package:equatable/equatable.dart';
import 'package:uniceps/app/domain/commands/measurement/measurement_commands.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/app/domain/classes/profile_classes/measrument.dart';

part 'measurment_event.dart';
part 'measurment_state.dart';

class MeasurementBloc extends Bloc<MeasurementEvent, MeasurementState> {
  final MeasurementCommands commands;
  MeasurementBloc(this.commands) : super(MeasurementInitial()) {
    on<GetMeasurementsEvent>((event, emit) async {
      emit(MeasurementLoadingState());
      final either = await commands.getMeasurements();
      either.fold(
        (f) => emit(MeasurementErrorState(f: f)),
        (list) => emit(MeasurementLoadedState(list: list)),
      );
    });
  }
}
