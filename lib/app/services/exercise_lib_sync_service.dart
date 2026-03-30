import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/app/data/models/routine_models/exercise_dto.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/exercises_local_source.dart';
import 'package:uniceps/app/data/sources/remote/dal_routine/exercises_remote_source.dart';
import 'package:uniceps/app/services/network_info.dart';
import 'package:uniceps/core/errors/failure.dart';

class ExerciseLibSyncService {
  final IExercisesLocalSourceContract _exercisesLocalSource;
  final IExercisesRemoteSourceContract _exercisesRemoteSource;
  final NetworkInfo _networkInfo;
  final Logger _logger;

  const ExerciseLibSyncService({
    required IExercisesLocalSourceContract exercisesLocalSource,
    required IExercisesRemoteSourceContract exercisesRemoteSource,
    required NetworkInfo networkInfo,
    required Logger logger,
  }) : _exercisesLocalSource = exercisesLocalSource,
       _exercisesRemoteSource = exercisesRemoteSource,
       _networkInfo = networkInfo,
       _logger = logger;

  Future<Either<LibSyncFailure, Unit>> syncExercises() async {
    List<ExerciseDto> localLib = [];
    DateTime? latest;
    try {
      localLib = await _exercisesLocalSource.getExercises();
      latest = (localLib..sort((a, b) => b.timestamp.compareTo(a.timestamp))).firstOrNull?.timestamp;
    } catch (e) {
      latest = null;
    }

    if (await _networkInfo.hasConnection) {
      try {
        final lib = await _exercisesRemoteSource.getAllExercises(latest);
        for (final e in lib) {
          final img = await _exercisesRemoteSource.getExerciseImage(e.apiId);
          await _exercisesLocalSource.saveExerciseImage(e.apiId, img);
          await _exercisesLocalSource.writeExercise(e);
        }
        _logger.i('library update Done!');
        return const Right(unit);
      } catch (e, s) {
        _logger.e('something went wrong!!', error: e, stackTrace: s);
        return Left(.libUnknown());
      }
    } else {
      if (localLib.isEmpty) {
        _logger.i('Exercises Table is Empty');
        return Left(.libNotFound());
      }
    }
    _logger.i('No Internet Connection');
    return Left(.libOffline());
  }
}
