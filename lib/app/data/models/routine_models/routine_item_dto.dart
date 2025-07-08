import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/data/models/routine_models/exercise_v2_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_set_dto.dart';
import 'package:uniceps/app/data/sources/local/database.dart' as db;
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart'
    as ri;

// part 'routine_item_dto.freezed.dart';
part 'routine_item_dto.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class RoutineItemDto {
  final int? id, apiId;
  final int dayId, index, version;
  final bool isSynced;
  final ExerciseV2Dto exerciseV2Dto;
  final List<RoutineSetDto> setsDto;
  const RoutineItemDto({
    required this.id,
    required this.apiId,
    required this.dayId,
    required this.index,
    required this.version,
    required this.exerciseV2Dto,
    required this.setsDto,
    required this.isSynced,
  });

  factory RoutineItemDto.fromEntity(ri.RoutineItem entity) => RoutineItemDto(
        id: entity.id,
        apiId: entity.apiId,
        dayId: entity.dayId,
        index: entity.index,
        version: entity.version,
        exerciseV2Dto: ExerciseV2Dto.fromEntity(entity.exercise),
        setsDto: entity.sets.map(RoutineSetDto.fromEntity).toList(),
        isSynced: entity.isSynced,
      );

  factory RoutineItemDto.create(int dayId, int index, ExerciseV2Dto exercise) =>
      RoutineItemDto(
        id: null,
        apiId: null,
        dayId: dayId,
        index: index,
        version: 0,
        exerciseV2Dto: exercise,
        setsDto: [],
        isSynced: false,
      );

  ri.RoutineItem toEntity() => ri.RoutineItem(
      id: id,
      apiId: apiId,
      dayId: dayId,
      index: index,
      version: version,
      exercise: exerciseV2Dto.toEntity(),
      sets: setsDto.map((e) => e.toEntity()).toList(),
      isSynced: isSynced);

  factory RoutineItemDto.fromJson(Map<String, dynamic> json) =>
      _$RoutineItemDtoFromJson(json);

  factory RoutineItemDto.fromTable(db.RoutineItem item, ExerciseV2Dto exercise,
          [List<RoutineSetDto> sets = const []]) =>
      RoutineItemDto(
        id: item.id,
        apiId: item.apiId,
        dayId: item.dayId,
        index: item.index,
        version: item.version,
        exerciseV2Dto: exercise,
        setsDto: sets,
        isSynced: item.isSynced,
      );

  RoutineItemDto copyWith({
    int? id,
    int? apiId,
    int? dayId,
    int? index,
    int? version,
    ExerciseV2Dto? exerciseV2Dto,
    List<RoutineSetDto>? setsDto,
    bool? isSynced,
  }) =>
      RoutineItemDto(
        id: id ?? this.id,
        apiId: apiId ?? this.apiId,
        dayId: dayId ?? this.dayId,
        index: index ?? this.index,
        version: version ?? this.version,
        exerciseV2Dto: exerciseV2Dto ?? this.exerciseV2Dto,
        setsDto: setsDto ?? this.setsDto,
        isSynced: isSynced ?? this.isSynced,
      );

  Map<String, dynamic> toJson() => _$RoutineItemDtoToJson(this);
}
