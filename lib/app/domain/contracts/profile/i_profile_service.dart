import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/auth_enitites/player.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IProfileService {
  Future<Either<Failure, Player>> getProfile();
  Future<Either<Failure, Unit>> saveProfile(Player playerModel);
}
