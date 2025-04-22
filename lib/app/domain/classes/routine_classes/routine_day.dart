import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';

class RoutineDay {
  const RoutineDay({
    this.id,
    this.apiId,
    required this.routineId,
    required this.name,
    required this.index,
    required this.exercises,
    this.version = 0,
    this.isSynced = false,
  });
  final int? id, apiId;
  final int index, routineId, version;
  final String name;
  final List<RoutineItem> exercises;
  final bool isSynced;

  RoutineDay copyWith({
    int? id,
    int? apiId,
    int? index,
    int? routineId,
    int? version,
    String? name,
    List<RoutineItem>? exercises,
    bool? isSynced,
  }) =>
      RoutineDay(
          id: id ?? this.id,
          apiId: apiId ?? this.apiId,
          routineId: routineId ?? this.routineId,
          version: version ?? this.version,
          name: name ?? this.name,
          index: index ?? this.index,
          exercises: exercises ?? this.exercises,
          isSynced: isSynced ?? this.isSynced);

  // id:        $id
  // apiId:     $apiId

  // routineId: $routineId
  // version:   $version
  // isSynced:  $isSynced
  @override
  String toString() {
    return """\n
  name:      $name
  index:     $index
""";
  }
}
