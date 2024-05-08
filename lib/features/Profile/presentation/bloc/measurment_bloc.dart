import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Profile/domain/entities/measrument.dart';
import 'package:uniceps/features/Profile/domain/usecases.dart';

part 'measurment_event.dart';
part 'measurment_state.dart';

class MeasurmentBloc extends Bloc<MeasurmentEvent, MeasurmentState> {
  final ProfileUsecases usecases;
  MeasurmentBloc({required this.usecases}) : super(MeasurmentInitial()) {
    on<MeasurmentEvent>((event, emit) async {
      if (event is GetMeasurementsEvent) {
        emit(MeasurementLoadingState());
        final either = await usecases.getMeasurement(event.gymId);
        either.fold(
          (f) => emit(MeasurementErrorState(f: f)),
          (list) => emit(MeasurementLoadedState(list: list)),
        );
      }
    });
  }
}
