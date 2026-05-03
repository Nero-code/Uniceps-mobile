import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_filter.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';
import 'package:uniceps/app/domain/helpers/result.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IExercisesContract {
  Future<Either<Failure, bool>> checkExercises();
  Future<Either<Failure, bool>> changeLibLanguage(String language);

  /// Must Rename to `loadExercisesLibrary` since its purpose is to only update library.
  Future<Either<Failure, List<Exercise>>> getExercisesLib();
  Future<Either<Failure, Unit>> saveExercisesLib(List<Exercise> lib);

  // Muscle-Groups Filter
  Future<Either<Failure, List<MuscleGroup>>> getExerciseGroups();
  Future<Either<Failure, List<Exercise>>> getExercisesByGroup(MuscleGroup group);

  // General-Purpose Filter
  Future<Either<Failure, ExerciseFilter>> getExerciseFilters();
  Future<Either<Failure, List<Exercise>>> getExercisesByFilter(ExerciseFilter filter);

  Stream<Result<double, Failure>> downloadImages(List<String> ids);
}
