part of 'diet_plan_bloc.dart';

@freezed
class DietPlanState with _$DietPlanState {
  const factory DietPlanState.initial() = _Initial;
  const factory DietPlanState.loading() = _Loading;
  const factory DietPlanState.loaded({required List<DietPlan> plans, DietPlan? currentPlan}) = _Loaded;
  const factory DietPlanState.error(Failure f) = _Error;
}
