import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uniceps/app/data/sources/remote/dal_auth/auth_contracts.dart';
import 'package:uniceps/app/data/sources/services/token_service_simple.dart';
import 'package:uniceps/app/domain/classes/account_entities/account.dart';
import 'package:uniceps/app/domain/contracts/auth_repo/i_auth_contracts.dart';
import 'package:uniceps/core/errors/failure.dart';

class EmailAuthService implements IOTPAuthRepo {
  const EmailAuthService({
    required this.connection,
    required this.emailAuth,
    required this.tokenService,
  });

  /// connection is typeof [InternetConnectionChecker]
  final InternetConnectionChecker connection;

  /// emailAuth is typeof [IOTPAuthSource] for otp-only email authentication
  final IOTPAuthSource emailAuth;

  /// tokenService is typeof [SimpleTokenService] for
  final SimpleTokenService tokenService;

  @override
  Future<Either<Failure, bool>> verifyCredential(
      {required String credential,
      CredentialType credentialType = CredentialType.email,
      AccountType accountType = AccountType.normal}) async {
    //
    // This method is a buffer and an error translator for the [I2FAuthService].
    //
    // All its functionality happens with network connection available
    // an So is the provided check...
    //
    if (await connection.hasConnection) {
      //
      // After That it calls the curresponding auth provider
      // (in this case emailAuth).
      //
      // We should note that this procedure throws:
      //
      //   - AuthException
      //   - ClientException
      //   - ServerException
      //
      try {
        await emailAuth.verifyCredential(credential: credential);
        // Returning [true] here is useless actually but whatever...
        return const Right(true);
      } catch (e) {
        return Left(AuthFailure(errorMessage: ""));
      }
    }
    return Left(OfflineFailure(errorMessage: ""));
  }

  @override
  Future<Either<Failure, Unit>> validateOTP(
      {required String credential, required String otp}) async {
    if (await connection.hasConnection) {
      try {
        final res = await emailAuth.validateOTP(
          otp: otp,
          credential: credential,
        );
        await tokenService.saveAccessToken(res);

        return const Right(unit);
      } catch (e) {
        return Left(AuthFailure(errorMessage: ""));
      }
    }
    return Left(OfflineFailure(errorMessage: ""));
  }
}
