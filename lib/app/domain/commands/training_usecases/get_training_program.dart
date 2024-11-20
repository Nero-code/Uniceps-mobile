import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/contracts/training_repository.dart';
import 'package:uniceps/app/domain/classes/training_entities/training_program.dart';
import 'package:uniceps/app/domain/commands/i_command.dart';
import 'package:uniceps/core/errors/failure.dart';

class CommandGetTrainingProgram implements ICommand {
  final TrainingRepo _repo;

  const CommandGetTrainingProgram({required TrainingRepo repo}) : _repo = repo;

  Future<Either<Failure, TrainingProgram>> call() async {
    return await _repo.getTrainingProgram();
  }
}
