import 'package:dartz/dartz.dart';
import 'package:uniceps/app/contracts/profile_repo.dart';
import 'package:uniceps/app/domain/classes/auth_enitites/player.dart';
import 'package:uniceps/app/domain/commands/i_command.dart';
import 'package:uniceps/core/errors/failure.dart';

class CommandGetProfile implements ICommand {
  final ProfileRepo _repo;
  const CommandGetProfile({required ProfileRepo repo}) : _repo = repo;

  Future<Either<Failure, Player>> call() async {
    return await _repo.getProfileData();
  }
}
