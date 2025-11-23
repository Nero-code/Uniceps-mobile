import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_log.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_session.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_heat.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IPracticeContract {
  Future<Either<Failure, Tuple2<Routine, int?>>> getCurrentRoutine();
  Future<Either<Failure, Tuple2<Routine, RoutineHeat?>>> getCurrentRoutineWithHeat();

  Future<Either<Failure, RoutineDay>> getDayItems(int dayId);

  Future<Either<Failure, TSession>> getPreviousSession();
  Future<Either<Failure, TSession>> startTrainingSession(int dayId, String dayName);
  Future<Either<Failure, TSession>> logSetComplete(TLog log, double progress);
  Future<Either<Failure, Unit>> finishTrainingSession(TSession session, bool full);
}
