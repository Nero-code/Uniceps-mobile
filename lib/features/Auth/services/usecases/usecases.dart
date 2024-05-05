import 'package:dartz/dartz.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Auth/services/repo/repo.dart';

class AuthUsecases {
  final AuthRepo repo;

  AuthUsecases({required this.repo});

  Future<Either<Failure, bool>> checkGymCode({required String gymCode}) async {
    return await repo.checkGymCode(gymCode: gymCode);
  }

  Future<Either<Failure, bool>> emailSignin(
      {required String email, required String password}) async {
    return await repo.emailLogin(email: email, password: password);
  }

  Future<Either<Failure, bool>> validateCode({required String code}) async {
    return await repo.validateCode(code: code);
  }

  Future<Either<Failure, bool>> isLoggedIn() async {
    return await repo.isLoggedIn();
  }
}
