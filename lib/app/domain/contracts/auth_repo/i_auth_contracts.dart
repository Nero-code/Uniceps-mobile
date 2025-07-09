import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/account_entities/account.dart';
import 'package:uniceps/core/errors/failure.dart';

enum CredentialType { email, phone }

abstract class IOTPAuthRepo {
  Future<Either<Failure, bool>> verifyCredential(
      {required String credential,
      CredentialType credentialType = CredentialType.email,
      AccountType accountType = AccountType.normal});
  Future<Either<Failure, Unit>> validateOTP(
      {required String credential, required String otp});
}

abstract class I2FAuthRepo {
  Future<Either<Failure, bool>> verifyCredentials({
    required String credential,
    required String password,
    CredentialType type = CredentialType.email,
  });
  Future<Either<Failure, Unit>> validateCode({
    required String code,
    required String credential,
    required String password,
  });
}
