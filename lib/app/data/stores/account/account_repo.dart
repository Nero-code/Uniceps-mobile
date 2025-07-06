import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uniceps/app/data/sources/local/dal_account/account_local_source.dart';
import 'package:uniceps/app/data/sources/remote/dal_account/account_remote_source.dart';
import 'package:uniceps/app/domain/classes/account_entities/account.dart';
import 'package:uniceps/app/domain/classes/account_entities/subscription.dart';
import 'package:uniceps/app/domain/contracts/account/i_account_service.dart';
import 'package:uniceps/core/errors/failure.dart';

class AccountRepo implements IAccountService {
  final IAccountLocalSource _localSource;
  final IAccountRemoteSource _remoteSource;
  final InternetConnectionChecker _checker;

  const AccountRepo(
      {required IAccountLocalSource localSource,
      required IAccountRemoteSource remoteSource,
      required InternetConnectionChecker checker})
      : _localSource = localSource,
        _remoteSource = remoteSource,
        _checker = checker;

  @override
  Future<Either<Failure, Account>> getUserAccount() async {
    if (await _checker.hasConnection) {
      try {
        final userAccount = await _remoteSource.getUserAccount();
        await _localSource.saveUserAccount(userAccount);
        return Right(userAccount.toEntity());
      } catch (e) {
        return Left(ServerFailure(errMsg: e.toString()));
      }
    } else {
      try {
        return Right((await _localSource.getUserAccount()).toEntity());
      } catch (e) {
        return Left(DatabaseFailure(errorMsg: e.toString()));
      }
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
}
