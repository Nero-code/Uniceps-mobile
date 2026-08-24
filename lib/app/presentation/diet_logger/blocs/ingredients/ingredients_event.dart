part of 'ingredients_bloc.dart';

@freezed
class IngredientsEvent with _$IngredientsEvent {
  const factory IngredientsEvent.started() = _Started;
  const factory IngredientsEvent.filter({@Default('') String search, int? catId}) = _Filter;
  const factory IngredientsEvent.createIngredient({required Ingredient ingredient}) = _CreateIngredient;
}
