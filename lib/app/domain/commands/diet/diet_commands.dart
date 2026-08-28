import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_log.dart';
import 'package:uniceps/app/domain/classes/diet_classes/ingredient.dart';
import 'package:uniceps/app/domain/contracts/diet/i_diet_service.dart';
import 'package:uniceps/core/errors/failure.dart';

class DietCommands {
  final IDietService _repo;
  const DietCommands(this._repo);

  // Ingredients
  Future<Either<IngredientFailure, List<Ingredient>>> loadIngredients({required String language}) =>
      _repo.loadIngredients(language: language);

  Future<Either<IngredientFailure, bool>> changeIngredientsLanguage({required String language}) =>
      _repo.changeIngredientsLanguage(language: language);

  Future<Either<IngredientFailure, List<Ingredient>>> filterIngredientsBy({
    String searchString = '',
    int? categoryId,
  }) => _repo.filterIngredientsBy(searchString: searchString, categoryId: categoryId);
  Future<Either<IngredientFailure, Ingredient>> saveIngredient(Ingredient i) => _repo.saveIngredient(i);
  Future<Either<IngredientFailure, Unit>> bulkSaveIngredients(List<Ingredient> ingredients) =>
      _repo.bulkSaveIngredients(ingredients);
  Future<Either<IngredientFailure, Unit>> deleteIngredient(Ingredient i) => _repo.deleteIngredient(i);

  // Diet Logging
  Future<Either<DietLogFailure, List<DietLog>>> getTodayLogs() => _repo.getTodayLogs();
  Future<Either<DietLogFailure, Unit>> logMeal(DietLog log) => _repo.logMeal(log);
  Future<Either<DietLogFailure, Unit>> deleteLog(DietLog log) => _repo.deleteLog(log);

  // Analytics
  Future<Either<DietLogFailure, List<DietLog>>> getAllLogs() => _repo.getAllLogs();
}
