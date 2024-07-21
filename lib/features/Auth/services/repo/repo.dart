import 'package:dartz/dartz.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Auth/data/models/player_model.dart';
import 'package:uniceps/features/Auth/services/enitites/player.dart';

abstract class AuthRepo {
  Future<Either<Failure, bool>> emailLogin(
      {required String email, required String password});

  Future<Either<Failure, bool>> signinWithEmail({required String email});

  Future<Either<Failure, bool>> validateEmail(
      {required String code,
      required String email,
      required String notifyToken});

  Future<Either<Failure, bool>> checkGymCode({required String gymCode});

  Future<Either<Failure, bool>> isLoggedIn();

  // Future<Either<Failure, bool>> addNewPassword(
  //     {required String email, required String pass});

  Future<Either<Failure, bool>> changePassword({required String pass});

  Future<Either<Failure, Player>> getPlayer();

  Future<Either<Failure, bool>> submitProfile({required PlayerModel player});
}
