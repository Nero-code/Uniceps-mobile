import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';
import 'package:uniceps/app/domain/contracts/routine_repo/i_exercises_contract.dart';
import 'package:uniceps/core/errors/failure.dart';

class ExercisesRepo implements IExercisesContract {
  @override
  Future<Either<Failure, List<MuscleGroup>>> getExerciseGroups() {
    // TODO: implement getExerciseGroups
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ExerciseV2>>> getExercises() {
    // TODO: implement getExercises
    throw UnimplementedError();
  }
}
