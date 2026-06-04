import 'package:drift/drift.dart';
import 'package:uniceps/app/data/models/diet_models/diet_meal_dto.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_day.dart';

class DietDayDto {
  final int? id;
  final int? dietPlanId;
  final String name;
  final int index;
  final List<DietMealDto> meals;

  const DietDayDto({this.id, required this.name, required this.index, this.dietPlanId, this.meals = const []});

  DietDay toEntity() => DietDay(id: id, name: name, index: index, meals: meals.map((e) => e.toEntity()).toList());

  factory DietDayDto.fromEntity(DietDay entity, [int? dietPlanId]) => DietDayDto(
    id: entity.id,
    name: entity.name,
    index: entity.index,
    dietPlanId: dietPlanId,
    meals: entity.meals.map((e) => DietMealDto.fromEntity(e)).toList(),
  );

  DietDaysCompanion toCompanion(int dietPlanId) => DietDaysCompanion(
    id: id == null ? const Value.absent() : Value(id!),
    name: Value(name),
    index: Value(index),
    dietPlanId: Value(dietPlanId),
  );

  factory DietDayDto.fromData(DietDayData data, [List<DietMealDto> meals = const []]) =>
      DietDayDto(id: data.id, name: data.name, index: data.index, dietPlanId: data.dietPlanId, meals: meals);
}
