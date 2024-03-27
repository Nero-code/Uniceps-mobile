import 'package:dartz/dartz.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, Unit>> emailSignin(
      {required String email, required String password});
  Future<Either<Failure, Unit>> validateCode({required String code});

  Future<Either<Failure, Unit>> checkGymCode({required String gymCode});

  Future<Either<Failure, Unit>> isLoggedIn();
}
