import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/services.dart';
import 'package:uniceps/app/data/models/diet_models/diet_day_dto.dart';
import 'package:uniceps/app/data/models/diet_models/diet_meal_dto.dart';
import 'package:uniceps/app/data/models/diet_models/diet_meal_ingredient_dto.dart';
import 'package:uniceps/app/data/models/diet_models/diet_plan_dto.dart';
import 'package:uniceps/app/data/models/diet_models/ingredient_model.dart';
import 'package:uniceps/app/data/sources/local/database.dart';

abstract class IDietLocalSource {
  // Ingredients
  Future<List<IngredientModel>> getIngredients();
  Future<void> saveIngredients(List<IngredientModel> ingredients);

  // Diet Plans
  Future<List<DietPlanDto>> getDietPlans();
  Future<int> addDietPlan(DietPlanDto plan);
  Future<void> updateDietPlan(DietPlanDto plan);
  Future<void> deleteDietPlan(int id);
  Future<void> setCurrentDietPlan(int id);

  // Diet Days
  Future<List<DietDayDto>> getDietDays(int planId);
  Future<int> addDietDay(int planId, DietDayDto day);
  Future<void> updateDietDay(DietDayDto day);
  Future<void> deleteDietDay(int id);
  Future<void> reorderDietDays(int planId, List<DietDayDto> days);

  // Diet Meals
  Future<List<DietMealDto>> getDietMeals(int dayId);
  Future<int> addDietMeal(int dayId, DietMealDto meal);
  Future<void> updateDietMeal(DietMealDto meal);
  Future<void> deleteDietMeal(int id);
  Future<void> reorderDietMeals(int dayId, List<DietMealDto> meals);

  // Diet Meal Ingredients
  Future<List<DietMealIngredientDto>> getMealIngredients(int mealId);
  Future<int> addMealIngredient(int mealId, DietMealIngredientDto ingredient);
  Future<void> addMealIngredients(int mealId, List<DietMealIngredientDto> ingredients);
  Future<void> updateMealIngredient(DietMealIngredientDto ingredient);
  Future<void> deleteMealIngredient(int id);
  Future<void> reorderMealIngredients(int mealId, List<DietMealIngredientDto> ingredients);
}

class DietLocalSource implements IDietLocalSource {
  final AppDatabase _db;
  const DietLocalSource(this._db);

  @override
  Future<List<IngredientModel>> getIngredients() async {
    final String response = await rootBundle.loadString('assets/inge.json');
    final List<dynamic> data = json.decode(response);
    return data.map((e) => IngredientModel.fromJson(e)).toList();
  }

  @override
  Future<void> saveIngredients(List<IngredientModel> ingredients) async {
    await _db.batch((batch) {
      for (final ingredient in ingredients) {
        batch.insert(
          _db.ingredients,
          ingredient.toCompanion(),
          onConflict: DoUpdate((old) => ingredient.toCompanion()),
        );
      }
    });
  }

  @override
  Future<List<DietPlanDto>> getDietPlans() async {
    final data = await (_db.select(
      _db.dietPlans,
    )..orderBy([(t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)])).get();
    return data.map((e) => DietPlanDto.fromData(e)).toList();
  }

  @override
  Future<int> addDietPlan(DietPlanDto plan) => _db.into(_db.dietPlans).insert(plan.toCompanion());

  @override
  Future<void> updateDietPlan(DietPlanDto plan) async {
    await (_db.update(_db.dietPlans)..where((t) => t.id.equals(plan.id!))).write(plan.toCompanion());
  }

  @override
  Future<void> deleteDietPlan(int id) => (_db.delete(_db.dietPlans)..where((t) => t.id.equals(id))).go();

  @override
  Future<void> setCurrentDietPlan(int id) async {
    await _db.transaction(() async {
      await (_db.update(
        _db.dietPlans,
      )..where((t) => t.isCurrent.equals(true))).write(const DietPlansCompanion(isCurrent: Value(false)));
      await (_db.update(
        _db.dietPlans,
      )..where((t) => t.id.equals(id))).write(const DietPlansCompanion(isCurrent: Value(true)));
    });
  }

  @override
  Future<List<DietDayDto>> getDietDays(int planId) async {
    final data =
        await (_db.select(_db.dietDays)
              ..where((t) => t.dietPlanId.equals(planId))
              ..orderBy([(t) => OrderingTerm(expression: t.index)]))
            .get();
    return data.map((e) => DietDayDto.fromData(e)).toList();
  }

