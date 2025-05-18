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
    // Get all previously stored muscle-groups
    final old = await _database.select(_database.exerciseGroups).get();

    if (old.isEmpty) {
      // if table is empty, insert all items into table.
      for (final g in groups) {
        await _database.into(_database.exerciseGroups).insert(
              ExerciseGroupsCompanion.insert(
                  apiId: g.apiId, arName: g.arGroupName, enName: g.enGroupName),
            );
      }
    } else {
      // if items were found then update old values.
      for (final g in groups) {
        // even if there's old values doesn't mean no new values are present.
        // that's why we check if the value is present.
        if (old.where((oldG) => g.apiId == oldG.apiId).isEmpty) {
          await _database
              .into(_database.exerciseGroups)
              .insert(ExerciseGroupsCompanion.insert(
                apiId: g.apiId,
                arName: g.arGroupName,
                enName: g.enGroupName,
              ));
        } else {
          await (_database.update(_database.exerciseGroups)
                ..where((f) => f.apiId.equals(g.apiId)))
              .write(ExerciseGroupsCompanion.custom(
                  apiId: Constant(g.apiId),
                  arName: Constant(g.arGroupName),
                  enName: Constant(g.enGroupName)));
        }
      }
    }
  }
}
