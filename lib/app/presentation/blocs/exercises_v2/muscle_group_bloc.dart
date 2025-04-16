import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uniceps/app/data/models/routine_models/exercise_v2_dto.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/fakes/exercises_json.dart';

part 'muscle_group_event.dart';
part 'muscle_group_state.dart';

class MuscleGroupBloc extends Bloc<MuscleGroupEvent, MuscleGroupState> {
  MuscleGroupBloc() : super(MuscleGroupInitial()) {
    on<GetMuscleGroupsEvent>((event, emit) {
      final res = (jsonDecode(exercisesJson) as Iterable)
          .map((e) => ExerciseV2Dto.fromJson(e))
          .map((e) => e.muscleGroup)
          .toList();
      emit(MuscleGroupLoadedState(groups: res));
    });
  }
}
