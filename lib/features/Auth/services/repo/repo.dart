import 'package:dartz/dartz.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, bool>> emailLogin(
      {required String email, required String password});
  Future<Either<Failure, bool>> signinWithEmail({required String email});
  Future<Either<Failure, bool>> validateCode({required String code});

  Future<Either<Failure, bool>> checkGymCode({required String gymCode});

  Future<Either<Failure, bool>> isLoggedIn();
}
