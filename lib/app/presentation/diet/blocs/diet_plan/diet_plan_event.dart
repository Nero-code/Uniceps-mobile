part of 'diet_plan_bloc.dart';

@freezed
abstract class DietPlanEvent with _$DietPlanEvent {
  const factory DietPlanEvent.getPlans() = _GetPlans;
  const factory DietPlanEvent.addPlan(DietPlan plan) = _AddPlan;
  const factory DietPlanEvent.updatePlan(DietPlan plan) = _UpdatePlan;
  const factory DietPlanEvent.deletePlan(int id) = _DeletePlan;
  const factory DietPlanEvent.setCurrentPlan(int id) = _SetCurrentPlan;
}
