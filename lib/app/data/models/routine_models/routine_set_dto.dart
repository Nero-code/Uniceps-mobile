// import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/data/sources/local/database.dart' as db;
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart' as rs;

// part 'routine_day_dto.freezed.dart';
part 'routine_set_dto.g.dart';

// fieldRename: FieldRename.pascal   # NOT NEEDED
@JsonSerializable()
class RoutineSetDto {
  final int? id, apiId;

  @JsonKey(defaultValue: 0)
  final int routineItemId;

  @JsonKey(name: 'Order')
  final int index;

  @JsonKey(name: 'Repetition')
  final int reps;

  @JsonKey(defaultValue: 0)
  final int version;

  @JsonKey(defaultValue: false)
  final bool isSynced;

  final double? weight;

  const RoutineSetDto({
    required this.id,
    required this.apiId,
    required this.routineItemId,
    required this.version,
    required this.index,
    required this.reps,
    required this.weight,
    required this.isSynced,
  });

  factory RoutineSetDto.fromEntity(rs.RoutineSet e) => RoutineSetDto(
    id: e.id,
    apiId: e.apiId,
    routineItemId: e.routineItemId,
    version: e.version,
    index: e.index,
    reps: e.reps,
    weight: e.weight,
    isSynced: e.isSynced,
  );

  rs.RoutineSet toEntity() => rs.RoutineSet(
    id: id,
    apiId: apiId,
    routineItemId: routineItemId,
    version: version,
    index: index,
    reps: reps,
    weight: weight,
    isSynced: isSynced,
  );

  factory RoutineSetDto.fromJson(Map<String, dynamic> json) => _$RoutineSetDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RoutineSetDtoToJson(this);

  factory RoutineSetDto.fromTable(db.RoutineSet setItem, [double? weight]) => RoutineSetDto(
    id: setItem.id,
    apiId: setItem.apiId,
    routineItemId: setItem.routineItemId,
    version: setItem.version,
    index: setItem.roundIndex,
    reps: setItem.repsCount,
    weight: weight,
    isSynced: setItem.isSynced,
  );

  RoutineSetDto copyWith({
    int? id,
    int? apiId,
    int? routineItemId,
    int? index,
    int? reps,
    double? weight,
    int? version,
    bool? isSynced,
  }) => RoutineSetDto(
    id: id ?? this.id,
    apiId: apiId ?? this.apiId,
    routineItemId: routineItemId ?? this.routineItemId,
    version: version ?? this.version,
    index: index ?? this.index,
    reps: reps ?? this.reps,
    weight: weight ?? this.weight,
    isSynced: isSynced ?? this.isSynced,
  );
}
