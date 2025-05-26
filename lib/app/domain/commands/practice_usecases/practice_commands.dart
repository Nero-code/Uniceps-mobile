import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_log.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_session.dart';
import 'package:uniceps/app/domain/contracts/practice_repo/practice_contract.dart';
import 'package:uniceps/core/errors/failure.dart';

class PracticeCommands {
  final IPracticeContract _repo;
  const PracticeCommands({required IPracticeContract repo}) : _repo = repo;

  Future<Either<Failure, TSession>> startTrainingSession() async =>
      await _repo.startTrainingSession();

  Future<Either<Failure, TLog>> logSetComplete(TLog log) async =>
      await _repo.logSetComplete(log);

  Future<Either<Failure, Unit>> finishTrainingSession(TSession session) async =>
      await _repo.finishTrainingSession(session);
}
