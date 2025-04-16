import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/app/data/models/auth_models/player_model.dart';
import 'package:uniceps/app/data/models/auth_models/user_model.dart';
// import 'package:uniceps/features/Auth/data/models/user_model.dart';
import 'package:uniceps/app/data/sources/local/auth_local_source.dart';
import 'package:uniceps/app/data/sources/remote/auth_remote_source.dart';
import 'package:uniceps/app/domain/classes/auth_enitites/player.dart';
import 'package:uniceps/app/domain/contracts/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final LocalAuthSource local;
  final RemoteAuthSource remote;
  final InternetConnectionChecker connection;
  final Logger logger;

  AuthRepoImpl({
    required this.local,
    required this.remote,
    required this.connection,
    required this.logger,
  });

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
  Future<Either<Failure, bool>> validateEmail(
      {required String code,
      required String email,
      required String notifyToken}) async {
    if (await connection.hasConnection) {
      try {
        final token = await FirebaseMessaging.instance.getToken();
        logger.d("Firebase Messaging Token: ${token!.length} \n$token");
        logger.d("Before: Validate Code Func:");
        final res = await remote.verifyCodeSent(
          code: code,
          email: email,
          notifyToken: token,
        );
        logger.d("Before: Validate Code Func:");

        await local.saveUser(res);
        logger.d("saved user: ${local.getUser()}");
        return const Right(true);
      } catch (e) {
        return Left(ServerFailure(errMsg: ""));
      }
    }
    return Left(OfflineFailure(errorMessage: ""));
  }

  // TODO: NEEDS MIGRATION
  @override
  Future<Either<Failure, bool>> isLoggedIn() async {
    logger.t("Auth repo isLoggedIn");
    try {
      logger.d("Is Logged in repo");
      final resUser = await local.getUser();

      if (resUser.email == "uniceps@test.com") return const Right(true);
      String? nToken;
      try {
        nToken = await FirebaseMessaging.instance.getToken();
      } catch (e) {
        logger.i(e.toString());
      }
      logger.d("Is Logged in repo Token: $nToken");

      if (await connection.hasConnection) {
        logger.d("Is Logged in repo: Before sendNotify");
        final res = await remote.sendNotifyToken(nToken ?? "");
        logger.d("Is Logged in repo: After sendNotify");
        logger.d("res: $res");
        await local.saveUser(
          UserModel.fromJson({
            "id": "id",
            "email": resUser.email,
            "token": res['token'],
            "notify": nToken ?? "",
          }),
        );
      }
      return const Right(true);
    } on EmptyCacheExeption {
      return const Left(
          EmptyCacheFailure(errorMessage: "Null User || No Token was found"));
    } on AuthUnautherizedException {
      logger.d("Not autherized! token not valid!");
      local.localLogout();
      return const Left(AuthUnautherizedFailure(""));
    } on AuthException {
      logger.d("ServerException");

      return Left(ServerFailure(errMsg: "errMsg"));
    } catch (e) {
      logger.d("Exception on Auth: $e");
      return Left(
          EmptyCacheFailure(errorMessage: "Unknown Error: ${e.toString()}"));
    }
    // if(await connection.hasConnection){
    //   try{
    //   }
    // }
  }

  // @override
  // Future<Either<Failure, bool>> isLoggedIn() async {
  //   logger.t("Auth repo isLoggedIn");
  //   try {
  //     logger.d("Is Logged in repo");
  //     final resUser = await local.getUser();
  //     logger.d("Is Logged in repo: User = ${resUser.toJson()}");
  //     if (resUser.email == "uniceps@test.com") return const Right(true);
  //     final nToken = await FirebaseMessaging.instance.getToken();
  //     logger.d("Is Logged in repo Token: $nToken");
  //     if (resUser.notifyToken != nToken && await connection.hasConnection) {
  //       logger.d("Is Logged in repo: Before sendNotify");
  //       final res = await remote.sendNotifyToken(nToken ?? "");
  //       logger.d("Is Logged in repo: After sendNotify");
  //       await local.saveUser(
  //         UserModel.fromJson({
  //           "id": "id",
  //           "token": res['token'],
  //           "notify": nToken ?? "",
  //         }),
  //       );
  //     }
  //     return const Right(true);
  //   } on EmptyCacheExeption {
  //     return const Left(
  //         EmptyCacheFailure(errorMessage: "Null User || No Token was found"));
  //   } on AuthException {
  //     logger.d("ServerException");
  //     return Left(ServerFailure(errMsg: "errMsg"));
  //   } catch (e) {
  //     logger.d("Exception on Auth $e");
  //     return Left(
  //         EmptyCacheFailure(errorMessage: "Unknown Error: ${e.toString()}"));
  //   }
  //   // if(await connection.hasConnection){
  //   //   try{
  //   //   }
  //   // }
  // }

  @override
  Future<Either<Failure, bool>> logout() async {
    if (await connection.hasConnection) {
      try {
        await remote.logout();
        await local.localLogout();
        return const Right(true);
      } on AuthException {
        return Left(AuthFailure(errorMessage: "could not logout user"));
      } catch (e) {
        return Left(GeneralPurposFailure(errorMessage: "LogoutFailed"));
      }
    }
    return Left(
      NoInternetConnectionFailure(errMsg: ""),
    );
  }

  @override
  Future<Either<Failure, bool>> deleteAccount() async {
    if (await connection.hasConnection) {
      try {
        final res = await remote.deleteAccount();
        await local.localLogout();
        return Right(res);
      } on ServerException catch (e, s) {
        logger.e("ServerException", error: e, stackTrace: s);
        return Left(ServerFailure(errMsg: ""));
      } catch (e, s) {
        logger.f("Deleting Account Error", error: e, stackTrace: s);
        return Left(GeneralPurposFailure(errorMessage: ""));
      }
    }

    return Left(NoInternetConnectionFailure(errMsg: ""));
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
        await local.savePlayerInfo(res);
        return Right(res);
      } catch (e) {
        return Left(ServerFailure(errMsg: "Please try again later"));
      }
    } else {
      try {
        final res = await local.getPlayerInfo();
        return Right(res);
      } catch (e) {
        return const Left(EmptyCacheFailure(errorMessage: ""));
      }
    }
  }

  //  TODO: Needs Migration
  @override
  Future<Either<Failure, UserModel>> loginAsGuest() async {
    if (await connection.hasConnection) {
      try {
        final res = await remote.loginAsGuest();
        await local.saveUser(res);
        return Right(res);
      } on ServerException {
        return Left(ServerFailure(errMsg: ""));
      } catch (e) {
        logger.e("Error in guest mode", error: e);
        return Left(NotFoundFailure(errMsg: e.toString()));
      }
    }
    return Left(NoInternetConnectionFailure(errMsg: ""));
  }
}
