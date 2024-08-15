import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Training/services/entities/exercise.dart';
import 'package:uniceps/features/Training/services/entities/training_program.dart';
import 'package:uniceps/features/Training/services/usecases/usecases.dart';

part 'training_event.dart';
part 'training_state.dart';

class TrainingBloc extends Bloc<TrainingEvent, TrainingState> {
  final TrainingUsecases usecases;
  TrainingBloc({required this.usecases}) : super(TrainingInitial()) {
    on<TrainingEvent>((event, emit) {
      if (event is GetProgramEvent) {
        // G E T   P R O G R A M
        emit(TrainingProgramLoadingState());
      } else if (event is GetExercisesEvent) {
        // G E T   E X E R C I S E S
        emit(TrainingProgramLoadingState());
      } else if (event is ChangeFilterEvent) {
        // C H A N G E   F I L T E R
        emit(TrainingProgramLoadingState());
      }
    });
  }
}
