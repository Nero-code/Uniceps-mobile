import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/classes/account_entities/account.dart';
import 'package:uniceps/app/domain/commands/account_usecases/account_usecases.dart';

part 'account_state.dart';
part 'account_cubit.freezed.dart';

class AccountCubit extends Cubit<AccountState> {
  final AccountUsecases _accountUsecases;
  AccountCubit(this._accountUsecases) : super(const AccountState.initial());

  Future<void> getUserAccount() async {
    final res = await _accountUsecases.getUserAccount();
    res.fold(
      (l) => emit(const AccountState.unauthenticated()),
      (r) => emit(AccountState.hasAccount(r)),
    );
  }
}
