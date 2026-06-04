import 'package:dartz/dartz.dart';
import 'package:uniceps/app/data/models/diet_models/diet_day_dto.dart';
import 'package:uniceps/app/data/models/diet_models/diet_meal_dto.dart';
import 'package:uniceps/app/data/models/diet_models/diet_meal_ingredient_dto.dart';
import 'package:uniceps/app/data/models/diet_models/diet_plan_dto.dart';
import 'package:uniceps/app/data/models/diet_models/ingredient_model.dart';
import 'package:uniceps/app/data/sources/local/dal_diet/diet_local_source.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_day.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_meal.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_meal_ingredient.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_plan.dart';
import 'package:uniceps/app/domain/classes/diet_classes/ingredient.dart';
import 'package:uniceps/app/domain/contracts/diet/i_diet_service.dart';
import 'package:uniceps/core/errors/failure.dart';

class DietRepo implements IDietService {
  final IDietLocalSource _localSource;
  const DietRepo(this._localSource);

  @override
  Future<Either<Failure, List<Ingredient>>> getIngredients() async {
    try {
      final data = await _localSource.getIngredients();
      return Right(data.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveIngredients(List<Ingredient> ingredients) async {
    try {
      await _localSource.saveIngredients(ingredients.map((e) => IngredientModel.fromEntity(e)).toList());
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DietPlan>>> getDietPlans() async {
    try {
      final plansDto = await _localSource.getDietPlans();
      return Right(plansDto.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> addDietPlan(DietPlan plan) async {
    try {
      final id = await _localSource.addDietPlan(DietPlanDto.fromEntity(plan));
      return Right(id);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateDietPlan(DietPlan plan) async {
    try {
      await _localSource.updateDietPlan(DietPlanDto.fromEntity(plan));
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteDietPlan(int id) async {
    try {
      await _localSource.deleteDietPlan(id);
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> setCurrentDietPlan(int id) async {
    try {
      await _localSource.setCurrentDietPlan(id);
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DietDay>>> getDietDays(int planId) async {
    try {
      final daysDto = await _localSource.getDietDays(planId);
      final List<DietDay> days = [];

      for (final dayDto in daysDto) {
        final mealsDto = await _localSource.getDietMeals(dayDto.id!);
        final List<DietMeal> meals = [];

        for (final mealDto in mealsDto) {
          final ingsDto = await _localSource.getMealIngredients(mealDto.id!);
          final mealIngredients = ingsDto.map((e) => e.toEntity()).toList();

          meals.add(mealDto.toEntity().copyWith(ingredients: mealIngredients));
        }
        days.add(dayDto.toEntity().copyWith(meals: meals));
      }
      return Right(days);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> addDietDay(int planId, DietDay day) async {
    try {
      final id = await _localSource.addDietDay(planId, DietDayDto.fromEntity(day, planId));
      return Right(id);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateDietDay(DietDay day) async {
    try {
      await _localSource.updateDietDay(DietDayDto.fromEntity(day));
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteDietDay(int id) async {
    try {
      await _localSource.deleteDietDay(id);
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> reorderDietDays(int planId, List<DietDay> days) async {
    try {
      await _localSource.reorderDietDays(planId, days.map((e) => DietDayDto.fromEntity(e, planId)).toList());
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DietMeal>>> getDietMeals(int dayId) async {
    try {
      final mealsDto = await _localSource.getDietMeals(dayId);
      final List<DietMeal> meals = [];

      for (final mealDto in mealsDto) {
        final ingsDto = await _localSource.getMealIngredients(mealDto.id!);
        final mealIngredients = ingsDto.map((e) => e.toEntity()).toList();
        meals.add(mealDto.toEntity().copyWith(ingredients: mealIngredients));
      }
      return Right(meals);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> addDietMeal(int dayId, DietMeal meal) async {
    try {
      final id = await _localSource.addDietMeal(dayId, DietMealDto.fromEntity(meal));
      return Right(id);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateDietMeal(DietMeal meal) async {
    try {
      await _localSource.updateDietMeal(DietMealDto.fromEntity(meal));
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteDietMeal(int id) async {
    try {
      await _localSource.deleteDietMeal(id);
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> reorderDietMeals(int dayId, List<DietMeal> meals) async {
    try {
      await _localSource.reorderDietMeals(dayId, meals.map((e) => DietMealDto.fromEntity(e)).toList());
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DietMealIngredient>>> getMealIngredients(int mealId) async {
    try {
      final ingsDto = await _localSource.getMealIngredients(mealId);
      return Right(ingsDto.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> addMealIngredient(int mealId, DietMealIngredient ingredient) async {
    try {
      final id = await _localSource.addMealIngredient(mealId, DietMealIngredientDto.fromEntity(ingredient));
      return Right(id);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> addMealIngredients(int mealId, List<DietMealIngredient> ingredients) async {
    try {
      await _localSource.addMealIngredients(
        mealId,
        ingredients.map((e) => DietMealIngredientDto.fromEntity(e)).toList(),
      );
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateMealIngredient(DietMealIngredient ingredient) async {
    try {
      await _localSource.updateMealIngredient(DietMealIngredientDto.fromEntity(ingredient));
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteMealIngredient(int id) async {
    try {
      await _localSource.deleteMealIngredient(id);
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> reorderMealIngredients(int mealId, List<DietMealIngredient> ingredients) async {
    try {
      await _localSource.reorderMealIngredients(
        mealId,
        ingredients.map((e) => DietMealIngredientDto.fromEntity(e)).toList(),
      );
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }
}
