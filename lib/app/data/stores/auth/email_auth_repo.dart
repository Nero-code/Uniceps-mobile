import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uniceps/app/data/models/account_models/account_model.dart';
import 'package:uniceps/app/data/sources/local/dal_account/account_local_source.dart';
import 'package:uniceps/app/data/sources/remote/dal_auth/auth_contracts.dart';
import 'package:uniceps/app/data/sources/services/token_service_simple.dart';
import 'package:uniceps/app/domain/classes/account_entities/account.dart';
import 'package:uniceps/app/domain/contracts/auth_repo/i_auth_contracts.dart';
import 'package:uniceps/core/errors/failure.dart';

class EmailAuthRepo implements IOTPAuthRepo {
  EmailAuthRepo({
    required this.otpAuthSource,
    required this.tokenService,
    required this.accountLocalSource,
    required this.connection,
  });

  /// otpAuthSource is typeof [IOTPAuthSource] for otp-only email authentication
  final IOTPAuthSource otpAuthSource;

  /// tokenService is typeof [SimpleTokenService] for saving new tokens
  final SimpleTokenService tokenService;

  /// accountLocalSource is typeof [IAccountLocalSource] for saving new account
  final IAccountLocalSource accountLocalSource;

  /// connection is typeof [InternetConnectionChecker]
  final InternetConnectionChecker connection;

  Account? tempAccount;

  @override
  Future<Either<AuthFailure, bool>> verifyCredential({
    required String credential,
  }) async {
    if (await connection.hasConnection) {
      try {
        await otpAuthSource.verifyCredential(credential: credential);
        // Returning [true] here is useless actually but whatever...
        return const Right(true);
      } catch (e) {
        return const Left(AuthFailure.unautherizedFailure());
      }
    }
    return const Left(AuthFailure.offline());
  }

  @override
  Future<Either<AuthFailure, Unit>> validateOTP(
      {required String credential,
      required String otp,
      AccountType accountType = AccountType.normal}) async {
    if (await connection.hasConnection) {
      try {
        final res = await otpAuthSource.validateOTP(
          otp: otp,
          credential: credential,
          parser: (json) => json,
        );

        await Future.wait([
          tokenService.saveAccessToken(res['token']),
          accountLocalSource.saveUserAccount(AccountModel(
              uid: res['id'],
              email: credential,
              createdAt: DateTime.now(),
              type: accountType))
        ]);

        return const Right(unit);
      } catch (e) {
        print(e);
        return const Left(AuthFailure.invalidCodeFailure());
      }
    }
    return const Left(AuthFailure.offline());
  }
}
