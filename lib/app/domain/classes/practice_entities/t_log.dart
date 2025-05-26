class TLog {
  final int? id;

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

  // TLog copywith({
  //   int? id,
  //   int? exerciseId,
  //   int? exerciseIndex,
  //   int? setIndex,
  //   int? reps,
  //   double? weight,
  //   DateTime? completedAt,
  //   int? apiId,
  //   int? version,
  //   bool? isSynced,
  // }) =>
  //     TLog(
  //       id: id ?? this.id,
  //       exerciseId: exerciseId ?? this.exerciseId,
  //       exerciseIndex: exerciseIndex ?? this.exerciseIndex,
  //       setIndex: setIndex ?? this.setIndex,
  //       reps: reps ?? this.reps,
  //       weight: weight ?? this.weight,
  //       completedAt: completedAt ?? this.completedAt,
  //       apiId: apiId ?? this.apiId,
  //       version: version ?? this.version,
  //       isSynced: isSynced ?? this.isSynced,
  //     );
}
