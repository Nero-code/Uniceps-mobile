// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet_meal_ingredient_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DietMealIngredientDto _$DietMealIngredientDtoFromJson(
  Map<String, dynamic> json,
) => DietMealIngredientDto(
  id: (json['id'] as num?)?.toInt(),
  amount: (json['amount'] as num).toDouble(),
  index: (json['index'] as num).toInt(),
  code: json['code'] as String,
  nameAr: json['name_ar'] as String,
  nameEn: json['name_en'] as String,
  category: json['category'] as String,
  description: json['description'] as String?,
  servingSizeInGrams: (json['serving_size_g'] as num).toDouble(),
  calories: (json['calories'] as num).toDouble(),
  protein: (json['protein'] as num).toDouble(),
  carbs: (json['carbs'] as num).toDouble(),
  fats: (json['fats'] as num).toDouble(),
);

Map<String, dynamic> _$DietMealIngredientDtoToJson(
  DietMealIngredientDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'amount': instance.amount,
  'index': instance.index,
  'code': instance.code,
  'name_ar': instance.nameAr,
  'name_en': instance.nameEn,
  'category': instance.category,
  'description': instance.description,
  'serving_size_g': instance.servingSizeInGrams,
  'calories': instance.calories,
  'protein': instance.protein,
  'carbs': instance.carbs,
  'fats': instance.fats,
};
