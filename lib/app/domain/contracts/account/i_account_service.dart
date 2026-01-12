import 'package:dartz/dartz.dart';
import 'package:uniceps/app/data/models/account_models/payment_response.dart';
import 'package:uniceps/app/domain/classes/account_entities/account.dart';
import 'package:uniceps/app/domain/classes/account_entities/membership.dart';
import 'package:uniceps/app/domain/classes/account_entities/plan.dart';
import 'package:uniceps/app/domain/classes/account_entities/plan_item.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IAccountService {
  Future<Either<Failure, Account>> getUserAccount();
  Future<Either<MembershipFailure, Membership>> getUserMembership();

  Future<Either<Failure, Plan>> getPlans();
  Future<Either<Failure, PaymentResponse>> buyPlan(PlanItem item);
  Future<Either<MembershipFailure, Membership>> notifyNewMembership();

  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, Unit>> deleteAccount();
}
