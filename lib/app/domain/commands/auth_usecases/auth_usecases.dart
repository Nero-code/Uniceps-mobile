import 'package:dartz/dartz.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/app/data/models/auth_models/player_model.dart';
import 'package:uniceps/app/domain/classes/auth_enitites/player.dart';
import 'package:uniceps/app/domain/contracts/auth_repo.dart';

class AuthUsecases {
  final AuthRepo repo;

  AuthUsecases({required this.repo});

  // Future<Either<Failure, bool>> checkGymCode({required String gymCode}) async {
  //   return await repo.checkGymCode(gymCode: gymCode);
  // }

  Future<Either<Failure, bool>> emailSignin({required String email}) async {
    return await repo.signinWithEmail(email: email);
  }

  // Future<Either<Failure, bool>> emailLogin(
  //     {required String email, required String password}) async {
  //   return await repo.emailLogin(email: email, password: password);
  // }

  Future<Either<Failure, bool>> validateCode(
      {required String code,
      required String email,
      required String notifyToken}) async {
    return await repo.validateEmail(
        code: code, email: email, notifyToken: notifyToken);
  }

  Future<Either<Failure, bool>> isLoggedIn() async {
    return await repo.isLoggedIn();
  }

  // Future<Either<Failure, bool>> addNewPassword(
  //     {required String email, required String pass}) async {
  //   return repo.addNewPassword(email: email, pass: pass);
  // }

  // Future<Either<Failure, bool>> changePassword({required String pass}) async {
  //   return await repo.changePassword(pass: pass);
  // }

  Future<Either<Failure, bool>> submitProfile(
      {required PlayerModel player}) async {
    return await repo.submitProfile(player: player);
  }

  Future<Either<Failure, Player>> getProfile() async {
    return await repo.getPlayer();
  }

  Future<Either<Failure, bool>> logout() async {
    return await repo.logout();
  }

  Future<Either<Failure, bool>> deleteAccount() async {
    return await repo.deleteAccount();
  }
}
