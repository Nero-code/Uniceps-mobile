import 'package:dartz/dartz.dart';
import 'package:uniceps/app/data/models/routine_models/extensions.dart';
import 'package:uniceps/app/data/models/routine_models/routine_dto.dart';
import 'package:uniceps/app/data/models/routine_result.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_management_local_source.dart';
import 'package:uniceps/app/data/sources/services/import/file_parse_service.dart';
import 'package:uniceps/app/data/sources/services/import/unifile.dart';
import 'package:uniceps/app/data/sources/services/media_helper.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_heat.dart';
import 'package:uniceps/app/domain/contracts/routine/i_routine_with_heat_contract.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/core/errors/failure.dart';

class RoutineWithHeatRepo implements IRoutineWithHeatContract {
  final IRoutineManagementLocalSourceContract _localSource;
  final FileParseService _fileParseService;
  final MediaHelper _mediaHelper;

  final List<({Routine routine, RoutineHeat heat})> routines = [];

  RoutineWithHeatRepo({
    required IRoutineManagementLocalSourceContract localSource,
    required FileParseService fileParseService,
    required MediaHelper mediaHelper,
  })  : _localSource = localSource,
        _fileParseService = fileParseService,
        _mediaHelper = mediaHelper;

  @override
  Future<Either<Failure, List<({RoutineHeat heat, Routine routine})>>> getAllRoutinesWithHeat() async {
    try {
      final res = await _localSource.getAllRoutinesWithHeat();

      routines.clear();
      routines.addAll(res.map((e) => (routine: e.routine.toEntity(), heat: e.heat)));
      return Right(routines);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: ""));
    }
  }

  @override
  Future<Either<Failure, List<({RoutineHeat heat, Routine routine})>>> createRoutine(String routineName) async {
    try {
      final res = await _localSource.createRoutine(routineName);
      routines.add((routine: res.toEntity(), heat: RoutineHeat.cold(res.name)));
      return Right(routines);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<({RoutineHeat heat, Routine routine})>>> updateRoutine(Routine routine) async {
    try {
      await _localSource.updateRoutine(routine.toDto());

      for (int i = 0; i < routines.length; i++) {
        if (routines[i].routine.id == routine.id) {
          routines.removeAt(i);
          routines.insert(i, (routine: routine, heat: routines[i].heat));
          break;
        }
      }
      return Right(routines);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: ""));
    }
  }

  @override
  Future<Either<Failure, List<({RoutineHeat heat, Routine routine})>>> setCurrentRoutine(Routine routine) async {
    try {
      await _localSource.setCurrentRoutine(routine.toDto());

      for (int i = 0; i < routines.length; i++) {
        if (routines[i].routine.isCurrent) {
          routines[i] = (routine: routines[i].routine.copyWith(isCurrent: false), heat: routines[i].heat);
        } else if (routines[i].routine.id == routine.id) {
          routines[i] = (routine: routine.copyWith(isCurrent: true), heat: routines[i].heat);
        }

        // This line is the result of reducing the above lines (but has performance issues!).
        //
        //   `routines[i]= routines[i].copyWith(isCurrent: routines[i].id == routine.id);`
      }

      return Right(routines);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<({RoutineHeat heat, Routine routine})>>> deleteRoutine(Routine routine) async {
    try {
      await _localSource.deleteRoutine(routine.toDto());
      routines.removeWhere((tuple) => tuple.routine.id == routine.id);
      return Right(routines);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: ""));
    }
  }

  @override
  Stream<RoutineResult> importRoutineFromFile() async* {
    try {
      final file = await _fileParseService.readFile();
      if (file.meta.fileType != FileType.routine) throw ParserMismatchExeption();
      final routine = RoutineDto.fromJson(file.data);
      // final routine = await _fileParseService.extract<RoutineDto>(file, RoutineDto.fromJson);

      final dl = routine.daysDto.length;
      final il = routine.daysDto.map((a) => a.items.length).reduce((a, b) => a + b);
      final sl = routine.daysDto.expand((d) => d.items.map((i) => i.setsDto.length)).reduce((a, b) => a + b);
      final imgs = routine.daysDto.expand((day) => day.items.map((e) => e.exerciseV2Dto.imageUrl)).toList();
      final totalProgress = dl + il + sl + imgs.length;
      double sum = 0;

      yield const RoutineResult(progress: 0, stage: Stage.start);
      await for (final _ in _mediaHelper.saveImages(imgs)) {
        sum += 1 / totalProgress;
        yield RoutineResult(progress: sum, stage: Stage.images);
      }
      await for (final stage in _localSource.insertFullRoutine(routine)) {
        sum += 1 / totalProgress;
        yield RoutineResult(progress: sum, stage: stage);
      }
      yield const RoutineResult(progress: 1, stage: Stage.done);
      return;
    } on NoInternetException {
      yield const RoutineResult(
        progress: -1,
        stage: Stage.error,
        error: FileParseFailure.fOffline(),
      );
    } on OfflineFailure {
      yield const RoutineResult(
        progress: -1,
        stage: Stage.error,
        error: FileParseFailure.fOffline(),
      );
    } on ParserMismatchExeption {
      yield const RoutineResult(
        progress: -1,
        stage: Stage.error,
        error: FileParseFailure.parserMismatch(),
      );
    } on CorruptedFileException {
      yield const RoutineResult(
        progress: -1,
        stage: Stage.error,
        error: FileParseFailure.corruptedFile(),
      );
    } on NoFileSelectedException {
      yield const RoutineResult(
        progress: -1,
        stage: Stage.error,
        error: FileParseFailure.noFileSelected(),
      );
    } on UnsupportedException {
      yield const RoutineResult(
        progress: -1,
        stage: Stage.error,
        error: FileParseFailure.unsupportedVersion(),
      );
    } catch (e) {
      yield const RoutineResult(
        progress: -1,
        stage: Stage.error,
        error: FileParseFailure.fOffline(),
      );
    }
  }
}
