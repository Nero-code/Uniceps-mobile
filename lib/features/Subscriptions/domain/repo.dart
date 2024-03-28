import 'package:dartz/dartz.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class SubscriptionRepo {
  Future<Either<Failure, Unit>> getSubscriptions();
}
