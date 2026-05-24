import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/auth_entities/profile.dart';
import 'package:uniceps/app/domain/contracts/profile/i_profile_service.dart';
import 'package:uniceps/core/errors/failure.dart';

class ProfileUsecases {
  final IProfileService repo;
  ProfileUsecases({required this.repo});

  Future<Either<Failure, Profile>> getProfile() => repo.getProfile();

  Future<Either<Failure, Unit>> submitProfileData(Profile playerModel) => repo.saveProfile(playerModel);
}
