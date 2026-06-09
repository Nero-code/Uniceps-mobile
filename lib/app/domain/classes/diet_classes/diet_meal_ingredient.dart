import 'package:uniceps/app/domain/classes/diet_classes/ingredient.dart';

class DietMealIngredient {
  final int? id;
  final double amount; // in grams
  final int index;

  final String code;
  final String nameAr;
  final String nameEn;
  final String category;
  final String? description;
  final double servingSizeInGrams;
  final double calories;
  final double protein;
  final double carbs;
  final double fats;

  const DietMealIngredient({
    required this.id,
    required this.amount,
    required this.index,
    required this.code,
    required this.nameAr,
    required this.nameEn,
    required this.category,
    required this.description,
    required this.servingSizeInGrams,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fats,
  });

  double get caloriesPerAmount => calories * (amount / 100);
  double get proteinPerAmount => protein * (amount / 100);
  double get carbsPerAmount => carbs * (amount / 100);
  double get fatsPerAmount => fats * (amount / 100);

  DietMealIngredient copyWith({
    int? id,
    Ingredient? ingredient,
    double? amount,
    int? index,
    String? code,
    String? nameAr,
    String? nameEn,
    String? category,
    String? description,
    double? servingSizeInGrams,
    double? calories,
    double? protein,
    double? carbs,
    double? fats,
  }) => DietMealIngredient(
    id: id ?? this.id,
    amount: amount ?? this.amount,
    index: index ?? this.index,
    code: code ?? this.code,
    nameAr: nameAr ?? this.nameAr,
    nameEn: nameEn ?? this.nameEn,
    category: category ?? this.category,
    description: description ?? this.description,
    servingSizeInGrams: servingSizeInGrams ?? this.servingSizeInGrams,
    calories: calories ?? this.calories,
    protein: protein ?? this.protein,
    carbs: carbs ?? this.carbs,
    fats: fats ?? this.fats,
  );
}
