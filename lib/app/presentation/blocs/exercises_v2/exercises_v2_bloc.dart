import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uniceps/app/data/models/routine_models/exercise_v2_dto.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/fakes/exercises_json.dart';

part 'exercises_v2_event.dart';
part 'exercises_v2_state.dart';

class ExercisesV2Bloc extends Bloc<ExercisesV2Event, ExercisesV2State> {
  ExercisesV2Bloc() : super(ExercisesV2Initial()) {
    on<GetExercisesByFilterEvent>((event, emit) {
      final list = <ExerciseV2Dto>[];
      final res = jsonDecode(exercisesJson) as Iterable;
      res.map((e) => list.add(ExerciseV2Dto.fromJson(e)));
      emit(ExercisesV2LoadedState(
          list: list.where((e) => e.muscleGroup == event.filter.id).toList()));
    });
    on<AddOrRemoveExerciseEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
