import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_filter.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';
import 'package:uniceps/app/domain/helpers/result.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/helpers/exercise_details_result.dart';

abstract class IExercisesContract {
  Future<Either<ExerciseFailure, bool>> checkExercises();
  Future<Either<ExerciseFailure, bool>> changeLibLanguage(String language);

  /// Must Rename to `loadExercisesLibrary` since its purpose is to only update library.
  Future<Either<ExerciseFailure, List<Exercise>>> getExercisesLib();
  Future<Either<ExerciseFailure, Unit>> saveExercisesLib(List<Exercise> lib);

  // Muscle-Groups Filter
  Future<Either<ExerciseFailure, List<MuscleGroup>>> getExerciseGroups();
  Future<Either<ExerciseFailure, List<Exercise>>> getExercisesByGroup(MuscleGroup group);

  // General-Purpose Filter
  Future<Either<ExerciseFailure, ExerciseFilter>> getExerciseFilters();
  Future<Either<ExerciseFailure, List<Exercise>>> getExercisesByFilter(ExerciseFilter filter);

  Stream<Result<double, ExerciseFailure>> downloadImages(List<String> ids);

  Future<Either<ExerciseFailure, ExerciseDetailsResult>> getExerciseDetails(String id);
}
