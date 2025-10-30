part of 'plans_bloc.dart';

@freezed
class PlansEvent with _$PlansEvent {
  const factory PlansEvent.getPlan(Plan plan) = _GetPlan;
  const factory PlansEvent.buyPlan(PlanItem item) = _BuyPlan;
}
