import 'package:uniceps/app/data/models/routine_models/exercise_dto.dart';

abstract class IExercisesLocalSourceContract {
  Future<List<ExerciseDto>> getExercises();
  Future<List<ExerciseDto>> getExercisesByGroup(String groupId);
  // Future<List<ExerciseV2Dto>> getExercisesByFilter(String filter);
  Future<void> saveExercise(ExerciseDto exercise);
}

class ExercisesLocalSource implements IExercisesLocalSourceContract {
  @override
  Future<List<ExerciseDto>> getExercises() {
    // TODO: implement getExercises
    throw UnimplementedError();
  }

  @override
  Future<List<ExerciseDto>> getExercisesByGroup(String groupId) {
    // TODO: implement getExercisesByGroup
    throw UnimplementedError();
  }

  @override
  Future<void> saveExercise(ExerciseDto exercise) {
    // TODO: implement saveExercise
    throw UnimplementedError();
  }
}
