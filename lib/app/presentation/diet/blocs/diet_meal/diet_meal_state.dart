part of 'diet_meal_bloc.dart';

@freezed
class DietMealState with _$DietMealState {
  const factory DietMealState.initial() = _Initial;
  const factory DietMealState.loading() = _Loading;
  const factory DietMealState.loaded(List<DietMeal> meals) = _Loaded;
  const factory DietMealState.error(Failure f) = _Error;
}
