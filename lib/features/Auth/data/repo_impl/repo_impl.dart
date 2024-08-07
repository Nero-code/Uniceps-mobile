import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Auth/data/models/player_model.dart';
import 'package:uniceps/features/Auth/data/sources/local_source.dart';
import 'package:uniceps/features/Auth/data/sources/remote_source.dart';
import 'package:uniceps/features/Auth/services/enitites/player.dart';
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
      return Right(await local.isLoggedIn());
    } on EmptyCacheExeption {
      return Left(
          EmptyCacheFailure(errorMessage: "Null User || No Token was found"));
    } catch (e) {
      return Left(EmptyCacheFailure(errorMessage: "Unknown Error"));
    }
  }

  // @override
  // Future<Either<Failure, bool>> addNewPassword(
  //     {required String email, required String pass}) async {
  //   if (await connection.hasConnection) {
  //     try{

  //     }
  //   } else {
  //     return Left(OfflineFailure(errorMessage: "No Internet Connection!"));
  //   }
  // }

  @override
  Future<Either<Failure, bool>> changePassword({required String pass}) async {
    if (await connection.hasConnection) {
      try {
        await remote.requestPasswordChange(pass);
        return const Right(true);
      } catch (e) {
        return Left(ServerFailure(errMsg: "Unknown exception!"));
      }
    }
    return Left(OfflineFailure(errorMessage: "No Internet!"));
  }

  @override
  Future<Either<Failure, bool>> validateEmail(
      {required String code,
      required String email,
      required String notifyToken}) async {
    if (await connection.hasConnection) {
      try {
        final res = await remote.verifyCodeSent(
          code: code,
          email: email,
          notifyToken: notifyToken,
        );
        return Right(res);
      } catch (e) {
        return Left(ServerFailure(errMsg: ""));
      }
    }
    return Left(OfflineFailure(errorMessage: ""));
  }

  @override
  Future<Either<Failure, bool>> submitProfile(
      {required PlayerModel player}) async {
    if (await connection.hasConnection) {
      try {
        await remote.uploadPlayerInfo(player: player);
        await local.savePlayerInfo(player);
        return const Right(true);
      } catch (e) {
        return Left(ServerFailure(errMsg: "Error Happened in Server"));
      }
    } else {
      return Left(OfflineFailure(errorMessage: "No Internet Connection!"));
    }
  }

  @override
  Future<Either<Failure, Player>> getPlayer() async {
    if (await connection.hasConnection) {
      try {
        final res = await remote.getPlayerInfo();
        return Right(res);
      } catch (e) {
        return Left(ServerFailure(errMsg: "Please try again later"));
      }
    } else {
      try {
        final res = await local.getPlayerInfo();
        return Right(res);
      } catch (e) {
        return Left(EmptyCacheFailure(errorMessage: ""));
      }
    }
  }
}