  @override
  Future<int> addDietDay(int planId, DietDayDto day) => _db.into(_db.dietDays).insert(day.toCompanion(planId));

  @override
  Future<void> updateDietDay(DietDayDto day) async {
    // Note: We use index 0 as placeholder for planId in the companion if not available,
    // but the targeted write below only updates name and index.
    final companion = day.toCompanion(0);
    await (_db.update(
      _db.dietDays,
    )..where((t) => t.id.equals(day.id!))).write(DietDaysCompanion(name: companion.name, index: companion.index));
  }

  @override
  Future<void> deleteDietDay(int id) => (_db.delete(_db.dietDays)..where((t) => t.id.equals(id))).go();

  @override
  Future<void> reorderDietDays(int planId, List<DietDayDto> days) async {
    await _db.batch((batch) {
      for (final day in days) {
        batch.update(_db.dietDays, day.toCompanion(planId), where: (t) => t.id.equals(day.id!));
      }
    });
  }

  @override
  Future<List<DietMealDto>> getDietMeals(int dayId) async {
    final data =
        await (_db.select(_db.dietMeals)
              ..where((t) => t.dietDayId.equals(dayId))
              ..orderBy([(t) => OrderingTerm(expression: t.index)]))
            .get();
    return data.map((e) => DietMealDto.fromData(e)).toList();
  }

  @override
  Future<int> addDietMeal(int dayId, DietMealDto meal) => _db.into(_db.dietMeals).insert(meal.toCompanion(dayId));

  @override
  Future<void> updateDietMeal(DietMealDto meal) async {
    final companion = meal.toCompanion(0);
    await (_db.update(
      _db.dietMeals,
    )..where((t) => t.id.equals(meal.id!))).write(DietMealsCompanion(name: companion.name, index: companion.index));
  }

  @override
  Future<void> deleteDietMeal(int id) => (_db.delete(_db.dietMeals)..where((t) => t.id.equals(id))).go();

  @override
  Future<void> reorderDietMeals(int dayId, List<DietMealDto> meals) async {
    await _db.batch((batch) {
      for (final meal in meals) {
        batch.update(_db.dietMeals, meal.toCompanion(dayId), where: (t) => t.id.equals(meal.id!));
      }
    });
  }

  @override
  Future<List<DietMealIngredientDto>> getMealIngredients(int mealId) async {
    final data =
        await (_db.select(_db.dietMealIngredients)
              ..where((t) => t.dietMealId.equals(mealId))
              ..orderBy([(t) => OrderingTerm(expression: t.index)]))
            .get();
    return data.map((e) => DietMealIngredientDto.fromData(e)).toList();
  }

  @override
  Future<int> addMealIngredient(int mealId, DietMealIngredientDto ingredient) =>
      _db.into(_db.dietMealIngredients).insert(ingredient.toCompanion(mealId));

  @override
  Future<void> addMealIngredients(int mealId, List<DietMealIngredientDto> ingredients) async {
    await _db.batch((batch) {
      for (final ing in ingredients) {
        batch.insert(_db.dietMealIngredients, ing.toCompanion(mealId));
      }
    });
  }

  @override
  Future<void> updateMealIngredient(DietMealIngredientDto ingredient) async {
    final companion = ingredient.toCompanion(0);
    await (_db.update(_db.dietMealIngredients)..where((t) => t.id.equals(ingredient.id!))).write(
      DietMealIngredientsCompanion(
        amount: companion.amount,
        index: companion.index,
        code: companion.code,
        nameAr: companion.nameAr,
        nameEn: companion.nameEn,
        category: companion.category,
        servingSizeInGrams: companion.servingSizeInGrams,
        calories: companion.calories,
        protein: companion.protein,
        carbs: companion.carbs,
        fats: companion.fats,
      ),
    );
  }

  @override
  Future<void> deleteMealIngredient(int id) =>
      (_db.delete(_db.dietMealIngredients)..where((t) => t.id.equals(id))).go();

  @override
  Future<void> reorderMealIngredients(int mealId, List<DietMealIngredientDto> ingredients) async {
    await _db.batch((batch) {
      for (final ing in ingredients) {
        batch.update(_db.dietMealIngredients, ing.toCompanion(mealId), where: (t) => t.id.equals(ing.id!));
      }
    });
  }
}
