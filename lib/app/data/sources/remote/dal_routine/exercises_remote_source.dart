import 'package:uniceps/app/data/models/routine_models/exercise_v2_dto.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';

abstract class IExercisesRemoteSourceContract {
  Future<List<MuscleGroup>> getExerciseGroups();
  Future<List<ExerciseV2Dto>> getExercises();
}

class ExercisesRemoteSourceImpl implements IExercisesRemoteSourceContract {
  @override
  Future<List<MuscleGroup>> getExerciseGroups() {
    // TODO: implement getExerciseGroups
    throw UnimplementedError();
  }

  @override
  Future<List<ExerciseV2Dto>> getExercises() {
    // TODO: implement getExercises
    throw UnimplementedError();
  }
}
