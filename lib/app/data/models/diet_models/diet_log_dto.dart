import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_log.dart';

part 'diet_log_dto.g.dart';

@JsonSerializable()
class DietLogDto {
  final int? id;
  final int? apiId;
  final String ingredientName;
  final double totalGrams;
  final double calories;
  final double protein;
  final double carbs;
  final double fats;
  final DateTime timestamp;
  @JsonKey(defaultValue: 0)
  final int version;
  @JsonKey(defaultValue: true)
  final bool isSynced;

  const DietLogDto({
    required this.id,
    required this.apiId,
    required this.ingredientName,
    required this.totalGrams,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fats,
    required this.timestamp,
    required this.version,
    required this.isSynced,
  });

  factory DietLogDto.fromJson(Map<String, dynamic> json) => _$DietLogDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DietLogDtoToJson(this);

  factory DietLogDto.fromCompanion(DietLogData data) => DietLogDto(
    id: data.id,
    apiId: data.apiId,
    ingredientName: data.name,
    totalGrams: data.totalGrams,
    calories: data.calories,
    protein: data.protein,
    carbs: data.carbs,
    fats: data.fats,
    timestamp: data.timestamp,
    version: data.version,
    isSynced: data.isSynced,
  );

  factory DietLogDto.fromEntity(DietLog log) => DietLogDto(
    id: log.id,
    apiId: log.apiId,
    ingredientName: log.ingredientName,
    totalGrams: log.totalGrams,
    calories: log.calories,
    protein: log.protein,
    carbs: log.carbs,
    fats: log.fats,
    timestamp: log.timestamp,
    version: log.version,
    isSynced: log.isSynced,
  );

  DietLog toEntity() => DietLog(
    id: id,
    apiId: apiId,
    ingredientName: ingredientName,
    totalGrams: totalGrams,
    calories: calories,
    protein: protein,
    carbs: carbs,
    fats: fats,
    timestamp: timestamp,
    version: version,
    isSynced: isSynced,
  );

  DietLogDto copyWith({
    int? id,
    int? apiId,
    String? ingredientName,
    double? totalGrams,
    double? calories,
    double? protein,
    double? carbs,
    double? fats,
    DateTime? timestamp,
    int? version,
    bool? isSynced,
  }) => DietLogDto(
    id: id ?? this.id,
    apiId: apiId ?? this.apiId,
    ingredientName: ingredientName ?? this.ingredientName,
    totalGrams: totalGrams ?? this.totalGrams,
    calories: calories ?? this.calories,
    protein: protein ?? this.protein,
    carbs: carbs ?? this.carbs,
    fats: fats ?? this.fats,
    timestamp: timestamp ?? this.timestamp,
    version: version ?? this.version,
    isSynced: isSynced ?? this.isSynced,
  );
}
