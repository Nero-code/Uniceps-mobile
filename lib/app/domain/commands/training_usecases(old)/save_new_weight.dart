import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/contracts/training_repository.dart';
import 'package:uniceps/app/domain/commands/i_command.dart';
import 'package:uniceps/core/errors/failure.dart';

class CommandSaveNewWeight implements ICommand {
  final TrainingRepo _repo;

  const CommandSaveNewWeight({required TrainingRepo repo}) : _repo = repo;

  Future<Either<Failure, Unit>> call(Map<String, double> val) async {
    return await _repo.saveNewWeight(val);
  }
}
