import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/contracts/training_repository.dart';
import 'package:uniceps/app/domain/classes/profile_classes/gym.dart';
import 'package:uniceps/app/domain/commands/i_command.dart';
import 'package:uniceps/core/errors/failure.dart';

class CommandSetSelectedGym implements ICommand {
  final TrainingRepo _repo;

  const CommandSetSelectedGym({required TrainingRepo repo}) : _repo = repo;

  Future<Either<Failure, List<Gym>>> call(String gymId) async {
    return await _repo.setSelectedGym(gymId);
  }
}
