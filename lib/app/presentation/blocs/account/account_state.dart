part of 'account_cubit.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState.initial() = _Initial;
  const factory AccountState.unauthenticated() = _Unauthenticated;
  const factory AccountState.hasAccount(Account account) = _HasAccount;
}
