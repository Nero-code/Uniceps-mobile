import 'package:json_annotation/json_annotation.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/app/domain/classes/diet_classes/ingredient.dart' as entity;

part 'ingredient_model.g.dart';

@JsonSerializable()
class IngredientModel {
  final int? id;
  final String? apiId;
  final String name;
  final int categoryId;
  final String categoryName;
  @JsonKey(name: 'defaultServingInGrams')
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

  const IngredientModel({
    required this.id,
    required this.apiId,
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
    this.isUserGenerated = false,
    this.version = 0,
    this.isSynced = false,
  });

  factory IngredientModel.fromJson(Map<String, dynamic> json) => _$IngredientModelFromJson(json);
  Map<String, dynamic> toJson() => _$IngredientModelToJson(this);

  entity.Ingredient toEntity() => entity.Ingredient(
    id: id,
    apiId: apiId,
    name: name,
    categoryId: categoryId,
    categoryName: categoryName,
    servingSizeInGrams: servingSizeInGrams,
    calories: calories,
    protein: protein,
    carbs: carbs,
    fats: fats,
    isUserGenerated: isUserGenerated,
    version: version,
    isSynced: isSynced,
    updatedAt: updatedAt,
    createdAt: createdAt,
  );

  factory IngredientModel.fromEntity(entity.Ingredient i) => IngredientModel(
    id: i.id,
    apiId: i.apiId,
    isUserGenerated: i.isUserGenerated,
    name: i.name,
    categoryId: i.categoryId,
    categoryName: i.categoryName,
    servingSizeInGrams: i.servingSizeInGrams,
    calories: i.calories,
    protein: i.protein,
    carbs: i.carbs,
    fats: i.fats,
    version: i.version,
    isSynced: i.isSynced,
    updatedAt: i.updatedAt,
    createdAt: i.createdAt,
  );

  factory IngredientModel.fromCompanion(IngredientData data) => IngredientModel(
    id: data.id,
    apiId: data.apiId,
    isUserGenerated: data.isUserGenerated,
    name: data.name,
    categoryId: data.categoryId,
    categoryName: data.categoryName,
    servingSizeInGrams: data.servingSizeInGrams,
    calories: data.calories,
    protein: data.protein,
    carbs: data.carbs,
    fats: data.fats,
    version: data.version,
    isSynced: data.isSynced,
    updatedAt: data.updatedAt,
    createdAt: data.createdAt,
  );

  IngredientModel copyWith({
    int? id,
    String? apiId,
    String? name,
    int? categoryId,
    String? categoryName,
    double? servingSizeInGrams,
    double? calories,
    double? protein,
    double? carbs,
    double? fats,
    bool? isUserGenerated,
    int? version,
    bool? isSynced,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) => IngredientModel(
    id: id ?? this.id,
    apiId: apiId ?? this.apiId,
    name: name ?? this.name,
    categoryId: categoryId ?? this.categoryId,
    categoryName: categoryName ?? this.categoryName,
    servingSizeInGrams: servingSizeInGrams ?? this.servingSizeInGrams,
    calories: calories ?? this.calories,
    protein: protein ?? this.protein,
    carbs: carbs ?? this.carbs,
    fats: fats ?? this.fats,
    updatedAt: updatedAt ?? this.updatedAt,
    createdAt: createdAt ?? this.createdAt,
  );
}
