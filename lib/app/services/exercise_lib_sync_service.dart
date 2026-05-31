import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/app/data/models/routine_models/exercise_dto.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/exercises_local_source.dart';
import 'package:uniceps/app/data/sources/remote/dal_routine/exercises_remote_source.dart';
import 'package:uniceps/app/services/app_configs_service.dart';
import 'package:uniceps/app/services/network_info.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/injection_dependency.dart';

class ExerciseLibSyncService {
  final IExercisesLocalSourceContract _exercisesLocalSource;
  final IExercisesRemoteSourceContract _exercisesRemoteSource;
  final NetworkInfo _networkInfo;
  final Logger _logger;

  ExerciseLibSyncService({
    required IExercisesLocalSourceContract exercisesLocalSource,
    required IExercisesRemoteSourceContract exercisesRemoteSource,
    required NetworkInfo networkInfo,
    required Logger logger,
  }) : _exercisesLocalSource = exercisesLocalSource,
       _exercisesRemoteSource = exercisesRemoteSource,
       _networkInfo = networkInfo,
       _logger = logger;

  Completer<int?>? isSynced;

  Future<Either<LibSyncFailure, int>> syncExercises() async {
    isSynced = null;
    isSynced = Completer();
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
        final lib = await _exercisesRemoteSource.getAllExercises(
          timestamp: latest,
          language: sl<AppConfigsService>().configs.exerciseLibLanguage.languageCode,
        );
        for (final e in lib) {
          final img = await _exercisesRemoteSource.getExerciseImage(e.apiId);
          await _exercisesLocalSource.saveExerciseImage(e.apiId, img);
        }
        await _exercisesLocalSource.writeExercises(lib);
        _logger.i('library update Done!');

        isSynced?.complete(localLib.length);
        return Right(localLib.length);
      } catch (e, s) {
        _logger.e('something went wrong!!', error: e, stackTrace: s);

        isSynced?.completeError(localLib.length);
        return Left(.libUnknown(currentTotalCount: localLib.length));
      }
    }
    // This condition is useless because this state will trigger libDownload event on App-Startup
    // so it's kind of impossible to meet.
    if (localLib.isEmpty) {
      _logger.i('Exercises Table is Empty');
      isSynced?.completeError(localLib.length);
      return Left(.libNotFound(currentTotalCount: localLib.length));
    }

    _logger.i('No Internet Connection');
    isSynced?.complete(localLib.length);
    return Left(.libOffline(currentTotalCount: localLib.length));
  }
}
