import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';
import 'package:uniceps/app/domain/commands/i_command.dart';
import 'package:uniceps/app/domain/contracts/routine_repo/i_exercises_contract.dart';
import 'package:uniceps/core/errors/failure.dart';

class ExercisesCommands implements ICommand {
  final IExercisesContract _repo;
  const ExercisesCommands({required IExercisesContract repo}) : _repo = repo;

  Future<Either<Failure, List<ExerciseV2>>> getExercises() async {
    return await _repo.getExercises();
  }

  Future<Either<Failure, List<ExerciseV2>>> getExercisesByFilter(
      String filter) async {
    return await _repo.getExercisesByFilter(filter);
  }

  Future<Either<Failure, List<ExerciseV2>>> getExercisesByGroup(
      MuscleGroup filter) async {
    return await _repo.getExercisesByGroup(filter);
  }

  Future<Either<Failure, List<MuscleGroup>>> getExerciseGroups() async {
    return await _repo.getExerciseGroups();
  }
}
