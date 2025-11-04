import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/data/models/account_models/payment_response.dart';
import 'package:uniceps/app/domain/classes/account_entities/plan.dart';
import 'package:uniceps/app/domain/classes/account_entities/plan_item.dart';
import 'package:uniceps/app/domain/commands/account_usecases/account_usecases.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'plans_event.dart';
part 'plans_state.dart';
part 'plans_bloc.freezed.dart';

class PlansBloc extends Bloc<PlansEvent, PlansState> {
  final AccountUsecases _accountUsecases;
  PlansBloc(this._accountUsecases) : super(const _Initial()) {
    on<_GetPlan>((event, emit) async {
      emit(const PlansState.loading());

      final res = await _accountUsecases.getPlans();
      res.fold(
        (l) => emit(PlansState.error(l)),
        (r) => emit(PlansState.loaded(r)),
      );
    });

    on<_BuyPlan>((event, emit) async {
      emit(const PlansState.loading());

      final res = await _accountUsecases.buyPlan(event.item);
      res.fold(
        (l) => emit(PlansState.error(l)),
        (r) => emit(PlansState.buyPlanAndReset(r)),
      );
    });
  }
}
