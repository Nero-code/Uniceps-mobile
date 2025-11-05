import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/app/domain/classes/training_entities/exercise.dart';
import 'package:uniceps/app/domain/commands/training_usecases(old)/training_usecases.dart';

part 'exercises_event.dart';
part 'exercises_state.dart';

class ExercisesBloc extends Bloc<ExercisesEvent, ExercisesState> {
  final TrainingUsecases usecases;
  ExercisesBloc({required this.usecases}) : super(ExercisesInitial()) {
    on<GetExercisesByFilterEvent>((event, emit) async {
      // print("inside Exercise Bloc: GetExercisesByFilter event");
      emit(ExercisesLoadingState());
      final either = await usecases.getExercisesByFilter(event.filter);
      either.fold(
        (l) => emit(ExercisesErrorState(l)),
        (r) => emit(ExercisesLoadedState(r)),
      );
    });
    on<UpdateLastWeightEvent>(
      (event, emit) async {
        // print("inside Exercise Bloc: UpdateLast weight event");
        emit(ExercisesLoadingState());
        final either = await usecases.saveNewWeight({event.eId: event.newVal});
        either.fold(
          (l) => emit(ExercisesErrorState(l)),
          (r) => emit(ExercisesUpdatedState()),
        );
      },
    );
  }
}
