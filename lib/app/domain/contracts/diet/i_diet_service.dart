import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/diet_classes/ingredient.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IDietService {
  // Ingredients Library
  Future<Either<Failure, List<Ingredient>>> getIngredients();
  Future<Either<Failure, Unit>> saveIngredient(Ingredient ingredient);
  Future<Either<Failure, Unit>> bulkSaveIngredients(List<Ingredient> ingredients);
}
