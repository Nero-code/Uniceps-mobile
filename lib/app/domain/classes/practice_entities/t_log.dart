import 'package:equatable/equatable.dart';

class TLog extends Equatable {
  final int? id;
  final int sessionId;
  // Exercise Data
  final String exerciseId;
  final int exerciseIndex;

  // Set Data
  final int setIndex;
  final int reps;
  final int finishedReps;
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
    required this.finishedReps,
    required this.weight,
    required this.completedAt,
    required this.apiId,
    this.version = 0,
    this.isSynced = false,
  });

  TLog copyWith({double? weight, int? finishedReps, DateTime? completedAt}) => TLog(
    id: id,
    sessionId: sessionId,
    exerciseId: exerciseId,
    exerciseIndex: exerciseIndex,
    setIndex: setIndex,
    reps: reps,
    finishedReps: finishedReps ?? this.finishedReps,
    weight: weight ?? this.weight,
    completedAt: completedAt ?? this.completedAt,
    apiId: apiId ?? apiId,
    version: version,
    isSynced: isSynced,
  );

  @override
  List<Object?> get props => [
    id,
    sessionId,
    // Exercise Data
    exerciseId,
    exerciseIndex,

    // Set Data
    setIndex,
    reps,
    finishedReps,
    weight,
    completedAt,

    // For Syncing purposes
    apiId, version, isSynced,
  ];
}
