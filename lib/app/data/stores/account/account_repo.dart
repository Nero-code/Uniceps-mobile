import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/app/data/models/account_models/payment_response.dart';
import 'package:uniceps/app/data/models/account_models/plan_item_model.dart';
import 'package:uniceps/app/data/sources/local/dal_account/account_local_source.dart';
import 'package:uniceps/app/data/sources/remote/dal_account/account_remote_source.dart';
import 'package:uniceps/app/data/sources/services/token/token_service_simple.dart';
import 'package:uniceps/app/domain/classes/account_entities/account.dart';
import 'package:uniceps/app/domain/classes/account_entities/membership.dart';
import 'package:uniceps/app/domain/classes/account_entities/plan.dart';
import 'package:uniceps/app/domain/classes/account_entities/plan_item.dart';
import 'package:uniceps/app/domain/contracts/account/i_account_service.dart';
import 'package:uniceps/core/errors/failure.dart';

class AccountRepo implements IAccountService {
  final IAccountLocalSource _localSource;
  final IAccountRemoteSource _remoteSource;
  final InternetConnectionChecker _checker;
  final SimpleTokenService _tokenService;
  final Logger _logger;

  const AccountRepo({
    required IAccountLocalSource localSource,
    required IAccountRemoteSource remoteSource,
    required InternetConnectionChecker checker,
    required SimpleTokenService tokenService,
    required Logger logger,
  }) : _localSource = localSource,
       _remoteSource = remoteSource,
       _checker = checker,
       _tokenService = tokenService,
       _logger = logger;

  @override
  Future<Either<Failure, Account>> getUserAccount() async {
    try {
      final account = await _localSource.getUserAccount();
      _logger.t('Got Account: ${account.toJson()}');
      return Right(account.toEntity());
    } catch (e) {
      _logger.e('Error in getAccount!', error: e);
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<MembershipFailure, Membership>> getUserMembership() async {
    if (await _checker.hasConnection) {
      try {
        final subscriptionPlan = await _remoteSource.getUserMembership();
        final shouldNotify = await _localSource.saveUserMembership(subscriptionPlan);
        return Right(subscriptionPlan.copyWith(isNotified: !shouldNotify).toEntity());
      } catch (e) {
        _localSource.clearMemberships();
        return const Left(MembershipFailure.cantGetPlan());
      }
    } else {
      try {
        return Right((await _localSource.getCurrentPlan()).toEntity());
      } catch (e) {
        return const Left(MembershipFailure.mmOffline());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await _localSource.logout();
      await _tokenService.deleteAccessToken();
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Plan>> getPlans() async {
    if (await _checker.hasConnection) {
      try {
        final res = await _remoteSource.getPlans();
        _logger.t("Success: Got Plan");
        return Right(res.toEntity());
      } catch (e) {
        _logger.e("Error while getting plan", error: e);
        return Left(ServerFailure(errMsg: ""));
      }
    }
    return Left(OfflineFailure(errorMessage: "NoInternet"));
  }

  @override
  Future<Either<Failure, PaymentResponse>> buyPlan(PlanItem item) async {
    if (await _checker.hasConnection) {
      try {
        final res = await _remoteSource.buyPlan(PlanItemModel.fromEntity(item));
        return Right(res);
      } catch (e) {
        _logger.e("Error while buying plan", error: e);
        return Left(ServerFailure(errMsg: "errMsg"));
      }
    }
    return Left(OfflineFailure(errorMessage: "errorMessage"));
  }

  @override
  Future<Either<Failure, Unit>> deleteAccount() async {
    throw UnimplementedError();
  }

  @override
  Future<Either<MembershipFailure, Membership>> notifyNewMembership() async {
    try {
      final res = await _localSource.userMembershipNotified();
      return Right(res.toEntity());
    } catch (e) {
      _logger.e('Error in notify Membership', error: e);
      return Left(MembershipFailure.cantGetPlan());
    }
  }
}
