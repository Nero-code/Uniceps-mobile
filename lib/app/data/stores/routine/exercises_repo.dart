import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/app/data/models/routine_models/exercise_dto.dart';
import 'package:uniceps/app/data/models/routine_models/muscle_group_dto.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/exercises_local_source.dart';
import 'package:uniceps/app/data/sources/remote/dal_routine/exercises_remote_source.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_filter.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_tool.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';
import 'package:uniceps/app/domain/contracts/routine/i_exercises_contract.dart';
import 'package:uniceps/app/domain/helpers/result.dart';
import 'package:uniceps/app/services/network_info.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/helpers/exercise_details_result.dart';
import 'package:uniceps/core/logging/app_logger.dart';

class ExercisesRepo implements IExercisesContract {
  final IExercisesLocalSourceContract _localSource;
  final IExercisesRemoteSourceContract _remoteSource;
  final NetworkInfo _internet;
  final Logger _logger;

  final Map<String, List<Exercise>> allExercises = {};

  final List<Exercise> exercisesLib = [];
  final List<MuscleGroup> allGroups = [];
  final List<ExerciseTool> allTools = [];

  ExercisesRepo({
    required IExercisesLocalSourceContract localSource,
    required IExercisesRemoteSourceContract remoteSource,
    required NetworkInfo internet,
    required Logger logger,
  }) : _remoteSource = remoteSource,
       _localSource = localSource,
       _logger = logger,
       _internet = internet;

