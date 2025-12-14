import 'package:dartz/dartz.dart';
import 'package:uniceps/app/data/models/account_models/payment_response.dart';
import 'package:uniceps/app/domain/classes/account_entities/account.dart';
import 'package:uniceps/app/domain/classes/account_entities/membership.dart';
import 'package:uniceps/app/domain/classes/account_entities/plan.dart';
import 'package:uniceps/app/domain/classes/account_entities/plan_item.dart';
import 'package:uniceps/app/domain/contracts/account/i_account_service.dart';
import 'package:uniceps/core/errors/failure.dart';

class AccountUsecases {
  const AccountUsecases({required IAccountService repo}) : _repo = repo;

  final IAccountService _repo;

  Future<Either<Failure, Account>> getUserAccount() => _repo.getUserAccount();

  Future<Either<MembershipFailure, Membership>> getSubscriptionPlan() => _repo.getUserMembership();

  Future<Either<Failure, Plan>> getPlans() => _repo.getPlans();

  Future<Either<Failure, PaymentResponse>> buyPlan(PlanItem item) => _repo.buyPlan(item);

  Future<Either<MembershipFailure, Membership>> notifyNewMembership() => _repo.notifyNewMembership();

  Future<Either<Failure, Unit>> logout() => _repo.logout();

  Future<Either<Failure, Unit>> deleteAccount() => _repo.deleteAccount();
}
