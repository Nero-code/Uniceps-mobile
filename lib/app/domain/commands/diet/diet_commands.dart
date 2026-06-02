import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_day.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_meal.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_meal_ingredient.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_plan.dart';
import 'package:uniceps/app/domain/classes/diet_classes/ingredient.dart';
import 'package:uniceps/app/domain/contracts/diet/i_diet_service.dart';
import 'package:uniceps/core/errors/failure.dart';

class DietCommands {
  final IDietService _repo;
  DietCommands(this._repo);

  // Ingredients
  Future<Either<Failure, List<Ingredient>>> getIngredients() => _repo.getIngredients();

  // Diet Plans
  Future<Either<Failure, List<DietPlan>>> getDietPlans() => _repo.getDietPlans();
  Future<Either<Failure, int>> addDietPlan(DietPlan plan) => _repo.addDietPlan(plan);
  Future<Either<Failure, Unit>> updateDietPlan(DietPlan plan) => _repo.updateDietPlan(plan);
  Future<Either<Failure, Unit>> deleteDietPlan(int id) => _repo.deleteDietPlan(id);
  Future<Either<Failure, Unit>> setCurrentDietPlan(int id) => _repo.setCurrentDietPlan(id);

  // Diet Days
  Future<Either<Failure, List<DietDay>>> getDietDays(int planId) => _repo.getDietDays(planId);
  Future<Either<Failure, int>> addDietDay(int planId, DietDay day) => _repo.addDietDay(planId, day);
  Future<Either<Failure, Unit>> updateDietDay(DietDay day) => _repo.updateDietDay(day);
  Future<Either<Failure, Unit>> deleteDietDay(int id) => _repo.deleteDietDay(id);
  Future<Either<Failure, Unit>> reorderDietDays(int planId, List<DietDay> days) => _repo.reorderDietDays(planId, days);

  // Diet Meals
  Future<Either<Failure, List<DietMeal>>> getDietMeals(int dayId) => _repo.getDietMeals(dayId);
  Future<Either<Failure, int>> addDietMeal(int dayId, DietMeal meal) => _repo.addDietMeal(dayId, meal);
  Future<Either<Failure, Unit>> updateDietMeal(DietMeal meal) => _repo.updateDietMeal(meal);
  Future<Either<Failure, Unit>> deleteDietMeal(int id) => _repo.deleteDietMeal(id);
  Future<Either<Failure, Unit>> reorderDietMeals(int dayId, List<DietMeal> meals) =>
      _repo.reorderDietMeals(dayId, meals);

  // Meal Ingredients
  Future<Either<Failure, List<DietMealIngredient>>> getMealIngredients(int mealId) => _repo.getMealIngredients(mealId);
  Future<Either<Failure, int>> addMealIngredient(int mealId, DietMealIngredient ingredient) =>
      _repo.addMealIngredient(mealId, ingredient);
  Future<Either<Failure, Unit>> addMealIngredients(int mealId, List<DietMealIngredient> ingredients) =>
      _repo.addMealIngredients(mealId, ingredients);
  Future<Either<Failure, Unit>> updateMealIngredient(DietMealIngredient ingredient) =>
      _repo.updateMealIngredient(ingredient);
  Future<Either<Failure, Unit>> deleteMealIngredient(int id) => _repo.deleteMealIngredient(id);
  Future<Either<Failure, Unit>> reorderMealIngredients(int mealId, List<DietMealIngredient> ingredients) =>
      _repo.reorderMealIngredients(mealId, ingredients);
}
