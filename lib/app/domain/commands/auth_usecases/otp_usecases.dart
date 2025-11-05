import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/account_entities/account.dart';
import 'package:uniceps/app/domain/contracts/auth_repo/i_auth_contracts.dart';
import 'package:uniceps/core/errors/failure.dart';

class OtpUsecases {
  const OtpUsecases({required IOTPAuthRepo repo}) : _repo = repo;

  final IOTPAuthRepo _repo;

  Future<Either<AuthFailure, bool>> verifyCredential(
          {required String credential}) async =>
      await _repo.verifyCredential(
        credential: credential,
      );

  Future<Either<AuthFailure, Unit>> validateOTP(
          {required String credential,
          required String otp,
          AccountType accountType = AccountType.normal}) async =>
      await _repo.validateOTP(
        credential: credential,
        otp: otp,
        accountType: accountType,
      );
}
