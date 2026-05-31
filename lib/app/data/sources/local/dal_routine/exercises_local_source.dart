import 'package:drift/drift.dart';
import 'package:uniceps/app/data/models/routine_models/exercise_dto.dart';
import 'package:uniceps/app/data/models/routine_models/muscle_group_dto.dart';
import 'package:uniceps/app/data/services/media_helper.dart';
import 'package:uniceps/app/data/sources/local/database.dart';

abstract class IExercisesLocalSourceContract {
  Future<List<ExerciseDto>> getExercises();
  Future<List<ExerciseDto>> getExercisesByGroup(String groupCode);
  Future<void> saveExerciseImage(String exId, Uint8List bitmap);

  Future<void> writeExercise(ExerciseDto e);
  Future<void> writeExercises(List<ExerciseDto> exercises);

  Future<bool> containsImage(String id);

  Future<List<MuscleGroupDto>> getMuscleGroups();
}

class ExercisesLocalSource implements IExercisesLocalSourceContract {
  final AppDatabase _appDatabase;
  final MediaHelper _mediaHelper;

  const ExercisesLocalSource({required AppDatabase appDatabase, required MediaHelper mediaHelper})
    : _appDatabase = appDatabase,
      _mediaHelper = mediaHelper;

  @override
  Future<List<ExerciseDto>> getExercises() async {
    final list = <ExerciseDto>[];
    final exercises = await _appDatabase.select(_appDatabase.exercises).get();

    for (final e in exercises) {
      final img = await _mediaHelper.getImage(e.apiId);
      list.add(ExerciseDto.fromTable(e, e.apiId, img));
    }
    return list;
  }

  @override
  Future<List<ExerciseDto>> getExercisesByGroup(String groupCode) async {
    final res = await (_appDatabase.select(
      _appDatabase.exercises,
    )..where((tbl) => tbl.muscleGroupCode.equals(groupCode))).get();
    return res.map((e) => ExerciseDto.fromTable(e, null, null)).toList();
  }

  @override
  Future<void> saveExerciseImage(String exId, Uint8List bitmap) async {
    await _mediaHelper.addImage(exId, bitmap);
  }

  @override
  Future<void> writeExercise(ExerciseDto e) async {
    await writeExercises([e]);
  }

  @override
  Future<void> writeExercises(List<ExerciseDto> exercises) async {
    await _appDatabase.batch((batch) {
      batch.insertAllOnConflictUpdate(
        _appDatabase.exercises,
        exercises.map(
          (e) => ExercisesCompanion.insert(
            apiId: e.apiId,
            name: e.name,
            imageName: Value(e.imageUrl),
            muscleGroupCode: e.muscleGroupCode,
            muscleGroupName: e.muscleGroupName,
            muscleHeadCode: e.muscleHeadCode,
            muscleHeadName: e.muscleHeadName,
            laterals: e.laterals,
            toolCode: e.toolCode,
            toolName: e.toolName,
            description: Value(e.description),
            auxMuscle1: Value(e.auxMuscle1),
            auxMuscle3: Value(e.auxMuscle3),
            auxMuscle2: Value(e.auxMuscle2),
            timestamp: Value(e.timestamp),
          ),
        ),
      );
    });
  }

  @override
  Future<bool> containsImage(String id) async => _mediaHelper.containsImage(id);

  @override
  Future<List<MuscleGroupDto>> getMuscleGroups() async {
    final res = await _appDatabase.select(_appDatabase.exercises).get();
    final List<MuscleGroupDto> groups = [];
    for (final e in res) {
      if (groups.where((g) => g.muscleGroupCode == e.muscleGroupCode).isEmpty) {
        groups.add(MuscleGroupDto(muscleGroupCode: e.muscleGroupCode, muscleGroupName: e.muscleGroupName));
      }
    }
    return groups;
  }
}
