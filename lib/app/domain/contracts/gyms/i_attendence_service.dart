import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/profile_classes/attendence.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IAttendenceService {
  Future<Either<Failure, List<Attendence>>> gymAttendence(
      String gymId, String pid);
}
