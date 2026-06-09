part of 'diet_meal_ingredient_bloc.dart';

@freezed
class DietMealIngredientState with _$DietMealIngredientState {
  const factory DietMealIngredientState.initial() = _Initial;
  const factory DietMealIngredientState.loading() = _Loading;
  const factory DietMealIngredientState.loaded(List<DietMealIngredient> ingredients) = _Loaded;
  const factory DietMealIngredientState.error(Failure f) = _Error;
}
