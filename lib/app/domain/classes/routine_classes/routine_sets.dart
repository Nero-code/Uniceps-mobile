class RoutineSet {
  const RoutineSet({
    required this.id,
    required this.apiId,
    required this.routineItemId,
    required this.version,
    required this.index,
    required this.reps,
    required this.weight,
    required this.isSynced,
  });

  final int? id, apiId;
  final int routineItemId, index, reps, version;
  final double? weight;
  final bool isSynced;
}
