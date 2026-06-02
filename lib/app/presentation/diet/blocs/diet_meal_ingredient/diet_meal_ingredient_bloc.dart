import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_meal_ingredient.dart';
import 'package:uniceps/app/domain/commands/diet/diet_commands.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'diet_meal_ingredient_bloc.freezed.dart';
part 'diet_meal_ingredient_event.dart';
part 'diet_meal_ingredient_state.dart';

class DietMealIngredientBloc extends Bloc<DietMealIngredientEvent, DietMealIngredientState> {
  final DietCommands _commands;

  DietMealIngredientBloc(this._commands) : super(const DietMealIngredientState.initial()) {
    on<_GetIngredients>((event, emit) async {
      emit(const DietMealIngredientState.loading());
      final res = await _commands.getMealIngredients(event.mealId);
      res.fold(
        (l) => emit(DietMealIngredientState.error(l)),
        (ingredients) => emit(DietMealIngredientState.loaded(ingredients)),
      );
    });

    on<_AddIngredient>((event, emit) async {
      final res = await _commands.addMealIngredient(event.mealId, event.ingredient);
      res.fold(
        (l) => emit(DietMealIngredientState.error(l)),
        (_) => add(DietMealIngredientEvent.getIngredients(event.mealId)),
      );
    });

    on<_AddIngredients>((event, emit) async {
      final res = await _commands.addMealIngredients(event.mealId, event.ingredients);
      res.fold(
        (l) => emit(DietMealIngredientState.error(l)),
        (_) => add(DietMealIngredientEvent.getIngredients(event.mealId)),
      );
    });

    on<_UpdateIngredient>((event, emit) async {
      final res = await _commands.updateMealIngredient(event.ingredient);
      res.fold(
        (l) => emit(DietMealIngredientState.error(l)),
        (_) => add(DietMealIngredientEvent.getIngredients(event.mealId)),
      );
    });

    on<_DeleteIngredient>((event, emit) async {
      final res = await _commands.deleteMealIngredient(event.id);
      res.fold(
        (l) => emit(DietMealIngredientState.error(l)),
        (_) => add(DietMealIngredientEvent.getIngredients(event.mealId)),
      );
    });

    on<_ReorderIngredients>((event, emit) async {
      final res = await _commands.reorderMealIngredients(event.mealId, event.ingredients);
      res.fold(
        (l) => emit(DietMealIngredientState.error(l)),
        (_) => add(DietMealIngredientEvent.getIngredients(event.mealId)),
      );
    });
  }
}
