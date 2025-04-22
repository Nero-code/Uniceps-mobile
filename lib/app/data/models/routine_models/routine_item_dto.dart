import 'package:flutter/foundation.dart';
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

  factory RoutineItemDto.fromTable(db.RoutineItem item, db.Exercise exercise,
          db.ExerciseGroup group, String imageUrl, Uint8List? imageBitMap,
          [List<db.Set> sets = const []]) =>
      RoutineItemDto(
          id: item.id,
          apiId: item.apiId,
          dayId: item.day,
          index: item.index,
          version: item.version,
          exerciseV2Dto:
              ExerciseV2Dto.fromTable(exercise, group, imageUrl, imageBitMap),
          setsDto: sets.map((set) => RoutineSetDto.fromTable(set)).toList(),
          isSynced: item.isSynced);

  @override
  Map<String, dynamic> toJson() => _$RoutineItemDtoToJson(this);
}
