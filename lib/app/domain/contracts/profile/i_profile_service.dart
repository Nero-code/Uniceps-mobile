import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/auth_entities/profile.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IProfileService {
  Future<Either<Failure, Profile>> getProfile();
  Future<Either<Failure, Unit>> saveProfile(Profile playerModel);
  Future<Either<Failure, String>> changeProfilePicture(String path);
}
