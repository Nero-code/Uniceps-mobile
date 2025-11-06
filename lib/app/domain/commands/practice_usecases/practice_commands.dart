import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_log.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_session.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';
import 'package:uniceps/app/domain/contracts/practice_repo/practice_contract.dart';
import 'package:uniceps/core/errors/failure.dart';

class PracticeCommands {
  final IPracticeContract _repo;
  const PracticeCommands({required IPracticeContract repo}) : _repo = repo;

  Future<Either<Failure, Tuple2<Routine, int?>>> getCurrentRoutine() async =>
      await _repo.getCurrentRoutine();
  Future<Either<Failure, RoutineDay>> getdayItems(int dayId) async =>
      await _repo.getDayItems(dayId);

  Future<Either<Failure, TSession>> getLastActiveSession() async =>
      await _repo.getPreviousSession();

  Future<Either<Failure, TSession>> startTrainingSession(int dayId) async =>
      await _repo.startTrainingSession(dayId);

  Future<Either<Failure, TSession>> logSetComplete(
          TLog log, double progress) async =>
      await _repo.logSetComplete(log, progress);

  Future<Either<Failure, Unit>> finishTrainingSession(TSession session) async =>
      await _repo.finishTrainingSession(session);
}
