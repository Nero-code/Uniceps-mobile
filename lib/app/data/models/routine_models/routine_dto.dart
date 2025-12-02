// import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uniceps/app/data/models/routine_models/routine_day_dto.dart';
import 'package:uniceps/app/data/sources/local/database.dart' as db;
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart' as r;

// part 'routine_dto.freezed.dart';
part 'routine_dto.g.dart'; // Required for JSON serialization

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class RoutineDto {
  final int? id, apiId;

  @JsonKey(defaultValue: 0)
  final int version;

  @JsonKey(name: 'RoutineName')
  final String name;

  final String? description;

  @JsonKey(defaultValue: false)
  final bool isCurrent;

  @JsonKey(defaultValue: false)
  final bool isSynced;

  final DateTime? createdAt;
  final DateTime? updatedAt;
  @JsonKey(name: 'Days')
  final List<RoutineDayDto> daysDto;

  const RoutineDto({
    this.id,
    this.apiId,
    required this.version,
    required this.name,
    this.description,
    required this.isCurrent,
    this.createdAt,
    this.updatedAt,
    required this.daysDto,
    required this.isSynced,
  });

  factory RoutineDto.fromEntity(r.Routine e) => RoutineDto(
      id: e.id,
      apiId: e.apiId,
      version: e.version,
      name: e.name,
      description: e.description,
      isCurrent: e.isCurrent,
      createdAt: e.createdAt,
      updatedAt: e.updatedAt,
      daysDto: e.trainingDays.map(RoutineDayDto.fromEntity).toList(),
      isSynced: e.isSynced);
  r.Routine toEntity() => r.Routine(
      id: id,
      apiId: apiId,
      version: version,
      name: name,
      description: description,
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt ?? DateTime.now(),
      trainingDays: daysDto.map((d) => d.toEntity()).toList(),
      isCurrent: isCurrent,
      isSynced: isSynced);

  factory RoutineDto.fromJson(Map<String, dynamic> json) => _$RoutineDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RoutineDtoToJson(this);

  factory RoutineDto.fromTable(db.Routine r, [List<RoutineDayDto> days = const []]) => RoutineDto(
        id: r.id,
        apiId: r.apiId,
        version: r.version,
        name: r.name,
        description: r.description,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
        daysDto: days,
        isCurrent: r.isCurrent,
        isSynced: r.isSynced,
      );
}
