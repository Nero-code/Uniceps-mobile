import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/helpers/image_cache_manager.dart';
// import 'package:uniceps/features/Training/services/entities/exercise.dart';
import 'package:uniceps/app/Training/services/entities/training_program.dart';
import 'package:uniceps/app/Training/services/commands/usecases.dart';

part 'training_event.dart';
part 'training_state.dart';

class TrainingBloc extends Bloc<TrainingEvent, TrainingState> {
  final TrainingUsecases usecases;
  final ImageCacheManager manager;
  StreamSubscription? imagesSubs;
  TrainingBloc({required this.usecases, required this.manager})
      : super(TrainingInitial()) {
    on<GetProgramEvent>((event, emit) async {
      //
      // G E T   P R O G R A M   E V E N T
      //
      emit(const TrainingProgramLoadingState(percent: 0.0));

      final either = await usecases.getTrainingProgram();
      either.fold(
        (l) => emit(TrainingProgramErrorState(f: l)),
        (r) => emit(TrainingProgramLoadedState(program: r)),
      );
    });
    on<TrainingProgressEvent>((event, emit) async {
      emit(TrainingProgramLoadingState(percent: event.percent));
    });
    imagesSubs = manager.loadingBar.stream.listen((event) {
      // print("bloc event type: ${event.runtimeType}");
      add(TrainingProgressEvent(percent: event));
    });
  }
  @override
  Future<void> close() async {
    await imagesSubs?.cancel();
    return super.close();
  }
}
