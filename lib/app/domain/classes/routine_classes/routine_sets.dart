import 'package:equatable/equatable.dart';

class RoutineSet extends Equatable {
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

  RoutineSet copyWith({
    int? id,
    int? apiId,
    int? routineItemId,
    int? index,
    int? reps,
    double? weight,
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
          weight: weight ?? this.weight,
          isSynced: isSynced ?? this.isSynced);

  @override
  List<Object?> get props => [id, apiId, routineItemId, index, reps, weight];
}
