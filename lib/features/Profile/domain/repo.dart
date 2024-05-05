import 'package:dartz/dartz.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/features/Auth/services/enitites/player.dart';
import 'package:uniceps/features/Profile/domain/measrument.dart';
import 'package:uniceps/features/Profile/domain/subscription.dart';

abstract class ProfileRepo {
  Future<Either<Failure, Player>> getProfileData();
  Future<Either<Failure, List<Measurement>>> getMeasurement();
  Future<Either<Failure, List<Subscription>>> getSubscriptions();
  Future<Either<Failure, Unit>> changeLanguage();
}
