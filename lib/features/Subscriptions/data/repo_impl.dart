import 'package:dartz/dartz.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Subscriptions/data/sources.dart';
import 'package:uniceps/features/Subscriptions/domain/repo.dart';

class SubscriptionRepoImpl implements SubscriptionRepo {
  final LocalSubsSource local;
  final RemoteSubsSource remote;
//final InternetConnectionChecker checker;

  SubscriptionRepoImpl({
    required this.local,
    required this.remote,
  });

  @override
  Future<Either<Failure, Unit>> getSubscriptions() {
    // TODO: implement getSubscriptions
    throw UnimplementedError();
  }
}
