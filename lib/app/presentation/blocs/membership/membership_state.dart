part of 'membership_bloc.dart';

@freezed
class MembershipState with _$MembershipState {
  const factory MembershipState.initial() = _Initial;
  const factory MembershipState.loaded(Membership m) = _Loaded;
  const factory MembershipState.loading() = _Loading;
  const factory MembershipState.error(MembershipFailure f) = _Error;
}
