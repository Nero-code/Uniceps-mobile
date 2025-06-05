import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/data/models/base_dto.dart';
import 'package:uniceps/app/data/sources/local/database.dart' as db;
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';

// part 'routine_day_dto.freezed.dart';
part 'routine_set_dto.g.dart';

@JsonSerializable()
class RoutineSetDto extends RoutineSet implements BaseDTO {
  const RoutineSetDto({
    required super.id,
    required super.apiId,
    required super.routineItemId,
    required super.version,
    required super.index,
    required super.reps,
    required super.weight,
    required super.isSynced,
  });

  factory RoutineSetDto.fromJson(Map<String, dynamic> json) =>
      _$RoutineSetDtoFromJson(json);

  factory RoutineSetDto.fromTable(db.RoutineSet setItem, [double? weight]) =>
      RoutineSetDto(
          id: setItem.id,
          apiId: setItem.apiId,
          routineItemId: setItem.routineItemId,
          version: setItem.version,
          index: setItem.roundIndex,
          reps: setItem.repsCount,
          weight: weight,
          isSynced: setItem.isSynced);

  @override
  RoutineSetDto copyWith({
    int? id,
    int? apiId,
    int? routineItemId,
    int? index,
    int? reps,
    double? weight,
    int? version,
    bool? isSynced,
  }) =>
      RoutineSetDto(
          id: id ?? this.id,
          apiId: apiId ?? this.apiId,
          routineItemId: routineItemId ?? this.routineItemId,
          version: version ?? this.version,
          index: index ?? this.index,
          reps: reps ?? this.reps,
          weight: weight ?? this.weight,
          isSynced: isSynced ?? this.isSynced);

  @override
  Map<String, dynamic> toJson() => _$RoutineSetDtoToJson(this);
}
