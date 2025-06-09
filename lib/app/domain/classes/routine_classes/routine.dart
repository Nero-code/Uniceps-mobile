import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';

@freezed
class Routine {
  final int? id, apiId;
  final int version;
  final String name;
  final String? description;
  final bool isCurrent, isSynced;
  final DateTime createdAt, updatedAt;
  final List<RoutineDay> trainingDays;
  const Routine({
    required this.id,
    required this.apiId,
    // required this.issuerId,
    required this.version,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.trainingDays,
    required this.isSynced,
    this.isCurrent = false,
  });

  Routine copyWith({
    int? id,
    int? apiId,
    int? version,
    String? name,
    String? description,
    bool? isCurrent,
    bool? isSynced,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<RoutineDay>? trainingDays,
  }) =>
      Routine(
          id: id ?? this.id,
          apiId: apiId ?? this.apiId,
          version: version ?? this.version,
          name: name ?? this.name,
          description: description ?? this.description,
          createdAt: createdAt ?? this.createdAt,
          updatedAt: updatedAt ?? this.updatedAt,
          trainingDays: trainingDays ?? this.trainingDays,
          isSynced: isSynced ?? this.isSynced);
}
