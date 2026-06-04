// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientModel _$IngredientModelFromJson(Map<String, dynamic> json) =>
    IngredientModel(
      code: json['code'] as String,
      nameAr: json['name_ar'] as String,
      nameEn: json['name_en'] as String,
      category: json['category'] as String,
      servingSizeInGrams: (json['serving_size_g'] as num).toDouble(),
      calories: (json['calories'] as num).toDouble(),
      protein: (json['protein'] as num).toDouble(),
      carbs: (json['carbs'] as num).toDouble(),
      fats: (json['fats'] as num).toDouble(),
    );

Map<String, dynamic> _$IngredientModelToJson(IngredientModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name_ar': instance.nameAr,
      'name_en': instance.nameEn,
      'category': instance.category,
      'serving_size_g': instance.servingSizeInGrams,
      'calories': instance.calories,
      'protein': instance.protein,
      'carbs': instance.carbs,
      'fats': instance.fats,
    };
