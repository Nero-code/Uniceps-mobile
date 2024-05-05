import 'package:dartz/dartz.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Auth/services/enitites/player.dart';
import 'package:uniceps/features/Profile/domain/measrument.dart';
import 'package:uniceps/features/Profile/domain/repo.dart';
import 'package:uniceps/features/Profile/domain/subscription.dart';

class ProfileUsecases {
  final ProfileRepo repo;
  ProfileUsecases({required this.repo});

  Future<Either<Failure, Unit>> changeLanguage() async {
    return await repo.changeLanguage();
  }

  Future<Either<Failure, List<Measurement>>> getMeasurement() async {
    return await repo.getMeasurement();
  }

  Future<Either<Failure, Player>> getProfileData() async {
    return await repo.getProfileData();
  }

  Future<Either<Failure, List<Subscription>>> getSubs() async {
    return await repo.getSubscriptions();
  }
}
