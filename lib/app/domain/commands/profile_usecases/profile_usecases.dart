import 'package:dartz/dartz.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/app/data/models/auth_models/player_model.dart';
import 'package:uniceps/app/domain/classes/auth_enitites/player.dart';
import 'package:uniceps/app/domain/classes/profile_classes/attendence.dart';
import 'package:uniceps/app/domain/classes/profile_classes/measrument.dart';
import 'package:uniceps/app/domain/classes/profile_classes/player_in_gym.dart';
import 'package:uniceps/app/domain/contracts/profile_repo.dart';
import 'package:uniceps/app/domain/classes/profile_classes/subscription.dart';
import 'package:uniceps/app/domain/classes/profile_classes/gym.dart';

class ProfileUsecases {
  final ProfileRepo repo;
  ProfileUsecases({required this.repo});

  Future<Either<Failure, List<Measurement>>> getMeasurement() async {
    return await repo.getMeasurement();
  }

  Future<Either<Failure, Player>> getProfileData() async {
    return await repo.getProfileData();
  }

  Future<Either<Failure, Player>> submitProfileData(PlayerModel playerModel,
      {required bool isCreate}) async {
    return await repo.submitProfileData(playerModel, isCreate: isCreate);
  }

  Future<Either<Failure, List<Gym>>> getGyms() async {
    return await repo.getGyms();
  }

  Future<Either<Failure, List<Subscription>>> getSubs(
      String gymId, String pid) async {
    return await repo.getSubscriptions(gymId, pid);
  }

  Future<Either<Failure, List<Attendence>>> gymAttendance(
      String gymId, String pid) async {
    return await repo.gymAttendence(gymId, pid);
  }

  Future<Either<Failure, PlayerInGym>> getPlayerInGym(
      String gymId, String pid) async {
    return await repo.getPlayerInGym(gymId, pid);
  }
}
