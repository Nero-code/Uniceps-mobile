import 'package:dartz/dartz.dart';
// import 'package:uniceps/app/domain/classes/profile_classes/attendence.dart';
import 'package:uniceps/app/domain/classes/profile_classes/gym.dart';
import 'package:uniceps/app/domain/classes/profile_classes/player_in_gym.dart';
// import 'package:uniceps/app/domain/classes/profile_classes/subscription.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IMyGymsService {
  Future<Either<Failure, List<Gym>>> getSubscribedToGyms();
  Future<Either<Failure, List<Gym>>> setSelectedGym(String gymId);

  Future<Either<Failure, PlayerInGym>> getPlayerInGym(
    String gymId,
    String pid,
  );

  // Future<Either<Failure, List<Subscription>>> getSubscriptions(
  //   String gymId,
  //   String pid,
  // );

  // Future<Either<Failure, List<Attendence>>> gymAttendence(
  //   String gymId,
  //   String pid,
  // );
}
