import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uniceps/app/data/sources/remote/dal_auth/email_auth.dart';
import 'package:uniceps/app/data/models/auth_models/user_model.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class I2FAuthRepo {
  Future<Either<Failure, bool>> verifyCredentials({required String credential});
  Future<Either<Failure, UserModel>> validateCode({
    required String code,
    required String credential,
    required String notifyToken,
  });
}

class EmailAuthService implements I2FAuthRepo {
  const EmailAuthService({
    required this.connection,
    required this.emailAuth,
  });

  /// connection is typeof [InternetConnectionChecker]
  final InternetConnectionChecker connection;

  /// emailAuth is typeof [I2FAuthService] for email authentication
  final I2FAuthService emailAuth;

  @override
  Future<Either<Failure, bool>> verifyCredentials(
      {required String credential}) async {
    ///
    /// This method is a buffer and an error translator for the [I2FAuthService].
    ///
    /// All its functionality happens with network connection available
    /// an So is the provided check...
    ///
    if (await connection.hasConnection) {
      ///
      /// After That it calls the curresponding auth provider
      /// (in this case emailAuth).
      ///
      /// We should note that this procedure throws:
      ///
      ///   - AuthException
      ///   - ClientException
      ///   - ServerException
      ///
      try {
        await emailAuth.verifyCredentials(credential: credential);
        // Returning [true] here is useless actually but whatever...
        return const Right(true);
      } catch (e) {
        return Left(AuthFailure(errorMessage: ""));
      }
    }
    return Left(OfflineFailure(errorMessage: ""));
  }

  @override
  Future<Either<Failure, UserModel>> validateCode({
    required String code,
    required String credential,
    required String notifyToken,
  }) async {
    if (await connection.hasConnection) {
      try {
        final res = await emailAuth.verifyCodeSent(
          code: code,
          credential: credential,
          notifyToken: notifyToken,
        );
        return Right(res);
      } catch (e) {
        return Left(AuthFailure(errorMessage: ""));
      }
    }
    return Left(OfflineFailure(errorMessage: ""));
  }
}
