import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Auth/data/sources/local_source.dart';
import 'package:uniceps/features/Auth/data/sources/remote_source.dart';
import 'package:uniceps/features/Auth/services/repo/repo.dart';

class AuthRepoImpl implements AuthRepo {
  final LocalAuthSource local;
  final RemoteAuthSource remote;
  final InternetConnectionChecker connection;

  AuthRepoImpl({
    required this.local,
    required this.remote,
    required this.connection,
  });

  @override
  Future<Either<Failure, bool>> emailLogin({
    required String email,
    required String password,
  }) async {
    if (await connection.hasConnection) {
      try {
        await remote.loginWithEmailAndPassword(
            email: email, password: password);
        return const Right(true);
      } catch (e) {
        return Left(AuthFailure(errorMessage: "Wrong email or password!"));
      }
    }
    return Left(OfflineFailure(errorMessage: "No Internet Connection!"));
  }

  @override
  Future<Either<Failure, bool>> signinWithEmail({required String email}) async {
    if (await connection.hasConnection) {
      try {
        await remote.verifyEmail(email: email);
        return const Right(true);
      } catch (e) {
        return Left(GeneralPurposFailure(errorMessage: ""));
      }
    }
    return Left(OfflineFailure(errorMessage: ""));
  }

  @override
  Future<Either<Failure, bool>> validateCode({required String code}) async {
    if (await connection.hasConnection) {
      try {
        final accepted = await remote.verifyCodeSent(code: code);
        if (accepted) {
          return const Right(true);
        }
        return const Right(false);
      } catch (e) {
        return Left(GeneralPurposFailure(errorMessage: "Unknown Error!!"));
      }
    }
    return Left(OfflineFailure(errorMessage: "No Internet Connection!"));
  }

  @override
  Future<Either<Failure, bool>> checkGymCode({required String gymCode}) async {
    if (await connection.hasConnection) {
      try {
        await remote.verifyGymCode(gymCode: gymCode);
        return const Right(true);
      } catch (e) {
        return Left(GeneralPurposFailure(errorMessage: "not verified"));
      }
    }
    return Left(OfflineFailure(errorMessage: "no internet connection!"));
  }

  @override
  Future<Either<Failure, bool>> isLoggedIn() async {
    try {
      if (await local.isLoggedIn()) {
        return const Right(true);
      }
      return const Right(false);
    } on EmptyCacheExeption {
      return Left(EmptyCacheFailure(errorMessage: "Not Autherized"));
    } catch (e) {
      return Left(EmptyCacheFailure(errorMessage: "Unknown Error"));
    }
  }
}
