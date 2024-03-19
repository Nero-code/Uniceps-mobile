import 'package:dartz/dartz.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Auth/services/repo/repo.dart';

class AuthUsecases implements AuthRepo {
  @override
  Future<Either<Failure, Unit>> checkGymCode({required String gymCode}) async {
    // TODO: implement checkGymCode
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> emailSignin(
      {required String email, required String password}) async {
    // TODO: implement emailSignin
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> validateCode({required String code}) async {
    // TODO: implement validateCode
    throw UnimplementedError();
  }
}
