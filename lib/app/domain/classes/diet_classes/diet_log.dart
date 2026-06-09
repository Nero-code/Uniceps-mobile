class DietLog {
  final int? id;
  final int? apiId;
  final int? dayId;
  final int? mealId;
  final String ingredientName;
  final double servingSizeInGrams;
  final double calories;
  final double protein;
  final double carbs;
  final double fats;
  final DateTime timestamp;
  final bool isExtra;
  final int version;
  final bool isSynced;

  const DietLog({
    required this.id,
    required this.apiId,
    required this.dayId,
    required this.mealId,
    required this.ingredientName,
    required this.servingSizeInGrams,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fats,
    required this.timestamp,
    this.isExtra = false,
    this.version = 0,
    this.isSynced = false,
  });
}
