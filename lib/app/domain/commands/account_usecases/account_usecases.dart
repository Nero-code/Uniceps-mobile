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

  Future<Either<Failure, Account>> getUserAccount() async =>
      await _repo.getUserAccount();

  Future<Either<MembershipFailure, Membership>> getSubscriptionPlan() async =>
      await _repo.getUserMembership();

  Future<Either<Failure, Plan>> getPlans() async => await _repo.getPlans();

  Future<Either<Failure, PaymentResponse>> buyPlan(PlanItem item) async =>
      await _repo.buyPlan(item);

  Future<Either<Failure, Unit>> deleteAccount() async =>
      await _repo.deleteAccount();
}
