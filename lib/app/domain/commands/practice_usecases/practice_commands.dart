import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_log.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_session.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_heat.dart';
import 'package:uniceps/app/domain/contracts/practice/practice_contract.dart';
import 'package:uniceps/core/errors/failure.dart';

class PracticeCommands {
  final IPracticeContract _repo;
  const PracticeCommands({required IPracticeContract repo}) : _repo = repo;

  Future<Either<Failure, Tuple2<Routine, int?>>> getCurrentRoutine() => _repo.getCurrentRoutine();
  Future<Either<Failure, Tuple2<Routine, RoutineHeat?>>> getCurrentRoutineWithHeat() =>
      _repo.getCurrentRoutineWithHeat();

  Future<Either<Failure, RoutineDay>> getdayItems(int dayId) => _repo.getDayItems(dayId);
  Future<Either<Failure, TSession>> getLastActiveSession() => _repo.getPreviousSession();
  Future<Either<Failure, TSession>> startTrainingSession(int dayId, String dayName) =>
      _repo.startTrainingSession(dayId, dayName);
  Future<Either<Failure, TSession>> logSetComplete(TLog log, double progress) => _repo.logSetComplete(log, progress);

  Future<Either<Failure, Unit>> finishTrainingSession(TSession session, bool full) =>
      _repo.finishTrainingSession(session, full);
}
