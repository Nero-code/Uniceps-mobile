import 'package:dartz/dartz.dart';
import 'package:uniceps/app/data/models/diet_models/ingredient_model.dart';
import 'package:uniceps/app/data/sources/local/dal_diet/diet_local_source.dart';
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
  Future<Either<Failure, Unit>> saveIngredient(Ingredient ingredient) async {
    try {
      await _localSource.saveIngredient(IngredientModel.fromEntity(ingredient));
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> bulkSaveIngredients(List<Ingredient> ingredients) async {
    try {
      await _localSource.saveIngredients(ingredients.map((e) => IngredientModel.fromEntity(e)).toList());
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(errorMsg: e.toString()));
    }
  }
}
