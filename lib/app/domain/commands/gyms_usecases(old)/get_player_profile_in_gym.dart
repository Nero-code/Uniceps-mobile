import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/contracts/profile_repo.dart';
import 'package:uniceps/app/domain/classes/profile_classes/player_in_gym.dart';
import 'package:uniceps/app/domain/commands/i_command.dart';
import 'package:uniceps/core/errors/failure.dart';

class CommandGetPlayerProfileInGym implements ICommand {
  final ProfileRepo _repo;
  const CommandGetPlayerProfileInGym({required ProfileRepo repo})
      : _repo = repo;

  Future<Either<Failure, PlayerInGym>> call(String gymId, String pid) async {
    return await _repo.getPlayerInGym(gymId, pid);
  }
}
