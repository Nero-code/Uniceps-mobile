import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/contracts/profile_repo/i_profile_service.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/app/data/models/auth_models/player_model.dart';
import 'package:uniceps/app/domain/classes/auth_enitites/player.dart';

class ProfileUsecases {
  final IProfileService repo;
  ProfileUsecases({required this.repo});

  Future<Either<Failure, Player>> getProfile() => repo.getProfile();

  Future<Either<Failure, Unit>> submitProfileData(PlayerModel playerModel) => repo.saveProfile(playerModel);
}
