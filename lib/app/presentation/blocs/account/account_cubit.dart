import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/data/sources/services/sync/sync_contract.dart';
import 'package:uniceps/app/domain/classes/account_entities/account.dart';
import 'package:uniceps/app/domain/commands/account_usecases/account_usecases.dart';
import 'package:uniceps/app/services/device_info_sync_service.dart';

part 'account_cubit.freezed.dart';
part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  final AccountUsecases _accountUsecases;
  final TSessionSyncContract _syncContract;
  final DeviceInfoSyncService _deviceInfoSync;
  AccountCubit(this._accountUsecases, this._syncContract, this._deviceInfoSync) : super(const AccountState.initial());

  Future<void> getUserAccount() async {
    final res = await _accountUsecases.getUserAccount();
    res.fold(
      (l) {
        _syncContract.dispose();
        emit(const AccountState.unauthenticated());
      },
      (r) {
        _syncContract.start();
        _deviceInfoSync.checkStatusThenSync();
        emit(AccountState.hasAccount(r));
      },
    );
  }

  Future<void> logout() async {
    final res = await _accountUsecases.logout();
    res.fold((l) => emit(state), (r) {
      _syncContract.dispose();
      emit(const AccountState.unauthenticated());
    });
  }
}
