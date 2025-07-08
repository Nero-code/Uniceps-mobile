import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/data/models/routine_models/routine_item_dto.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart'
    as rd;

// part 'routine_day_dto.freezed.dart';
part 'routine_day_dto.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class RoutineDayDto {
  final int? id, apiId;
  final int index, routineId, version;
  final String name;
  final bool isSynced;
  final List<RoutineItemDto> items;

  const RoutineDayDto({
    required this.id,
    required this.apiId,
    required this.routineId,
    required this.version,
    required this.name,
    required this.index,
    required this.items,
    required this.isSynced,
  });

  factory RoutineDayDto.fromEntity(rd.RoutineDay e) => RoutineDayDto(
      id: e.id,
      apiId: e.apiId,
      routineId: e.routineId,
      version: e.version,
      name: e.name,
      index: e.index,
      items: e.exercises.map(RoutineItemDto.fromEntity).toList(),
      isSynced: e.isSynced);

  rd.RoutineDay toEntity() => rd.RoutineDay(
        id: id,
        apiId: apiId,
        routineId: routineId,
        name: name,
        index: index,
        exercises: items.map((i) => i.toEntity()).toList(),
        version: version,
        isSynced: isSynced,
      );

  factory RoutineDayDto.fromJson(Map<String, dynamic> json) =>
      _$RoutineDayDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RoutineDayDtoToJson(this);

  factory RoutineDayDto.fromTable(DaysGroupData day,
          [List<RoutineItemDto> items = const []]) =>
      RoutineDayDto(
          id: day.id,
          apiId: day.apiId,
          routineId: day.routineId,
          version: day.version,
          name: day.dayName,
          index: day.index,
          items: items,
          isSynced: day.isSynced);

  RoutineDayDto copyWith({
    int? id,
    int? apiId,
    int? index,
    int? routineId,
    int? version,
    String? name,
    List<RoutineItemDto>? items,
    bool? isSynced,
  }) =>
      RoutineDayDto(
          id: id ?? this.id,
          apiId: apiId ?? this.apiId,
          routineId: routineId ?? this.routineId,
          version: version ?? this.version,
          name: name ?? this.name,
          index: index ?? this.index,
          items: items ?? this.items,
          isSynced: isSynced ?? this.isSynced);
}
