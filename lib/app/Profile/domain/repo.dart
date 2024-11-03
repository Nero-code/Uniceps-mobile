import 'package:dartz/dartz.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/app/Auth/data/models/player_model.dart';
import 'package:uniceps/app/Auth/services/enitites/player.dart';
import 'package:uniceps/app/Profile/domain/classes/attendence.dart';
import 'package:uniceps/app/Profile/domain/classes/measrument.dart';
import 'package:uniceps/app/Profile/domain/classes/player_in_gym.dart';
import 'package:uniceps/app/Profile/domain/classes/subscription.dart';
import 'package:uniceps/app/Profile/data/models/gym_model.dart';
import 'package:uniceps/app/Profile/domain/classes/gym.dart';

abstract class ProfileRepo {
  Future<Either<Failure, Player>> getProfileData();
  Future<Either<Failure, Player>> submitProfileData(PlayerModel playerModel,
      {required bool isCreate});
  Future<Either<Failure, List<Gym>>> getGyms();
  Future<void> saveGyms(List<GymModel> list);
  Future<Either<Failure, List<Measurement>>> getMeasurement();
  Future<Either<Failure, List<Subscription>>> getSubscriptions(
      String gymId, String pid);
  Future<Either<Failure, List<Attendence>>> gymAttendence(
      String gymId, String pid);
  Future<Either<Failure, PlayerInGym>> getPlayerInGym(String gymId, String pid);
}