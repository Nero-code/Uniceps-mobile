import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_log.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_session.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IPracticeContract {
  Future<Either<Failure, TSession>> getPreviousSession();
  Future<Either<Failure, TSession>> startTrainingSession();
  Future<Either<Failure, TLog>> logSetComplete(TLog log);
  Future<Either<Failure, Unit>> finishTrainingSession(TSession session);
}
