part of 'membership_bloc.dart';

@freezed
class MembershipEvent with _$MembershipEvent {
  const factory MembershipEvent.getCurrentPlan() = _GetCurrentPlan;
  const factory MembershipEvent.notifyNewMembership() = _NotifyNewMembership;
}
