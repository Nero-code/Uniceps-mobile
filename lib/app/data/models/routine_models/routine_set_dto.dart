import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/data/models/base_dto.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';

// part 'routine_day_dto.freezed.dart';
part 'routine_set_dto.g.dart';

@JsonSerializable()
class RoutineSetDto extends RoutineSet implements BaseDTO {
  const RoutineSetDto(
      {required super.id,
      required super.apiId,
      required super.routineItemId,
      required super.version,
      required super.index,
      required super.reps,
      required super.isSynced});

  factory RoutineSetDto.fromJson(Map<String, dynamic> json) =>
      _$RoutineSetDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RoutineSetDtoToJson(this);
}
