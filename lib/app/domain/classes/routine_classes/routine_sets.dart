class RoutineSet {
  const RoutineSet({
    required this.id,
    required this.apiId,
    required this.routineItemId,
    required this.version,
    required this.index,
    required this.reps,
    required this.isSynced,
  });

  final int? id, apiId;
  final int routineItemId, index, reps, version;
  final bool isSynced;

  RoutineSet copyWith({
    int? id,
    int? apiId,
    int? routineItemId,
    int? index,
    int? reps,
    int? version,
    bool? isSynced,
  }) =>
      RoutineSet(
          id: id ?? this.id,
          apiId: apiId ?? this.apiId,
          routineItemId: routineItemId ?? this.routineItemId,
          version: version ?? this.version,
          index: index ?? this.index,
          reps: reps ?? this.reps,
          isSynced: isSynced ?? this.isSynced);
}
