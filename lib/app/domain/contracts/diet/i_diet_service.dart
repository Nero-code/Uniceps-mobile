import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_day.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_meal.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_meal_ingredient.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_plan.dart';
import 'package:uniceps/app/domain/classes/diet_classes/ingredient.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IDietService {
  // Ingredients Library
  Future<Either<Failure, List<Ingredient>>> getIngredients();
  Future<Either<Failure, Unit>> saveIngredients(List<Ingredient> ingredients);

  // Diet Plans
  Future<Either<Failure, List<DietPlan>>> getDietPlans();
  Future<Either<Failure, int>> addDietPlan(DietPlan plan);
  Future<Either<Failure, Unit>> updateDietPlan(DietPlan plan);
  Future<Either<Failure, Unit>> deleteDietPlan(int id);
  Future<Either<Failure, Unit>> setCurrentDietPlan(int id);

  // Diet Days
  Future<Either<Failure, List<DietDay>>> getDietDays(int planId);
  Future<Either<Failure, int>> addDietDay(int planId, DietDay day);
  Future<Either<Failure, Unit>> updateDietDay(DietDay day);
  Future<Either<Failure, Unit>> deleteDietDay(int id);
  Future<Either<Failure, Unit>> reorderDietDays(int planId, List<DietDay> days);

  // Diet Meals
  Future<Either<Failure, List<DietMeal>>> getDietMeals(int dayId);
  Future<Either<Failure, int>> addDietMeal(int dayId, DietMeal meal);
  Future<Either<Failure, Unit>> updateDietMeal(DietMeal meal);
  Future<Either<Failure, Unit>> deleteDietMeal(int id);
  Future<Either<Failure, Unit>> reorderDietMeals(int dayId, List<DietMeal> meals);

  // Diet Meal Ingredients
  Future<Either<Failure, List<DietMealIngredient>>> getMealIngredients(int mealId);
  Future<Either<Failure, int>> addMealIngredient(int mealId, DietMealIngredient ingredient);
  Future<Either<Failure, Unit>> addMealIngredients(int mealId, List<DietMealIngredient> ingredients);
  Future<Either<Failure, Unit>> updateMealIngredient(DietMealIngredient ingredient);
  Future<Either<Failure, Unit>> deleteMealIngredient(int id);
  Future<Either<Failure, Unit>> reorderMealIngredients(int mealId, List<DietMealIngredient> ingredients);
}
