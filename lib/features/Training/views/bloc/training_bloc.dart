import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uniceps/features/Training/services/usecases/usecases.dart';

part 'training_event.dart';
part 'training_state.dart';

class TrainingBloc extends Bloc<TrainingEvent, TrainingState> {
  final TrainingUsecases usecases;
  TrainingBloc({required this.usecases}) : super(TrainingInitial()) {
    on<TrainingEvent>((event, emit) {
      if (event is GetProgramEvent) {
        emit(TrainingProgramLoadingState());
      } else if (event is GetExercisesEvent) {
        emit(ExercisesLoadingState());
      } else if (event is GetSubscriptionsEvent) {
        emit(SubscriptionsLoadingState());
      } else if (event is GetMeasurementsEvent) {
        emit(MeasurementsLoadingState());
      }
    });
  }
}
