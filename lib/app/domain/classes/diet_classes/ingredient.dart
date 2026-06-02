class Ingredient {
  final String code;
  final String nameAr;
  final String nameEn;
  final String category;
  final double servingSizeInGrams;
  final double calories;
  final double protein;
  final double carbs;
  final double fats;

  const Ingredient({
    required this.code,
    required this.nameAr,
    required this.nameEn,
    required this.category,
    required this.servingSizeInGrams,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fats,
  });
}
