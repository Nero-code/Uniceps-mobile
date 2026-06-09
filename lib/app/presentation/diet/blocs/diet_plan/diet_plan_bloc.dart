import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_plan.dart';
import 'package:uniceps/app/domain/commands/diet/diet_commands.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'diet_plan_bloc.freezed.dart';
part 'diet_plan_event.dart';
part 'diet_plan_state.dart';

class DietPlanBloc extends Bloc<DietPlanEvent, DietPlanState> {
  final DietCommands _commands;

  DietPlanBloc(this._commands) : super(const DietPlanState.initial()) {
    on<_GetPlans>((event, emit) async {
      emit(const DietPlanState.loading());
      final res = await _commands.getDietPlans();
      res.fold((l) => emit(DietPlanState.error(l)), (plans) {
        final current = plans.isEmpty ? null : plans.firstWhere((p) => p.isCurrent, orElse: () => plans.first);
        emit(DietPlanState.loaded(plans: plans, currentPlan: current));
      });
    });

    on<_AddPlan>((event, emit) async {
      final res = await _commands.addDietPlan(event.plan);
      res.fold((l) => emit(DietPlanState.error(l)), (_) => add(const DietPlanEvent.getPlans()));
    });

    on<_UpdatePlan>((event, emit) async {
      final res = await _commands.updateDietPlan(event.plan);
      res.fold((l) => emit(DietPlanState.error(l)), (_) => add(const DietPlanEvent.getPlans()));
    });

    on<_DeletePlan>((event, emit) async {
      final res = await _commands.deleteDietPlan(event.id);
      res.fold((l) => emit(DietPlanState.error(l)), (_) => add(const DietPlanEvent.getPlans()));
    });

    on<_SetCurrentPlan>((event, emit) async {
      final res = await _commands.setCurrentDietPlan(event.id);
      res.fold((l) => emit(DietPlanState.error(l)), (_) => add(const DietPlanEvent.getPlans()));
    });
  }
}
