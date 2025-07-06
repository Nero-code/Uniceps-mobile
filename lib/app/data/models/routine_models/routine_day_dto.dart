import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/data/models/routine_models/routine_item_dto.dart';
import 'package:uniceps/app/data/sources/local/database.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';

// part 'routine_day_dto.freezed.dart';
part 'routine_day_dto.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class RoutineDayDto extends RoutineDay {
  final List<RoutineItemDto> items;
  const RoutineDayDto({
    required super.id,
    required super.apiId,
    required super.routineId,
    required super.version,
    required super.name,
    required super.index,
    required this.items,
    required super.isSynced,
  }) : super(exercises: items);

  factory RoutineDayDto.fromJson(Map<String, dynamic> json) =>
      _$RoutineDayDtoFromJson(json);

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

  RoutineDayDto copyDtoWith({
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

  Map<String, dynamic> toJson() => _$RoutineDayDtoToJson(this);
}
