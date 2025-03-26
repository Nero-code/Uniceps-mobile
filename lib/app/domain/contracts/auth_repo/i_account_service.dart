import 'package:dartz/dartz.dart';
import 'package:uniceps/app/data/models/auth_models/user_model.dart';
import 'package:uniceps/app/domain/classes/auth_enitites/user.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IAccountService {
  Future<Either<Failure, User>> getUser();
  Future<Either<Failure, Unit>> saveUser(UserModel model);
  Future<Either<Failure, bool>> logout();
  Future<Either<Failure, bool>> deleteAccount();

  Future<Either<Failure, bool>> isLoggedIn();
  Future<Either<Failure, bool>> refreshNotifyToken();
}
