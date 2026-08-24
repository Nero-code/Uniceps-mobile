part of 'ingredients_bloc.dart';

@freezed
class IngredientsState with _$IngredientsState {
  const factory IngredientsState.initial() = _Initial;
  const factory IngredientsState.loading() = _Loading;
  const factory IngredientsState.success({
    required List<Ingredient> ingredients,
    required List<DietCategory> categories,
  }) = _Success;
  const factory IngredientsState.failure({required IngredientFailure failure}) = _Failure;
}
