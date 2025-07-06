import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/account_entities/account.dart';
import 'package:uniceps/app/domain/classes/account_entities/subscription.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IAccountService {
  Future<Either<Failure, Account>> getUserAccount();
  Future<Either<Failure, Subscription>> getSubscriptionPlan();
}