  @override
  Future<Either<Failure, bool>> checkExercises() async {
    try {
      final res = await _localSource.getExercises();
      if (res.isNotEmpty) {
        exercisesLib.clear();
        exercisesLib.addAll(res.map((e) => e.toEntity()).toList());
        extractFilters();
      }
      return Right(res.isNotEmpty);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> changeLibLanguage(String language) async {
    if (await _internet.hasConnection) {
      try {
        final res = await _remoteSource.getAllExercises(language: language);
        await for (final _ in downloadImages(res.map((e) => e.apiId).toList())) {}
        for (var e in res) {
          await _localSource.writeExercise(e);
        }
        exercisesLib.clear();
        exercisesLib.addAll(res.map((e) => e.toEntity()));

        return const Right(true);
      } catch (e, s) {
        return Left(NoInternetConnectionFailure(errMsg: '$e\n$s'));
      }
    } else {
      return Left(NoInternetConnectionFailure(errMsg: ''));
    }
  }

  Future<void> extractGroups() async {
    // Groups Extraction...
    for (final e in exercisesLib) {
      final group = MuscleGroup(muscleGroupCode: e.muscleGroupCode, muscleGroupName: e.muscleGroupName);
      if (allGroups.where((g) => g.muscleGroupCode == e.muscleGroupCode).isEmpty) allGroups.add(group);
    }

    // Exercise Filtering...
    for (final g in allGroups) {
      final matches = exercisesLib.where((e) => e.muscleGroupCode == g.muscleGroupCode).toList();
      allExercises.addAll({g.muscleGroupCode: matches});
    }
  }

  Future<void> extractFilters() async {
    // Groups Extraction...
    for (final e in exercisesLib) {
      if (allGroups.where((g) => g.muscleGroupCode == e.muscleGroupCode).isEmpty) {
        allGroups.add(MuscleGroup(muscleGroupCode: e.muscleGroupCode, muscleGroupName: e.muscleGroupName));
      }
      if (allTools.where((t) => t.toolCode == e.toolCode).isEmpty) {
        allTools.add(ExerciseTool(toolName: e.toolName, toolCode: e.toolCode));
      }
    }
  }

  @override
  Future<Either<Failure, List<Exercise>>> getExercisesLib() async {
    if (exercisesLib.isNotEmpty) return Right(exercisesLib);

    if (await _internet.hasConnection) {
      try {
        final res = await _remoteSource.getAllExercises();

        exercisesLib.clear();
        exercisesLib.addAll(res.map((e) => e.toEntity()));
        return Right(exercisesLib);
      } catch (e) {
        return Left(ServerFailure(errMsg: e.toString()));
      }
    }
    return Left(OfflineFailure(errorMessage: ""));
  }

  @override
  Future<Either<Failure, Unit>> saveExercisesLib(List<Exercise> lib) async {
    try {
      for (final e in lib) {
        await _localSource.writeExercise(ExerciseDto.fromEntity(e));
      }
      return const Right(unit);
    } catch (e, s) {
      _logger.e('Error in saving exercises lib!', error: e, stackTrace: s);
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ExerciseFilter>> getExerciseFilters() async {
    return Right(ExerciseFilter(groups: allGroups, tools: allTools));
  }

  @override
  Future<Either<Failure, List<Exercise>>> getExercisesByFilter(ExerciseFilter filter) async {
    final filteredList = exercisesLib.where((e) {
      final filterGroup = filter.groups.isNotEmpty
          ? filter.groups.where((g) => e.muscleGroupCode == g.muscleGroupCode).isNotEmpty
          : true;
      final filterTools = filter.tools.isNotEmpty
          ? filter.tools.where((t) => e.toolCode == t.toolCode).isNotEmpty
          : true;
      return (filterGroup & filterTools);
    }).toList();
    return Right(filteredList);
  }

  @override
  Future<Either<Failure, List<Exercise>>> getExercisesByGroup(MuscleGroup group) async {
    if (allExercises.containsKey(group.muscleGroupCode)) return Right(allExercises[group.muscleGroupCode]!);
    if (await _internet.hasConnection) {
      try {
        final res = await _remoteSource.getExercisesByGroup(MuscleGroupDto.fromEntity(group));
        final augRes = res.map((ex) => ex.copyWith(muscleGroupName: group.muscleGroupName));
        allExercises.addAll({group.muscleGroupCode: augRes.map((r) => r.toEntity()).toList()});
        return Right(allExercises[group.muscleGroupCode]!);
      } catch (e) {
        return Left(ServerFailure(errMsg: e.toString()));
      }
    }
    return Left(OfflineFailure(errorMessage: "offline"));
  }

  @override
  Future<Either<Failure, List<MuscleGroup>>> getExerciseGroups() async {
    if (allGroups.isNotEmpty) return Right(allGroups);
    if (await _internet.hasConnection) {
      try {
        final res = await _remoteSource.getExerciseGroups();
        allGroups.addAll(res.map((r) => r.toEntity()));
        return Right(allGroups);
      } catch (e) {
        return Left(ServerFailure(errMsg: e.toString()));
      }
    }
    return Left(OfflineFailure(errorMessage: ""));
  }

  @override
  Stream<Result<double, Failure>> downloadImages(List<String> ids) async* {
    try {
      // Get all images from api.
      for (final id in ids) {
        if (await _localSource.containsImage(id)) continue;
        final img = await _remoteSource.getExerciseImage(id);
        await _localSource.saveExerciseImage(id, img);

        // 0 -> length =============== 0% -> 50%
        final progress = (ids.indexOf(id) + 1) / (2 * ids.length);
        yield Result(data: progress, error: null);
      }
      // When complete save exercises in database.
      for (final e in exercisesLib) {
        await _localSource.writeExercise(ExerciseDto.fromEntity(e));

        // length -> 2 * length  ===== 50% -> 100%
        final progress = (exercisesLib.indexOf(e) + 1 + exercisesLib.length) / (2 * exercisesLib.length);
        yield Result(data: progress, error: null);
      }
      // yield Result(data: 1, error: null); // 100%
    } catch (e) {
      yield Result(data: 0, error: NoInternetConnectionFailure(errMsg: ''));
    }
    return;
  }

  @override
  Future<Either<Failure, ExerciseDetailsResult>> getExerciseDetails(String id) async {
    try {
      final ex = exercisesLib.firstWhere((e) => e.apiId == id);
      final similars = exercisesLib.where((e) => e.muscleHeadCode == ex.muscleHeadCode && e.apiId != ex.apiId).toList();
      return Right(ExerciseDetailsResult(exercise: ex, similars: similars));
    } catch (e, s) {
      logger.e('getExerciseDetails: $id', error: e, stackTrace: s);
      return Left(DatabaseFailure(errorMsg: ''));
    }
  }
}
