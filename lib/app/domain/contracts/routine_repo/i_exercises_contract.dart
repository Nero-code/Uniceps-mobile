import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IExercisesContract {
  Future<Either<Failure, List<MuscleGroup>>> getExerciseGroups();
  Future<Either<Failure, List<ExerciseV2>>> getExercises();
}
