import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_day.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_meal.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_meal_ingredient.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_plan.dart';
import 'package:uniceps/app/domain/classes/diet_classes/ingredient.dart';
import 'package:uniceps/app/domain/commands/diet/diet_commands.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'diet_bloc.freezed.dart';
part 'diet_event.dart';
part 'diet_state.dart';

class DietBloc extends Bloc<DietEvent, DietState> {
  final DietCommands _commands;

  DietBloc(this._commands) : super(const DietState.initial()) {
    on<_GetDietData>((event, emit) async {
      emit(const DietState.loading());

      final plansEither = await _commands.getDietPlans();
      final ingsEither = await _commands.getIngredients();

      await plansEither.fold((l) async => emit(DietState.error(l)), (plans) async {
        DietPlan? current = plans.isNotEmpty ? plans.firstWhere((p) => p.isCurrent, orElse: () => plans.first) : null;

        if (event.planId != null) {
          current = plans.firstWhere((p) => p.id == event.planId, orElse: () => current!);
        }

        if (current != null) {
          final daysEither = await _commands.getDietDays(current.id!);
          await daysEither.fold((l) async => emit(DietState.error(l)), (days) async {
            ingsEither.fold(
              (l) => emit(DietState.error(l)),
              (ings) =>
                  emit(DietState.loaded(dietPlans: plans, currentPlan: current, dietDays: days, ingredients: ings)),
            );
          });
        } else {
          ingsEither.fold(
            (l) => emit(DietState.error(l)),
            (ings) => emit(DietState.loaded(dietPlans: plans, currentPlan: null, dietDays: [], ingredients: ings)),
          );
        }
      });
    });

    on<_AddDietPlan>((event, emit) async {
      final res = await _commands.addDietPlan(event.plan);
      res.fold((l) => emit(DietState.error(l)), (id) => add(DietEvent.getDietData(planId: id)));
    });

    on<_UpdateDietPlan>((event, emit) async {
      final res = await _commands.updateDietPlan(event.plan);
      res.fold((l) => emit(DietState.error(l)), (_) => add(DietEvent.getDietData(planId: event.plan.id)));
    });

    on<_DeleteDietPlan>((event, emit) async {
      final res = await _commands.deleteDietPlan(event.id);
      res.fold((l) => emit(DietState.error(l)), (_) => add(const DietEvent.getDietData()));
    });

    on<_SetCurrentDietPlan>((event, emit) async {
      final res = await _commands.setCurrentDietPlan(event.id);
      res.fold((l) => emit(DietState.error(l)), (_) => add(DietEvent.getDietData(planId: event.id)));
    });

    on<_AddDietDay>((event, emit) async {
      final res = await _commands.addDietDay(event.planId, event.day);
      res.fold((l) => emit(DietState.error(l)), (_) => add(DietEvent.getDietData(planId: event.planId)));
    });

    on<_UpdateDietDay>((event, emit) async {
      final res = await _commands.updateDietDay(event.day);
      res.fold((l) => emit(DietState.error(l)), (_) => _handleReload(emit));
    });

    on<_DeleteDietDay>((event, emit) async {
      final res = await _commands.deleteDietDay(event.id);
      res.fold((l) => emit(DietState.error(l)), (_) => _handleReload(emit));
    });

    on<_ReorderDietDays>((event, emit) async {
      final res = await _commands.reorderDietDays(event.planId, event.days);
      res.fold((l) => emit(DietState.error(l)), (_) => add(DietEvent.getDietData(planId: event.planId)));
    });

    on<_AddDietMeal>((event, emit) async {
      final res = await _commands.addDietMeal(event.dayId, event.meal);
      res.fold((l) => emit(DietState.error(l)), (_) => _handleReload(emit));
    });

    on<_UpdateDietMeal>((event, emit) async {
      final res = await _commands.updateDietMeal(event.meal);
      res.fold((l) => emit(DietState.error(l)), (_) => _handleReload(emit));
    });

    on<_DeleteDietMeal>((event, emit) async {
      final res = await _commands.deleteDietMeal(event.id);
      res.fold((l) => emit(DietState.error(l)), (_) => _handleReload(emit));
    });

    on<_ReorderDietMeals>((event, emit) async {
      final res = await _commands.reorderDietMeals(event.dayId, event.meals);
      res.fold((l) => emit(DietState.error(l)), (_) => _handleReload(emit));
    });

    on<_AddMealIngredient>((event, emit) async {
      final res = await _commands.addMealIngredient(event.mealId, event.ingredient);
      res.fold((l) => emit(DietState.error(l)), (_) => _handleReload(emit));
    });

    on<_UpdateMealIngredient>((event, emit) async {
      final res = await _commands.updateMealIngredient(event.ingredient);
      res.fold((l) => emit(DietState.error(l)), (_) => _handleReload(emit));
    });

    on<_DeleteMealIngredient>((event, emit) async {
      final res = await _commands.deleteMealIngredient(event.id);
      res.fold((l) => emit(DietState.error(l)), (_) => _handleReload(emit));
    });

    on<_ReorderMealIngredients>((event, emit) async {
      final res = await _commands.reorderMealIngredients(event.mealId, event.ingredients);
      res.fold((l) => emit(DietState.error(l)), (_) => _handleReload(emit));
    });
  }

  void _handleReload(Emitter<DietState> emit) {
    state.maybeWhen(
      loaded: (plans, current, days, ings) {
        add(DietEvent.getDietData(planId: current?.id));
      },
      orElse: () => add(const DietEvent.getDietData()),
    );
  }
}
