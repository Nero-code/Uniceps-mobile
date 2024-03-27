import 'package:dartz/dartz.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Auth/services/repo/repo.dart';
import 'package:uniceps/features/Training/data/sources/local_data_source.dart';
import 'package:uniceps/features/Training/data/sources/remote_data_source.dart';

class AuthRepoImpl implements AuthRepo {
  final LocalDataSource local;
  final RemoteDataSource reomte;
  // final InternerConnectionChecker connection;

  AuthRepoImpl({
    required this.local,
    required this.reomte,
  });

  @override
  Future<Either<Failure, Unit>> checkGymCode({required String gymCode}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> emailSignin(
      {required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> validateCode({required String code}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> isLoggedIn() {
    // TODO: implement isLoggedIn
    throw UnimplementedError();
  }
}
