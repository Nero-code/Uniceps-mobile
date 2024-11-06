import 'package:dartz/dartz.dart';
import 'package:uniceps/app/contracts/training_repository.dart';
import 'package:uniceps/app/domain/classes/training_entities/exercise.dart';
import 'package:uniceps/app/domain/commands/i_command.dart';
import 'package:uniceps/core/errors/failure.dart';

class CommandGetExercisesByFilter implements ICommand {
  final TrainingRepo _repo;

  const CommandGetExercisesByFilter({required TrainingRepo repo})
      : _repo = repo;

  Future<Either<Failure, List<Exercise>>> call(int filter) async {
    return await _repo.getExercisesByFilter(filter);
  }
}
