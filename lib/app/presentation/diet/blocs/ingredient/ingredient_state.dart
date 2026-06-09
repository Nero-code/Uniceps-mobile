part of 'ingredient_bloc.dart';

@freezed
class IngredientState with _$IngredientState {
  const factory IngredientState.initial() = _Initial;
  const factory IngredientState.loading() = _Loading;
  const factory IngredientState.loaded(List<Ingredient> ingredients) = _Loaded;
  const factory IngredientState.error(Failure f) = _Error;
}
