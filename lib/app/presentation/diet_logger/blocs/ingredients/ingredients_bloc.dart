import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_category.dart';
import 'package:uniceps/app/domain/classes/diet_classes/ingredient.dart';
import 'package:uniceps/app/domain/commands/diet/diet_commands.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'ingredients_bloc.freezed.dart';
part 'ingredients_event.dart';
part 'ingredients_state.dart';

class IngredientsBloc extends Bloc<IngredientsEvent, IngredientsState> {
  final DietCommands _dietCommands;

  var categories = <DietCategory>[];
  IngredientsBloc({required DietCommands dietCommands})
    : _dietCommands = dietCommands,
      super(const IngredientsState.initial()) {
    on<_Started>((event, emit) async {
      emit(const IngredientsState.loading());
      final result = await _dietCommands.loadIngredients(language: event.language);
      result.fold((failure) => emit(IngredientsState.failure(failure: failure)), (ingredients) {
        categories = _extractCategories(ingredients);
        emit(IngredientsState.success(ingredients: ingredients, categories: categories));
      });
    });

    on<_Filter>(
      (event, emit) async {
        final either = await _dietCommands.filterIngredientsBy(searchString: event.search, categoryId: event.catId);
        either.fold((failure) => emit(IngredientsState.failure(failure: failure)), (ingredients) {
          emit(IngredientsState.success(ingredients: ingredients, categories: categories));
        });
      },
      transformer: (events, mapper) =>
          events.throttle(const Duration(milliseconds: 500), trailing: true).switchMap(mapper),
    );

    on<_CreateIngredient>((event, emit) async {
      final either = await _dietCommands.saveIngredient(event.ingredient);
      either.fold((f) => emit(IngredientsState.failure(failure: f)), (r) {});
    });

    on<_ChangeLibLanguage>((event, emit) async {
      emit(const IngredientsState.changingLanguage());
      final either = await _dietCommands.changeIngredientsLanguage(language: event.language);

      await either.fold((failure) async => emit(IngredientsState.failure(failure: failure)), (success) async {
        emit(IngredientsState.languageChangeSuccess(lang: event.language));

        // IMPORTANT: Re-trigger Started event to reload ingredients with the new language
        add(IngredientsEvent.started(event.language));
      });
    });
  }

  List<DietCategory> _extractCategories(List<Ingredient> ingredients) {
    final seenIds = <int>{};
    final categories = <DietCategory>[];
    for (final ing in ingredients) {
      if (!seenIds.contains(ing.categoryId)) {
        seenIds.add(ing.categoryId);
        categories.add(DietCategory(id: ing.categoryId, name: ing.categoryName));
      }
    }

    return (categories..sort((a, b) => a.name.compareTo(b.name)));
  }
}
