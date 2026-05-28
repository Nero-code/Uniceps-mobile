import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/auth_entities/profile.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IProfileService {
  Future<Either<Failure, Unit>> initializeProfile(Profile playerModel);
  Future<Either<Failure, Unit>> syncProfile();

  Future<Either<Failure, Profile>> getProfile();
  Future<Either<Failure, Unit>> saveProfile(Profile playerModel);
  Future<Either<Failure, Unit>> changeProfilePicture(Uint8List path);
  Future<Either<Failure, Unit>> deleteProfilePicture();
}
