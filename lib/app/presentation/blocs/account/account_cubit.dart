import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/data/services/sync/sync_orchestrator.dart';
import 'package:uniceps/app/domain/classes/account_entities/account.dart';
import 'package:uniceps/app/domain/commands/account_usecases/account_usecases.dart';

part 'account_cubit.freezed.dart';
part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  final AccountUsecases _accountUsecases;
  final SyncOrchestrator _syncOrchestrator;

  AccountCubit({required AccountUsecases accountUsecases, required SyncOrchestrator syncOrchestrator})
    : _accountUsecases = accountUsecases,
      _syncOrchestrator = syncOrchestrator,
      super(const AccountState.initial());

  Future<void> getUserAccount() async {
    final res = await _accountUsecases.getUserAccount();
    res.fold(
      (l) {
        emit(const AccountState.unauthenticated());
      },
      (r) {
        // Authenticated users get device info and user activity syncs
        _syncOrchestrator.syncDeviceInfo();
        _syncOrchestrator.syncUserActivity();
        emit(AccountState.hasAccount(r));
      },
    );
  }

  Future<void> logout() async {
    final res = await _accountUsecases.logout();
    res.fold((l) => emit(state), (r) {
      emit(const AccountState.unauthenticated());
    });
  }
}
