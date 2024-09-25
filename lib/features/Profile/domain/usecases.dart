import 'package:dartz/dartz.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Auth/data/models/player_model.dart';
import 'package:uniceps/features/Auth/services/enitites/player.dart';
import 'package:uniceps/features/Profile/domain/entities/attendence.dart';
import 'package:uniceps/features/Profile/domain/entities/handshake.dart';
import 'package:uniceps/features/Profile/domain/entities/measrument.dart';
import 'package:uniceps/features/Profile/domain/repo.dart';
import 'package:uniceps/features/Profile/domain/entities/subscription.dart';
import 'package:uniceps/features/Profile/domain/entities/gym.dart';

class ProfileUsecases {
  final ProfileRepo repo;
  ProfileUsecases({required this.repo});

  // Future<Either<Failure, Unit>> changeLanguage() async {
  //   return await repo.changeLanguage();
  // }

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

  Future<Either<Failure, List<Gym>>> getSubscribedToGyms() async {
    return await repo.getSubscribedToGyms();
  }

  Future<Either<Failure, List<Subscription>>> getSubs(String gymId) async {
    return await repo.getSubscriptions(gymId);
  }

  Future<Either<Failure, List<HandShake>>> getAllGymHandShake() async {
    return await repo.getAllGymHandshake();
  }

  Future<Either<Failure, List<Attendence>>> gymAttendance(String gymId) async {
    return await repo.gymAttendence(gymId);
  }
}
