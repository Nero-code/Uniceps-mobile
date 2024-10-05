import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Auth/data/models/player_model.dart';
import 'package:uniceps/features/Auth/data/models/user_model.dart';
// import 'package:uniceps/features/Auth/data/models/user_model.dart';
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
  Future<Either<Failure, bool>> validateEmail(
      {required String code,
      required String email,
      required String notifyToken}) async {
    if (await connection.hasConnection) {
      try {
        final token = await FirebaseMessaging.instance.getToken();
        print("Firebase Messaging Token: ${token!.length} \n$token");
        print("Before: Validate Code Func:");
        final res = await remote.verifyCodeSent(
          code: code,
          email: email,
          notifyToken: token,
        );
        print("Before: Validate Code Func:");

        await local.saveUser(res);
        print("saved user: ${local.getUser()}");
        return const Right(true);
      } catch (e) {
        return Left(ServerFailure(errMsg: ""));
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
      print("Is Logged in repo");
      final resUser = await local.getUser();

      final nToken = await FirebaseMessaging.instance.getToken();
      if (resUser.notifyToken != nToken && await connection.hasConnection) {
        final res = await remote.sendNotifyToken(nToken as String);
        if (res == 200) {
          await local.saveUser(
            UserModel.fromJson(
              {...resUser.toJson(), "notify": nToken},
            ),
          );
        }
      }
      return const Right(true);
    } on EmptyCacheExeption {
      return const Left(
          EmptyCacheFailure(errorMessage: "Null User || No Token was found"));
    } catch (e) {
      print("Exception on Auth " + e.toString());
      return Left(
          EmptyCacheFailure(errorMessage: "Unknown Error: ${e.toString()}"));
    }
    // if(await connection.hasConnection){
    //   try{
    //   }
    // }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      await local.localLogout();
      return const Right(true);
    } catch (e) {
      return Left(GeneralPurposFailure(errorMessage: "LogoutFailed"));
    }
    // if (await connection.hasConnection) {
    // try{
    //   final res = await remote.logout();
    // }
    // }
    // else {
    //     try {
    //     await local.localLogout();
    //     return const Right(true);
    //   } catch (e) {
    //     return Left(GeneralPurposFailure(errorMessage: "Could not logout"));
    //   }
    //   // return Left(NoInternetConnectionFailure(errMsg: ""));
    // }
  }

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
        return Left(EmptyCacheFailure(errorMessage: ""));
      }
    }
  }
}
