class TLog {
  final int? id;
  final int sessionId;
  // Exercise Data
  final int exerciseId;
  final int exerciseIndex;

  // Set Data
  final int setIndex;
  final int reps;
  final double weight;
  final DateTime completedAt;

  // For Syncing purposes
  final int? apiId;
  final int version;
  final bool isSynced;

  const TLog({
    required this.id,
    required this.sessionId,
    required this.exerciseId,
    required this.exerciseIndex,
    required this.setIndex,
    required this.reps,
    required this.weight,
    required this.completedAt,
    required this.apiId,
    this.version = 0,
    this.isSynced = false,
  });

  TLog copywith({
    double? weight,
    DateTime? completedAt,
  }) =>
      TLog(
        id: id,
        sessionId: sessionId,
        exerciseId: exerciseId,
        exerciseIndex: exerciseIndex,
        setIndex: setIndex,
        reps: reps,
        weight: weight ?? this.weight,
        completedAt: completedAt ?? this.completedAt,
        apiId: apiId ?? apiId,
        version: version,
        isSynced: isSynced,
      );
}
