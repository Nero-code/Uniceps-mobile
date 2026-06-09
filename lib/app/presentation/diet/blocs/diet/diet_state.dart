part of 'diet_bloc.dart';

@freezed
class DietState with _$DietState {
  const factory DietState.initial() = _Initial;
  const factory DietState.loading() = _Loading;
  const factory DietState.loaded({
    required List<DietPlan> dietPlans,
    required DietPlan? currentPlan,
    required List<DietDay> dietDays,
    required List<Ingredient> ingredients,
  }) = _Loaded;
  const factory DietState.error(Failure f) = _Error;
}
