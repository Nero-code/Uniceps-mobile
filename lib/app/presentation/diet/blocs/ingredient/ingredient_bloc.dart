import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/classes/diet_classes/ingredient.dart';
import 'package:uniceps/app/domain/commands/diet/diet_commands.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'ingredient_bloc.freezed.dart';
part 'ingredient_event.dart';
part 'ingredient_state.dart';

class IngredientBloc extends Bloc<IngredientEvent, IngredientState> {
  final DietCommands _commands;

  IngredientBloc(this._commands) : super(const IngredientState.initial()) {
    on<_GetIngredients>((event, emit) async {
      emit(const IngredientState.loading());
      final res = await _commands.getIngredients();
      res.fold((l) => emit(IngredientState.error(l)), (ingredients) => emit(IngredientState.loaded(ingredients)));
    });
  }
}
