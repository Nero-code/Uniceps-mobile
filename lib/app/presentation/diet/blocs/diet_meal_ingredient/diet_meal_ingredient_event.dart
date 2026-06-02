part of 'diet_meal_ingredient_bloc.dart';

@freezed
abstract class DietMealIngredientEvent with _$DietMealIngredientEvent {
  const factory DietMealIngredientEvent.getIngredients(int mealId) = _GetIngredients;
  const factory DietMealIngredientEvent.addIngredient(int mealId, DietMealIngredient ingredient) = _AddIngredient;
  const factory DietMealIngredientEvent.addIngredients(int mealId, List<DietMealIngredient> ingredients) =
      _AddIngredients;
  const factory DietMealIngredientEvent.updateIngredient(int mealId, DietMealIngredient ingredient) = _UpdateIngredient;
  const factory DietMealIngredientEvent.deleteIngredient(int mealId, int id) = _DeleteIngredient;
  const factory DietMealIngredientEvent.reorderIngredients(int mealId, List<DietMealIngredient> ingredients) =
      _ReorderIngredients;
}
