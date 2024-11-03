import "package:flutter_bloc/flutter_bloc.dart";
import 'package:equatable/equatable.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Profile/domain/classes/measrument.dart';
import 'package:uniceps/features/Profile/domain/commands/usecases.dart';

part 'measurment_event.dart';
part 'measurment_state.dart';

class MeasurmentBloc extends Bloc<MeasurmentEvent, MeasurmentState> {
  final ProfileUsecases usecases;
  MeasurmentBloc({required this.usecases}) : super(MeasurmentInitial()) {
    on<GetMeasurementsEvent>((event, emit) async {
      emit(MeasurementLoadingState());
      final either = await usecases.getMeasurement();
      either.fold(
        (f) => emit(MeasurementErrorState(f: f)),
        (list) => emit(MeasurementLoadedState(list: list)),
      );
    });
  }
}
