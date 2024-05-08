import 'package:dartz/dartz.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Auth/services/enitites/player.dart';
import 'package:uniceps/features/Profile/domain/entities/measrument.dart';
import 'package:uniceps/features/Profile/domain/entities/subscription.dart';
import 'package:uniceps/features/Profile/data/models/gym_model.dart';
import 'package:uniceps/features/Profile/domain/entities/gym.dart';

abstract class ProfileRepo {
  Future<Either<Failure, Player>> getProfileData();
  Future<Either<Failure, List<Gym>>> getGyms();
  Future<void> saveGyms(List<GymModel> list);
  Future<Either<Failure, List<Measurement>>> getMeasurement(String gymId);
  Future<Either<Failure, List<Subscription>>> getSubscriptions(String gymId);
  Future<Either<Failure, Unit>> changeLanguage();
}
