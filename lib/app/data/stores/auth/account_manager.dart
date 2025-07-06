// import 'package:dartz/dartz.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:uniceps/app/data/models/auth_models/user_model.dart';
// import 'package:uniceps/app/domain/contracts/auth_repo/i_account_service.dart';
// import 'package:uniceps/app/data/sources/local/dal_auth/account_local_source.dart';
// import 'package:uniceps/app/data/sources/remote/dal_auth/account_remote_source.dart';
// import 'package:uniceps/app/domain/classes/auth_enitites/user.dart';
// import 'package:uniceps/core/errors/failure.dart';

// class AccountManager implements IAccountService {
//   const AccountManager({
//     required this.connection,
//     required this.localSource,
//     required this.remoteSource,
//   });

//   final InternetConnectionChecker connection;
//   final IAccountLocalSource localSource;
//   final IAccountRemoteSource remoteSource;

//   @override
//   Future<Either<Failure, User>> getUser() async {
//     try {
//       final res = await localSource.getUser();
//       return Right(res);
//     } catch (e) {
//       return const Left(EmptyCacheFailure(errorMessage: ""));
//     }
//   }

//   @override
//   Future<Either<Failure, Unit>> saveUser(UserModel model) async {
//     try {
//       await localSource.saveUser(model);
//       return const Right(unit);
//     } catch (e) {
//       return Left(DatabaseFailure(errorMsg: ""));
//     }
//   }

//   @override
//   Future<Either<Failure, bool>> isLoggedIn() async {
//     try {
//       return Right(await localSource.isLoggedIn());
//     } catch (e) {
//       return Left(AuthFailure(errorMessage: "errorMessage"));
//     }
//   }

//   @override
//   Future<Either<Failure, bool>> logout() async {
//     if (await connection.hasConnection) {
//       try {
//         await remoteSource.logout();
//         await localSource.localLogout();
//         return const Right(true);
//       } catch (e) {
//         return Left(AuthFailure(errorMessage: ""));
//       }
//     }

//     return Left(OfflineFailure(errorMessage: ""));
//   }

//   @override
//   Future<Either<Failure, bool>> deleteAccount() async {
//     if (await connection.hasConnection) {
//       try {
//         remoteSource.deleteAccount();
//         return const Right(true);
//       } catch (e) {
//         return Left(AuthFailure(errorMessage: ""));
//       }
//     }

//     return Left(OfflineFailure(errorMessage: ""));
//   }

//   @override
//   Future<Either<Failure, bool>> refreshNotifyToken() async {
//     if (await connection.hasConnection) {
//       try {
//         final res = await remoteSource.refreshNotifyToken();
//         return Right(res);
//       } catch (e) {
//         return Left(AuthFailure(errorMessage: ""));
//       }
//     }
//     return Left(OfflineFailure(errorMessage: ""));
//   }
// }
