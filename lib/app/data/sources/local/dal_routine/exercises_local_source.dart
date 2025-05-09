import 'package:drift/drift.dart';
import 'package:uniceps/app/data/models/routine_models/muscle_group_dto.dart';
import 'package:uniceps/app/data/sources/local/database.dart';

abstract class IExercisesLocalSourceContract {
  Future<void> saveMuscleGroups(List<MuscleGroupDto> groups);
}

class ExercisesLocalSource implements IExercisesLocalSourceContract {
  final AppDatabase _database;

  const ExercisesLocalSource({required AppDatabase database})
      : _database = database;
  @override
  Future<void> saveMuscleGroups(List<MuscleGroupDto> groups) async {
    for (final g in groups) {
      await _database.into(_database.exerciseGroups).insert(
            ExerciseGroupsCompanion.insert(
                apiId: g.apiId, arName: g.arGroupName, enName: g.enGroupName),
            onConflict: DoUpdate(
              (old) => ExerciseGroupsCompanion.custom(
                id: old.id,
                apiId: Constant(g.apiId),
                arName: Constant(g.arGroupName),
                enName: Constant(g.enGroupName),
              ),
            ),
          );
    }
  }
}
