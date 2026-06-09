// import 'package:json_annotation/json_annotation.dart';
import 'package:uniceps/app/data/models/routine_models/exercise_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_set_dto.dart';
import 'package:uniceps/app/data/sources/local/database.dart' as db;
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart' as ri;

// part 'routine_item_dto.freezed.dart';
// part 'routine_item_dto.g.dart';

// @freezed
// @JsonSerializable(explicitToJson: true)

/// This class is not [JsonSerializable] because of data-structure mismatch.
///
/// Exercise is flattened inside the json so we can't use explicitToJson on
/// exercise anymore, that's why we implemented a new (from/to)Json methods
class RoutineItemDto {
  final int? id, apiId;
  final int dayId, version;
  final int index;
  final bool isSynced;
  final ExerciseDto exerciseDto;
  final List<RoutineSetDto> setsDto;
  final String? description;

  const RoutineItemDto({
    required this.id,
    required this.apiId,
    required this.dayId,
    required this.index,
    required this.version,
    required this.exerciseDto,
    required this.setsDto,
    required this.isSynced,
    this.description,
  });
  factory RoutineItemDto.create(int dayId, int index, ExerciseDto exercise) => RoutineItemDto(
    id: null,
    apiId: null,
    dayId: dayId,
    index: index,
    version: 0,
    exerciseDto: exercise,
    setsDto: [],
    isSynced: false,
  );

  factory RoutineItemDto.fromEntity(ri.RoutineItem entity) => RoutineItemDto(
    id: entity.id,
    apiId: entity.apiId,
    dayId: entity.dayId,
    index: entity.index,
    exerciseDto: ExerciseDto.fromEntity(entity.exercise),
    setsDto: entity.sets.map(RoutineSetDto.fromEntity).toList(),
    description: entity.description,
    version: entity.version,
    isSynced: entity.isSynced,
  );
  ri.RoutineItem toEntity() => ri.RoutineItem(
    id: id,
    apiId: apiId,
    dayId: dayId,
    index: index,
    exercise: exerciseDto.toEntity(),
    sets: setsDto.map((e) => e.toEntity()).toList(),
    description: description,
    version: version,
    isSynced: isSynced,
  );

  //
  //
  // factory RoutineItemDto.fromJson(Map<String, dynamic> json) => _$RoutineItemDtoFromJson(json);
  factory RoutineItemDto.fromJson(Map<String, dynamic> json) => RoutineItemDto(
    id: (json['id'] as num?)?.toInt(),
    apiId: (json['apiId'] as num?)?.toInt(),
    dayId: (json['dayId'] as num?)?.toInt() ?? 0,
    index: (json['Order'] as num).toInt(),
    exerciseDto: ExerciseDto.fromFile(json), // Flat Exercise
    setsDto: (json['Sets'] as List<dynamic>).map((e) => RoutineSetDto.fromJson(e as Map<String, dynamic>)).toList(),
    description: json['description'] as String?,
    version: (json['version'] as num?)?.toInt() ?? 0,
    isSynced: json['isSynced'] as bool? ?? false,
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'apiId': apiId,
    'dayId': dayId,
    'Order': index,
    ...exerciseDto.toFile(),
    'Sets': setsDto.map((e) => e.toJson()).toList(),
    'description': description,
    'version': version,
    'isSynced': isSynced,
  };

  //
  //
  //
  factory RoutineItemDto.fromTable(db.RoutineItem item, ExerciseDto exercise, [List<RoutineSetDto> sets = const []]) =>
      RoutineItemDto(
        id: item.id,
        apiId: item.apiId,
        dayId: item.dayId,
        index: item.index,
        exerciseDto: exercise,
        setsDto: sets,
        description: item.notes,
        version: item.version,
        isSynced: item.isSynced,
      );

  RoutineItemDto copyWith({
    int? id,
    int? apiId,
    int? dayId,
    int? index,
    ExerciseDto? exerciseDto,
    List<RoutineSetDto>? setsDto,
    String? description,
    int? version,
    bool? isSynced,
  }) => RoutineItemDto(
    id: id ?? this.id,
    apiId: apiId ?? this.apiId,
    dayId: dayId ?? this.dayId,
    index: index ?? this.index,
    exerciseDto: exerciseDto ?? this.exerciseDto,
    setsDto: setsDto ?? this.setsDto,
    description: description ?? this.description,
    version: version ?? this.version,
    isSynced: isSynced ?? this.isSynced,
  );
}
