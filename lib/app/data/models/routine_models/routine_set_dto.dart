import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/data/models/base_dto.dart';
import 'package:uniceps/app/data/sources/local/database.dart' as db;
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

  factory RoutineSetDto.fromTable(db.Set set) => RoutineSetDto(
      id: set.id,
      apiId: set.apiId,
      routineItemId: set.routineItemId,
      version: set.version,
      index: set.roundIndex,
      reps: set.repsCount,
      isSynced: set.isSynced);

  @override
  Map<String, dynamic> toJson() => _$RoutineSetDtoToJson(this);
}
