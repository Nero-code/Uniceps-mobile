import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/contracts/profile_repo.dart';
import 'package:uniceps/app/domain/classes/auth_enitites/player.dart';
import 'package:uniceps/app/domain/commands/i_command.dart';
import 'package:uniceps/app/data/models/auth_models/player_model.dart';
import 'package:uniceps/core/errors/failure.dart';

class CommandSubmitProfile implements ICommand {
  final ProfileRepo _repo;
  const CommandSubmitProfile({required ProfileRepo repo}) : _repo = repo;

  Future<Either<Failure, Player>> call(PlayerModel playerModel,
      {required bool isCreate}) async {
    return await _repo.submitProfileData(playerModel, isCreate: isCreate);
  }
}
