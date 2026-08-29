import 'package:uniceps/app/domain/classes/diet_classes/ingredient.dart';

class DietLog {
  final int? id;
  final int? apiId;
  final String ingredientName;
  final double totalGrams;
  final double calories;
  final double protein;
  final double carbs;
  final double fats;
  final DateTime timestamp;
  final int version;
  final bool isSynced;

  const DietLog({
    required this.id,
    required this.apiId,
    required this.ingredientName,
    required this.totalGrams,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fats,
    required this.timestamp,
    this.version = 0,
    this.isSynced = false,
  });

  factory DietLog.fromIngredient(Ingredient ing, double amountInGrams, {DateTime? timestamp}) {
    final ratio = amountInGrams / ing.servingSizeInGrams;
    return DietLog(
      id: null,
      apiId: null,
      ingredientName: ing.name,
      totalGrams: amountInGrams,
      calories: ing.calories * ratio,
      protein: ing.protein * ratio,
      carbs: ing.carbs * ratio,
      fats: ing.fats * ratio,
      timestamp: timestamp ?? DateTime.now(),
    );
  }
}
