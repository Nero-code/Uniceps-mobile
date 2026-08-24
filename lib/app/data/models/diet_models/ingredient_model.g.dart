// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientModel _$IngredientModelFromJson(Map<String, dynamic> json) =>
    IngredientModel(
      id: (json['id'] as num?)?.toInt(),
      apiId: json['apiId'] as String?,
      name: json['name'] as String,
      categoryId: (json['categoryId'] as num).toInt(),
      categoryName: json['categoryName'] as String,
      servingSizeInGrams: (json['defaultServingInGrams'] as num).toDouble(),
      calories: (json['calories'] as num).toDouble(),
      protein: (json['protein'] as num).toDouble(),
      carbs: (json['carbs'] as num).toDouble(),
      fats: (json['fats'] as num).toDouble(),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      isUserGenerated: json['isUserGenerated'] as bool? ?? false,
      version: (json['version'] as num?)?.toInt() ?? 0,
      isSynced: json['isSynced'] as bool? ?? false,
    );

Map<String, dynamic> _$IngredientModelToJson(IngredientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'apiId': instance.apiId,
      'name': instance.name,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'defaultServingInGrams': instance.servingSizeInGrams,
      'calories': instance.calories,
      'protein': instance.protein,
      'carbs': instance.carbs,
      'fats': instance.fats,
      'isUserGenerated': instance.isUserGenerated,
      'version': instance.version,
      'isSynced': instance.isSynced,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
    };
