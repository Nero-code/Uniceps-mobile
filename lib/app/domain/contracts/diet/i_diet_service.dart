import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_log.dart';
import 'package:uniceps/app/domain/classes/diet_classes/ingredient.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IDietService {
  // Ingredients Library
  Future<Either<IngredientFailure, List<Ingredient>>> loadIngredients();
  Future<Either<IngredientFailure, List<Ingredient>>> filterIngredientsBy({String searchString = '', int? categoryId});
  Future<Either<IngredientFailure, Ingredient>> saveIngredient(Ingredient ingredient);
  Future<Either<IngredientFailure, Unit>> bulkSaveIngredients(List<Ingredient> ingredients);
  Future<Either<IngredientFailure, Unit>> deleteIngredient(Ingredient ingredient);

  // Diet Logging
  Future<Either<DietLogFailure, List<DietLog>>> getTodayLogs();
  Future<Either<DietLogFailure, Unit>> logMeal(DietLog log);
  Future<Either<DietLogFailure, Unit>> deleteLog(DietLog log);

  // Analytics Section
  Future<Either<DietLogFailure, List<DietLog>>> getAllLogs();
}
