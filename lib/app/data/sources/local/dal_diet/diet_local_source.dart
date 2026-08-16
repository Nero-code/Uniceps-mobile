import 'package:uniceps/app/data/models/diet_models/ingredient_model.dart';
import 'package:uniceps/app/data/sources/local/database.dart';

abstract class IDietLocalSource {
  // Ingredients
  Future<List<IngredientModel>> getIngredients();
  Future<void> saveIngredient(IngredientModel ingredient);
  Future<void> saveIngredients(List<IngredientModel> ingredients);
}

class DietLocalSource implements IDietLocalSource {
  const DietLocalSource({required AppDatabase db}) : _db = db;
  final AppDatabase _db;

  @override
  Future<List<IngredientModel>> getIngredients() async {
    // TODO: implement getIngredients
    throw UnimplementedError();
  }

  @override
  Future<void> saveIngredient(IngredientModel ingredients) async {
    // TODO: implement saveIngredient
    throw UnimplementedError();
  }

  @override
  Future<void> saveIngredients(List<IngredientModel> ingredients) {
    // TODO: implement saveIngredients
    throw UnimplementedError();
  }
}
