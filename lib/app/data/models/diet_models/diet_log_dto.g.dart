// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet_log_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DietLogDto _$DietLogDtoFromJson(Map<String, dynamic> json) => DietLogDto(
  id: (json['id'] as num?)?.toInt(),
  apiId: (json['apiId'] as num?)?.toInt(),
  ingredientName: json['ingredientName'] as String,
  totalGrams: (json['totalGrams'] as num).toDouble(),
  calories: (json['calories'] as num).toDouble(),
  protein: (json['protein'] as num).toDouble(),
  carbs: (json['carbs'] as num).toDouble(),
  fats: (json['fats'] as num).toDouble(),
  timestamp: DateTime.parse(json['timestamp'] as String),
  version: (json['version'] as num).toInt(),
  isSynced: json['isSynced'] as bool,
);

Map<String, dynamic> _$DietLogDtoToJson(DietLogDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'apiId': instance.apiId,
      'ingredientName': instance.ingredientName,
      'totalGrams': instance.totalGrams,
      'calories': instance.calories,
      'protein': instance.protein,
      'carbs': instance.carbs,
      'fats': instance.fats,
      'timestamp': instance.timestamp.toIso8601String(),
      'version': instance.version,
      'isSynced': instance.isSynced,
    };
