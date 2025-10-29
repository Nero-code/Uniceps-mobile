part of 'app_state_cubit.dart';

@freezed
class AppStateState with _$AppStateState {
  const factory AppStateState.initial() = _Initial;
  const factory AppStateState.unauthenticated() = _Unauthenticated;
  const factory AppStateState.hasAccount(Account account) = _HasAccount;
}
