import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:pool/pool.dart';
import 'package:uniceps/app/data/models/routine_models/exercise_dto.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/exercises_local_source.dart';
import 'package:uniceps/app/data/sources/remote/dal_routine/exercises_remote_source.dart';
import 'package:uniceps/app/services/app_configs_service.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/logging/app_logger.dart';
import 'package:uniceps/injection_dependency.dart';

class ExerciseLibSyncService {
  final IExercisesLocalSourceContract _exercisesLocalSource;
  final IExercisesRemoteSourceContract _exercisesRemoteSource;

  ExerciseLibSyncService({
    required IExercisesLocalSourceContract exercisesLocalSource,
    required IExercisesRemoteSourceContract exercisesRemoteSource,
  }) : _exercisesLocalSource = exercisesLocalSource,
       _exercisesRemoteSource = exercisesRemoteSource;

  Completer<int?>? isSynced;

  // Future<Either<LibSyncFailure, int>> syncExercises() async {
  //   isSynced = null;
  //   isSynced = Completer();
  //   List<ExerciseDto> localLib = [];
  //   DateTime? latest;
  //   try {
  //     localLib = await _exercisesLocalSource.getExercises();
  //     localLib.sort((a, b) => b.timestamp.compareTo(a.timestamp));
  //     latest = localLib.firstOrNull?.timestamp;
  //   } catch (e) {
  //     latest = null;
  //   }
  //
  //   try {
  //     final lib = await _exercisesRemoteSource.getAllExercises(
  //       timestamp: latest,
  //       language: sl<AppConfigsService>().configs.exerciseLibLanguage.languageCode,
  //     );
  //     final requestsPool = Pool(10);
  //     for (final e in lib) {
  //       requestsPool.withResource(() => _exercisesRemoteSource.getExerciseImage(e.apiId));
  //       final img = await _exercisesRemoteSource.getExerciseImage(e.apiId);
  //       await _exercisesLocalSource.saveExerciseImage(e.apiId, img);
  //     }
  //     await _exercisesLocalSource.writeExercises(lib);
  //     logger.i('library update Done!');
  //
  //     isSynced?.complete(localLib.length);
  //     return Right(localLib.length);
  //   } on ClientException {
  //     logger.i('No Internet Connection');
  //     isSynced?.complete(localLib.length);
  //     return const Left(.libOffline());
  //   } on NoContentException {
  //     isSynced?.complete(localLib.length);
  //     return Right(localLib.length);
  //   } catch (e, s) {
  //     logger.e('something went wrong!!', error: e, stackTrace: s);
  //
  //     isSynced?.completeError(localLib.length);
  //     return const Left(.libUnknown());
  //   }
  // }

  @Deprecated('Do Not Use this is experimental only')
  Stream<Either<LibSyncFailure, double>> resyncExercises() async* {
    isSynced = null;
    isSynced = Completer();
    List<ExerciseDto> localLib = [];
    DateTime? latest;

    localLib = await _exercisesLocalSource.getExercises();
    localLib.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    latest = localLib.firstOrNull?.timestamp;

    try {
      final updatedExercises = await _exercisesRemoteSource.getAllExercises(
        timestamp: latest,
        language: sl<AppConfigsService>().configs.exerciseLibLanguage.languageCode,
      );
      if (updatedExercises.isNotEmpty) {
        final needsImageIdsList = <String>[];

        for (final ex in updatedExercises) {
          final localMediaVersion = localLib.where((localEx) => localEx.apiId == ex.apiId).firstOrNull?.mediaVersion;
          if ((localMediaVersion ?? -1) < ex.mediaVersion) {
            needsImageIdsList.add(ex.apiId);
          }
        }

        // 2. Download concurrently using a Pool
        final pool = Pool(10); // Adjust concurrency (e.g., 5 to 10)
        int totalCount = updatedExercises.length + needsImageIdsList.length;
        int completedCount = 0;

        if (needsImageIdsList.isNotEmpty) {
          // We map each ID to a future that runs in the pool

          final downloadFutures = needsImageIdsList.map((id) {
            return pool.withResource(() async {
              try {
                final img = await _exercisesRemoteSource.getExerciseImage(id);
                await _exercisesLocalSource.saveExerciseImage(id, img);
                completedCount++;
              } catch (e) {
                logger.e('ExercisesRepo.downloadImages() :: Could not get image $id', error: e);
              }

              // You can't 'yield' from inside this closure, so we use a different approach
              // for progress if we want to yield for EVERY image.
            });
          });

          // To yield progress as each image finishes, we can use a StreamController
          // or simply wait for the pool to finish if high-granularity progress isn't critical.
          // However, to keep your 'async*' logic, we can do this:

          if (needsImageIdsList.isNotEmpty) {
            await for (final _ in Stream.fromFutures(downloadFutures)) {
              final progress = completedCount / totalCount;
              yield Right(progress);
            }
          }
        }

        // 3. Save exercises in database
        for (int i = 0; i < updatedExercises.length; i++) {
          await _exercisesLocalSource.writeExercise(updatedExercises[i]);
          final progress = (needsImageIdsList.length + i + 1) / totalCount;
          yield Right(progress);
        }
      } else {
        yield const Left(.libUpToDate());
      }
    } catch (e) {
      logger.e('resyncExercises', error: e);
      yield const Left(LibSyncFailure.libOffline());
    }
  }
}
