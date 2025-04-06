class RoutineSet {
  const RoutineSet({
    required this.id,
    required this.apiId,
    required this.routineItemId,
    required this.index,
    required this.reps,
    required this.weight,
  });

  final int? id, apiId;
  final int routineItemId, index, reps;
  final double? weight;
}
