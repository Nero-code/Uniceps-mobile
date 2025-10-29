import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/classes/account_entities/account.dart';
import 'package:uniceps/app/domain/commands/account_usecases/account_usecases.dart';

part 'app_state_state.dart';
part 'app_state_cubit.freezed.dart';

class AppStateCubit extends Cubit<AppStateState> {
  final AccountUsecases _accountUsecases;
  AppStateCubit(this._accountUsecases) : super(const AppStateState.initial());

  Future<void> getUserAccount() async {
    final res = await _accountUsecases.getUserAccount();
    res.fold(
      (l) => emit(const AppStateState.unauthenticated()),
      (r) => emit(AppStateState.hasAccount(r)),
    );
  }
}
