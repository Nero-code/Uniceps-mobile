import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/classes/diet_classes/ingredient.dart';
import 'package:uniceps/app/domain/commands/diet/diet_commands.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'ingredients_cubit.freezed.dart';
part 'ingredients_state.dart';

class IngredientsCubit extends Cubit<IngredientsState> {
  final DietCommands _dietCommands;

  IngredientsCubit(this._dietCommands) : super(const IngredientsState.initial());

  Future<void> loadAllIngredients() async {
    emit(const IngredientsState.loading());
    final result = await _dietCommands.loadIngredients();
    result.fold(
      (failure) => emit(IngredientsState.failure(failure: failure)),
      (ingredients) => emit(IngredientsState.success(ingredients: ingredients)),
    );
  }

  Future<void> filterIngredients({String searchString = '', int? categoryId}) async {
    emit(const IngredientsState.loading());
    final result = await _dietCommands.filterIngredientsBy(searchString: searchString, categoryId: categoryId);
    result.fold(
      (failure) => emit(IngredientsState.failure(failure: failure)),
      (ingredients) => emit(IngredientsState.success(ingredients: ingredients)),
    );
  }
}
