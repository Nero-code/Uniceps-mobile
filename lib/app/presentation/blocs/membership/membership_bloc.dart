import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/classes/account_entities/membership.dart';
import 'package:uniceps/app/domain/commands/account_usecases/account_usecases.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'membership_bloc.freezed.dart';
part 'membership_event.dart';
part 'membership_state.dart';

class MembershipBloc extends Bloc<MembershipEvent, MembershipState> {
  final AccountUsecases _usecases;
  MembershipBloc(this._usecases) : super(const _Initial()) {
    on<_GetCurrentPlan>((event, emit) async {
      emit(const MembershipState.loading());

      final res = await _usecases.getSubscriptionPlan();
      res.fold((l) => emit(MembershipState.error(l)), (r) => emit(MembershipState.loaded(r)));
    });
    on<_NotifyNewMembership>((event, emit) async {
      final either = await _usecases.notifyNewMembership();
      either.fold((l) => emit(MembershipState.error(l)), (r) => emit(MembershipState.loaded(r)));
    });
  }
}
