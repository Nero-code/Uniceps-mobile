import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/profile_classes/gym.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IGymsService {
  Future<Either<Failure, List<Gym>>> getAllGyms();
  Future<Either<Failure, List<Gym>>> getMyGyms();
  Future<Either<Failure, List<Gym>>> getRestGyms();
  Future<Either<Failure, List<Gym>>> selectGym(String gymId);
}
