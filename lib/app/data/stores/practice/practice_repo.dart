import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_log.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_session.dart';
import 'package:uniceps/app/domain/contracts/practice_repo/practice_contract.dart';
import 'package:uniceps/core/errors/failure.dart';

class PracticeRepo implements IPracticeContract {
  @override
  Future<Either<Failure, TSession>> getPreviousSession() async {
    // TODO: implement getPreviousSession
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TSession>> startTrainingSession() async {
    // TODO: implement startTrainingSession
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TLog>> logSetComplete(TLog log) async {
    // TODO: implement logSetComplete
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> finishTrainingSession(TSession session) async {
    // TODO: implement finishTrainingSession
    throw UnimplementedError();
  }
}
