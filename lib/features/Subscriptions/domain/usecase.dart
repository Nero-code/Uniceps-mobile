import 'package:dartz/dartz.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Subscriptions/domain/repo.dart';

class SubscriptionUsecases {
  final SubscriptionRepo repo;
  SubscriptionUsecases({required this.repo});

  Future<Either<Failure, Unit>> getSubs() async {
    return await repo.getSubscriptions();
  }
}
