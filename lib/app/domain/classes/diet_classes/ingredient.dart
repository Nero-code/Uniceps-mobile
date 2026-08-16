class Ingredient {
  final int? id;
  final String name;
  final String? category;
  final double servingSizeInGrams;
  final double calories;
  final double protein;
  final double carbs;
  final double fats;

  const Ingredient({
    this.id,
    required this.name,
    required this.category,
    required this.servingSizeInGrams,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fats,
  });
}
