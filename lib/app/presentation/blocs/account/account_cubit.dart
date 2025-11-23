import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/data/sources/services/sync/sync_contract.dart';
import 'package:uniceps/app/domain/classes/account_entities/account.dart';
import 'package:uniceps/app/domain/commands/account_usecases/account_usecases.dart';

part 'account_state.dart';
part 'account_cubit.freezed.dart';

class AccountCubit extends Cubit<AccountState> {
  final AccountUsecases _accountUsecases;
  final TSessionSyncContract _syncContract;
  AccountCubit(this._accountUsecases, this._syncContract) : super(const AccountState.initial());

  Future<void> getUserAccount() async {
    final res = await _accountUsecases.getUserAccount();
    res.fold(
      (l) {
        _syncContract.dispose();
        emit(const AccountState.unauthenticated());
      },
      (r) {
        _syncContract.start();
        emit(AccountState.hasAccount(r));
      },
    );
  }

  Future<void> logout() async {
    final res = await _accountUsecases.logout();
    res.fold(
      (l) => emit(state),
      (r) => emit(const AccountState.unauthenticated()),
    );
  }
}
