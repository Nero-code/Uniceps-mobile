import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/app/data/models/diet_models/ingredient_model.dart';
import 'package:uniceps/app/domain/contracts/diet/i_diet_service.dart';

class DietService {
  final IDietService _dietRepo;
  final Logger _logger;

  DietService(this._dietRepo, this._logger);

  Future<void> syncIngredients() async {
    try {
      final ingredientsEither = await _dietRepo.getIngredients();
      bool shouldSync = false;

      ingredientsEither.fold((l) => shouldSync = true, (r) => shouldSync = r.isEmpty);

      if (shouldSync) {
        _logger.i("Syncing diet ingredients from assets...");
        final String response = await rootBundle.loadString('assets/inge.json');
        final List<dynamic> data = json.decode(response);

        final ingredients = data.map((json) {
          // Map JSON fields to match Ingredient entity/model
          return IngredientModel.fromJson(json).toEntity();
        }).toList();

        await _dietRepo.saveIngredients(ingredients);
        _logger.i("Diet ingredients synced successfully.");
      }
    } catch (e) {
      _logger.e("Error syncing diet ingredients: $e");
    }
  }
}
