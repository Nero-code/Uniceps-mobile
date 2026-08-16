import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/diet_classes/ingredient.dart';
import 'package:uniceps/app/domain/contracts/diet/i_diet_service.dart';
import 'package:uniceps/core/errors/failure.dart';

class DietCommands {
  final IDietService _repo;
  DietCommands(this._repo);

  // Ingredients
  Future<Either<Failure, List<Ingredient>>> getIngredients() => _repo.getIngredients();
  Future<Either<Failure, Unit>> saveIngredient(Ingredient i) => _repo.saveIngredient(i);
}
