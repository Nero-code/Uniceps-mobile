import 'package:dartz/dartz.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Auth/data/models/player_model.dart';
import 'package:uniceps/features/Auth/services/enitites/player.dart';
import 'package:uniceps/features/Profile/domain/entities/attendence.dart';
import 'package:uniceps/features/Profile/domain/entities/handshake.dart';
import 'package:uniceps/features/Profile/domain/entities/measrument.dart';
import 'package:uniceps/features/Profile/domain/entities/subscription.dart';
import 'package:uniceps/features/Profile/data/models/gym_model.dart';
import 'package:uniceps/features/Profile/domain/entities/gym.dart';

abstract class ProfileRepo {
  Future<Either<Failure, Player>> getProfileData();
  Future<Either<Failure, Player>> submitProfileData(PlayerModel playerModel,
      {required bool isCreate});
  Future<Either<Failure, List<Gym>>> getGyms();
  Future<Either<Failure, List<Gym>>> getSubscribedToGyms();
  Future<void> saveGyms(List<GymModel> list);
  Future<Either<Failure, List<Measurement>>> getMeasurement();
  Future<Either<Failure, List<Subscription>>> getSubscriptions(String gymId);
  // Future<Either<Failure, Unit>> changeLanguage();
  Future<Either<Failure, List<HandShake>>> getAllGymHandshake();
  Future<Either<Failure, List<Attendence>>> gymAttendence(String gymId);
}
