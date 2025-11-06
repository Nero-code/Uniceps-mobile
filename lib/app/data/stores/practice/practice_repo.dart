import 'package:dartz/dartz.dart';
import 'package:uniceps/app/data/models/practice_models/extensions.dart';
import 'package:uniceps/app/data/models/practice_models/t_session_model.dart';
import 'package:uniceps/app/data/sources/local/dal_practice/t_session_local_source.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_log.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_session.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';
import 'package:uniceps/app/domain/contracts/practice_repo/practice_contract.dart';
import 'package:uniceps/core/errors/failure.dart';

class PracticeRepo implements IPracticeContract {
  PracticeRepo({required ITSessionLocalSourceContract localSource})
      : _localSource = localSource;
  final ITSessionLocalSourceContract _localSource;

  TSessionModel? _session;

  @override
  Future<Either<Failure, Tuple2<Routine, int?>>> getCurrentRoutine() async {
    try {
      final res = await _localSource.getCurrentRoutine();
      if (res.head != null) {
        return Right(Tuple2(res.head!.toEntity(), res.tail));
      } else {
        return const Left(EmptyCacheFailure(errorMessage: ""));
      }
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RoutineDay>> getDayItems(int dayId) async {
    try {
      final res = await _localSource.getDayItems(dayId);
      return Right(res.toEntity());
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TSession>> getPreviousSession() async {
    try {
      _session = await _localSource.getPreviousSession();

      if (_session != null) return Right(_session!);
      return const Left(EmptyCacheFailure(errorMessage: ""));
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TSession>> startTrainingSession(int dayId) async {
    try {
      _session = await _localSource.startTrainingSession(dayId);

      return Right(_session!);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TSession>> logSetComplete(
      TLog log, double progress) async {
    if (_session == null) {
      return const Left(EmptyCacheFailure(errorMessage: "Null TSession!!!"));
    }

    try {
      final res = await _localSource.logSet(log.asDto());

      final oldLogIndex = _session!.logs.indexWhere((e) => e.id! == res.id!);
      if (oldLogIndex == -1) {
        // if logs doesn't contain log, Then add it.
        _session!.logs.add(res);
      } else {
        // else update it.
        _session!.logs[oldLogIndex] = res;
      }

      return Right(_session!);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> finishTrainingSession(TSession session) async {
    try {
      await _localSource.finishTrainingSession(session.asDto());
      _session = null;
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }
}
