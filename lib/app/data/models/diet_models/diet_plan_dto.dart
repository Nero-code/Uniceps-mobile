import 'package:drift/drift.dart';
import 'package:uniceps/app/data/models/diet_models/diet_day_dto.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_plan.dart';

class DietPlanDto {
  final int? id;
  final String name;
  final String? description;
  final bool isCurrent;
  final DateTime createdAt;
  final List<DietDayDto> days;

  const DietPlanDto({
    this.id,
    required this.name,
    this.description,
    this.isCurrent = false,
    required this.createdAt,
    this.days = const [],
  });

  DietPlan toEntity() => DietPlan(
    id: id,
    name: name,
    description: description,
    isCurrent: isCurrent,
    createdAt: createdAt,
    days: days.map((e) => e.toEntity()).toList(),
  );

  factory DietPlanDto.fromEntity(DietPlan entity) => DietPlanDto(
    id: entity.id,
    name: entity.name,
    description: entity.description,
    isCurrent: entity.isCurrent,
    createdAt: entity.createdAt,
    days: entity.days.map((e) => DietDayDto.fromEntity(e)).toList(),
  );

  DietPlansCompanion toCompanion() => DietPlansCompanion(
    id: id == null ? const Value.absent() : Value(id!),
    name: Value(name),
    description: description == null ? const Value.absent() : Value(description!),
    isCurrent: Value(isCurrent),
    createdAt: Value(createdAt),
  );

  factory DietPlanDto.fromData(DietPlanData data, [List<DietDayDto> days = const []]) => DietPlanDto(
    id: data.id,
    name: data.name,
    description: data.description,
    isCurrent: data.isCurrent,
    createdAt: data.createdAt,
    days: days,
  );
}
