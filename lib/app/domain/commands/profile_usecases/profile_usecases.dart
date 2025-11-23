import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/contracts/profile/i_profile_service.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/app/domain/classes/auth_enitites/player.dart';

class ProfileUsecases {
  final IProfileService repo;
  ProfileUsecases({required this.repo});

  Future<Either<Failure, Player>> getProfile() => repo.getProfile();

  Future<Either<Failure, Unit>> submitProfileData(Player playerModel) => repo.saveProfile(playerModel);
}
