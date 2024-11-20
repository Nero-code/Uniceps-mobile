import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/auth_enitites/player.dart';
import 'package:uniceps/app/data/models/auth_models/player_model.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IProfileService {
  Future<Either<Failure, Player>> getProfileData();
  Future<Either<Failure, Player>> submitProfileData(PlayerModel playerModel,
      {required bool isCreate});
}
