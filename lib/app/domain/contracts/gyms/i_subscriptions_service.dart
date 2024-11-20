import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/profile_classes/subscription.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class ISubscriptionsService {
  Future<Either<Failure, List<Subscription>>> getSubscriptions(
      String gymId, String pid);
}
