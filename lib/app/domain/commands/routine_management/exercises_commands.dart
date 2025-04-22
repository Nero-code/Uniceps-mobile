import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';
import 'package:uniceps/app/domain/commands/i_command.dart';
import 'package:uniceps/core/errors/failure.dart';

class ExercisesCommands implements ICommand {
  Future<Either<Failure, List<ExerciseV2>>> getExercises() {
    // TODO: implement getExercises
    throw UnimplementedError();
  }
}
