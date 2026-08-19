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
}
