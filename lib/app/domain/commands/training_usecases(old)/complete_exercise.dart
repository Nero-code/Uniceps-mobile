import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/contracts/training_repository.dart';
import 'package:uniceps/app/domain/commands/i_command.dart';
import 'package:uniceps/core/errors/failure.dart';

class CommandCompleteExercise implements ICommand {
  final TrainingRepo _repo;

  const CommandCompleteExercise({required TrainingRepo repo}) : _repo = repo;

  Future<Either<Failure, bool>> call(String eId) async {
    return await _repo.completeExercise(eId);
  }
}
