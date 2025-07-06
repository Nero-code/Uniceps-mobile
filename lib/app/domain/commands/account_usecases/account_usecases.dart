import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/account_entities/account.dart';
import 'package:uniceps/app/domain/classes/account_entities/subscription.dart';
import 'package:uniceps/app/domain/contracts/account/i_account_service.dart';
import 'package:uniceps/core/errors/failure.dart';

class AccountUsecases {
  const AccountUsecases({required IAccountService repo}) : _repo = repo;

  final IAccountService _repo;

  Future<Either<Failure, Account>> getUserAccount() async =>
      await _repo.getUserAccount();

  Future<Either<Failure, Subscription>> getSubscriptionPlan() async =>
      await _repo.getSubscriptionPlan();
}
