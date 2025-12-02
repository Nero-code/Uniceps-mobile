import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uniceps/app/data/models/routine_models/muscle_group_dto.dart';
// import 'package:uniceps/app/data/sources/local/dal_routine/exercises_local_source.dart';
import 'package:uniceps/app/data/sources/remote/dal_routine/exercises_remote_source.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';
import 'package:uniceps/app/domain/contracts/routine/i_exercises_contract.dart';
import 'package:uniceps/core/errors/failure.dart';

class ExercisesRepo implements IExercisesContract {
  // final IExercisesLocalSourceContract _localSource;
  final IExercisesRemoteSourceContract _remoteSource;
  final InternetConnectionChecker _internet;

  final List<ExerciseV2> allExercises = [];

  ExercisesRepo(
      {
      // required IExercisesLocalSourceContract localSource,
      required IExercisesRemoteSourceContract remoteSource,
      required InternetConnectionChecker internet})
      : _remoteSource = remoteSource,
        // _localSource = localSource,
        _internet = internet;
  @override
  Future<Either<Failure, List<MuscleGroup>>> getExerciseGroups() async {
    if (await _internet.hasConnection) {
      try {
        final res = await _remoteSource.getExerciseGroups();
        // await _localSource.saveMuscleGroups(res);
        return Right(res.map((r) => r.toEntity()).toList());
      } catch (e) {
        return Left(ServerFailure(errMsg: e.toString()));
      }
    }
    return Left(OfflineFailure(errorMessage: ""));
  }

  @override
  Future<Either<Failure, List<ExerciseV2>>> getExercises() async {
    if (await _internet.hasConnection) {
      try {
        final res = await _remoteSource.getAllExercises();

        allExercises.clear();
        allExercises.addAll(res.map((r) => r.toEntity()).toList());
        return Right(allExercises);
      } catch (e) {
        return Left(ServerFailure(errMsg: e.toString()));
      }
    }
    return Left(OfflineFailure(errorMessage: ""));
  }

  @override
  Future<Either<Failure, List<ExerciseV2>>> getExercisesByFilter(String filter) async {
    if (await _internet.hasConnection) {
      try {
        final res = await _remoteSource.getExercisesByFilter(filter);
        return Right(res.map((r) => r.toEntity()).toList());
      } catch (e) {
        return Left(ServerFailure(errMsg: e.toString()));
      }
    }
    return Left(OfflineFailure(errorMessage: ''));
  }

  @override
  Future<Either<Failure, List<ExerciseV2>>> getExercisesByGroup(MuscleGroup group) async {
    if (await _internet.hasConnection) {
      try {
        final res = await _remoteSource.getExercisesByGroup(MuscleGroupDto.fromEntity(group));
        final augRes = res.map((ex) => ex.copywith(muscleGroupTranslations: group.muscleGroupTranslations));
        return Right(augRes.map((r) => r.toEntity()).toList());
      } catch (e) {
        return Left(ServerFailure(errMsg: e.toString()));
      }
    }
    return Left(OfflineFailure(errorMessage: "offline"));
  }
}
