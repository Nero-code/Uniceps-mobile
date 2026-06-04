import 'package:uniceps/app/domain/classes/routine_classes/exercise.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';

class RoutineItem {
  final int? id, apiId;
  final int dayId, index, version;
  final Exercise exercise;
  final List<RoutineSet> sets;
  final bool isSynced;
  final String? description;

  const RoutineItem({
    required this.id,
    required this.apiId,
    required this.dayId,
    required this.index,
    required this.version,
    required this.exercise,
    required this.sets,
    required this.isSynced,
    required this.description,
  });

  RoutineItem copyWith({
    int? id,
    int? apiId,
    int? dayId,
    int? index,
    Exercise? exercise,
    List<RoutineSet>? sets,
    String? description,
    bool removeDescription = false,
    int? version,
    bool? isSynced,
  }) => RoutineItem(
    id: id ?? this.id,
    apiId: apiId ?? this.apiId,
    dayId: dayId ?? this.dayId,
    index: index ?? this.index,
    exercise: exercise ?? this.exercise,
    sets: sets ?? this.sets,
    description: removeDescription ? null : description ?? this.description,
    version: version ?? this.version,
    isSynced: isSynced ?? this.isSynced,
  );
}
