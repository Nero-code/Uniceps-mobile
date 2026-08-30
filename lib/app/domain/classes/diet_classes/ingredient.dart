class Ingredient {
  final int? id;
  final String? apiId;
  final String name;
  final int categoryId;
  final String categoryName;
  final double servingSizeInGrams;
  final double calories;
  final double protein;
  final double carbs;
  final double fats;
  final bool isUserGenerated;
  final int version;
  final bool isSynced;
  final DateTime updatedAt;
  final DateTime createdAt;

  const Ingredient({
    this.id,
    this.apiId,
    required this.name,
    required this.categoryId,
    required this.categoryName,
    required this.servingSizeInGrams,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fats,
    required this.updatedAt,
    required this.createdAt,
    required this.isUserGenerated,
    this.version = 0,
    this.isSynced = false,
  });
}
