import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_meal.dart';
import 'package:uniceps/app/domain/commands/diet/diet_commands.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'diet_meal_bloc.freezed.dart';
part 'diet_meal_event.dart';
part 'diet_meal_state.dart';

class DietMealBloc extends Bloc<DietMealEvent, DietMealState> {
  final DietCommands _commands;

  DietMealBloc(this._commands) : super(const DietMealState.initial()) {
    on<_GetMeals>((event, emit) async {
      emit(const DietMealState.loading());
      final res = await _commands.getDietMeals(event.dayId);
      res.fold((l) => emit(DietMealState.error(l)), (meals) => emit(DietMealState.loaded(meals)));
    });

    on<_AddMeal>((event, emit) async {
      final res = await _commands.addDietMeal(event.dayId, event.meal);
      res.fold((l) => emit(DietMealState.error(l)), (_) => add(DietMealEvent.getMeals(event.dayId)));
    });

    on<_UpdateMeal>((event, emit) async {
      final res = await _commands.updateDietMeal(event.meal);
      res.fold((l) => emit(DietMealState.error(l)), (_) => add(DietMealEvent.getMeals(event.dayId)));
    });

    on<_DeleteMeal>((event, emit) async {
      final res = await _commands.deleteDietMeal(event.id);
      res.fold((l) => emit(DietMealState.error(l)), (_) => add(DietMealEvent.getMeals(event.dayId)));
    });

    on<_ReorderMeals>((event, emit) async {
      final res = await _commands.reorderDietMeals(event.dayId, event.meals);
      res.fold((l) => emit(DietMealState.error(l)), (_) => add(DietMealEvent.getMeals(event.dayId)));
    });
  }
}
