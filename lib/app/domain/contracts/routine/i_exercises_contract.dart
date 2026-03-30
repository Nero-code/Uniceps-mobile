import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';
import 'package:uniceps/app/domain/helpers/result.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IExercisesContract {
  Future<Either<Failure, bool>> checkExercises();

  /// Must Rename to `loadExercisesLibrary` since its purpose is to only update library.
  Future<Either<Failure, List<Exercise>>> getExercisesLib();
  Future<Either<Failure, Unit>> saveExercisesLib(List<Exercise> lib);
  Future<Either<Failure, List<MuscleGroup>>> getExerciseGroups();
  Future<Either<Failure, List<Exercise>>> getExercisesByGroup(MuscleGroup group);

  Stream<Result<double, Failure>> downloadImages(List<String> ids);
}
