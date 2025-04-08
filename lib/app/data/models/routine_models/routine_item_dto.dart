import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/data/models/base_dto.dart';
import 'package:uniceps/app/data/models/routine_models/exercise_v2_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_set_dto.dart';
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
    required super.version,
    required this.exerciseV2Dto,
    required this.setsDto,
    required super.isSynced,
  }) : super(exercise: exerciseV2Dto, sets: setsDto);

  factory RoutineItemDto.fromJson(Map<String, dynamic> json) =>
      _$RoutineItemDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RoutineItemDtoToJson(this);
}
