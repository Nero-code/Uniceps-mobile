import 'package:dartz/dartz.dart';
import 'package:uniceps/app/contracts/profile_repo.dart';
import 'package:uniceps/app/domain/classes/profile_classes/gym.dart';
import 'package:uniceps/app/domain/commands/i_command.dart';
import 'package:uniceps/core/errors/failure.dart';

class CommandGetAllGyms implements ICommand {
  final ProfileRepo _repo;
  const CommandGetAllGyms({required ProfileRepo repo}) : _repo = repo;

  Future<Either<Failure, List<Gym>>> call() async {
    return await _repo.getGyms();
  }
}
