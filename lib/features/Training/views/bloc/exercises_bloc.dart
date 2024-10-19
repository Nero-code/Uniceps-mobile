import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Training/services/entities/exercise.dart';
import 'package:uniceps/features/Training/services/usecases/usecases.dart';

part 'exercises_event.dart';
part 'exercises_state.dart';

class ExercisesBloc extends Bloc<ExercisesEvent, ExercisesState> {
  final TrainingUsecases usecases;
  ExercisesBloc({required this.usecases}) : super(ExercisesInitial()) {
    on<ExercisesEvent>((event, emit) async {
      if (event is GetExercisesByFilterEvent) {
        // print("inside Exercise Bloc: GetExercisesByFilter event");
        emit(ExercisesLoadingState());
        final either = await usecases.getExercisesByFilter(event.filter);
        either.fold(
          (l) => emit(ExercisesErrorState(l)),
          (r) => emit(ExercisesLoadedState(r)),
        );
      } else if (event is UpdateLastWeightEvent) {
        // print("inside Exercise Bloc: UpdateLast weight event");
        emit(ExercisesLoadingState());
        final either = await usecases.saveNewWeight({event.eId: event.newVal});
        either.fold(
          (l) => emit(ExercisesErrorState(l)),
          (r) => emit(ExercisesUpdatedState()),
        );
      }
    });
  }
}
