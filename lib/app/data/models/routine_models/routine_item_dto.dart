import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/data/models/base_dto.dart';
import 'package:uniceps/app/data/models/routine_models/exercise_v2_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_set_dto.dart';
import 'package:uniceps/app/data/sources/local/database.dart' as db;
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';

// part 'routine_item_dto.freezed.dart';
part 'routine_item_dto.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class RoutineItemDto extends RoutineItem implements BaseDTO {
  final ExerciseV2Dto exerciseV2Dto;
  final List<RoutineSetDto> setsDto;
  const RoutineItemDto({
    required super.id,
    required super.apiId,
    required super.dayId,
    required super.index,
    required super.version,
    required this.exerciseV2Dto,
    required this.setsDto,
    required super.isSynced,
  }) : super(exercise: exerciseV2Dto, sets: setsDto);

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

  RoutineItemDto copyDtoWith({
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

  @override
  Map<String, dynamic> toJson() => _$RoutineItemDtoToJson(this);
}
