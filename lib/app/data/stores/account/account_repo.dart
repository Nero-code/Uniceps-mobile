import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uniceps/app/data/models/account_models/account_model.dart';
import 'package:uniceps/app/data/sources/local/dal_account/account_local_source.dart';
import 'package:uniceps/app/data/sources/remote/dal_account/account_remote_source.dart';
import 'package:uniceps/app/data/sources/remote/dal_auth/auth_contracts.dart';
import 'package:uniceps/app/data/sources/services/token_service_simple.dart';
import 'package:uniceps/app/domain/contracts/auth_repo/i_auth_contracts.dart';
import 'package:uniceps/app/domain/classes/account_entities/account.dart';
import 'package:uniceps/app/domain/classes/account_entities/subscription.dart';
import 'package:uniceps/app/domain/contracts/account/i_account_service.dart';
import 'package:uniceps/core/errors/failure.dart';

class AccountRepo implements IAccountService, IOTPAuthRepo {
  final IAccountLocalSource _localSource;
  final IAccountRemoteSource _remoteSource;
  final IOTPAuthSource _iotpAuthSource;
  final SimpleTokenService _tokenService;
  final InternetConnectionChecker _checker;

  const AccountRepo(
      {required IAccountLocalSource localSource,
      required IAccountRemoteSource remoteSource,
      required IOTPAuthSource iotpAuthSource,
      required SimpleTokenService tokenService,
      required InternetConnectionChecker checker})
      : _localSource = localSource,
        _remoteSource = remoteSource,
        _checker = checker,
        _iotpAuthSource = iotpAuthSource,
        _tokenService = tokenService;

  @override
  Future<Either<Failure, Account>> getUserAccount() async {
    try {
      return Right((await _localSource.getUserAccount()).toEntity());
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Subscription>> getSubscriptionPlan() async {
    if (await _checker.hasConnection) {
      try {
        final subscriptionPlan = await _remoteSource.getCurrentPlan();
        await _localSource.saveUserPlan(subscriptionPlan);
        return Right(subscriptionPlan.toEntity());
      } catch (e) {
        return Left(ServerFailure(errMsg: e.toString()));
      }
    } else {
      try {
        return Right((await _localSource.getCurrentPlan()).toEntity());
      } catch (e) {
        return Left(DatabaseFailure(errorMsg: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> saveUserAccount(Account account) async {
    try {
      await _localSource.saveUserAccount(AccountModel.fromEntity(account));
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> verifyCredential(
      {required String credential,
      CredentialType credentialType = CredentialType.email,
      AccountType accountType = AccountType.normal}) async {
    //
    // This method is a buffer and an error translator for the [I2FAuthService].
    //
    // All its functionality happens with network _checker available
    // an So is the provided check...
    //
    if (await _checker.hasConnection) {
      //
      // After That it calls the curresponding auth provider
      // (in this case _iotpAuthSource).
      //
      // We should note that this procedure throws:
      //
      //   - AuthException
      //   - ClientException
      //   - ServerException
      //
      try {
        await _iotpAuthSource.verifyCredential(credential: credential);
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
    if (await _checker.hasConnection) {
      try {
        final res = await _iotpAuthSource.validateOTP(
          otp: otp,
          credential: credential,
        );
        await _tokenService.saveAccessToken(res);

        return const Right(unit);
      } catch (e) {
        return Left(AuthFailure(errorMessage: ""));
      }
    }
    return Left(OfflineFailure(errorMessage: ""));
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await _localSource.logout();
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }
}
