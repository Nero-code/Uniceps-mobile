// import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uniceps/app/data/models/routine_models/routine_day_dto.dart';
import 'package:uniceps/app/data/sources/local/database.dart' as db;
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart' as r;

// part 'routine_dto.freezed.dart';
part 'routine_dto.g.dart'; // Required for JSON serialization

@JsonSerializable(explicitToJson: true)
class RoutineDto {
  final int? id, apiId;
  final int version;
  final String name;
  final String? description;
  final bool isCurrent, isSynced;
  final DateTime createdAt, updatedAt;
  final List<RoutineDayDto> trainingDaysDto;

  const RoutineDto({
    required this.id,
    required this.apiId,
    required this.version,
    required this.name,
    required this.description,
    required this.isCurrent,
    required this.createdAt,
    required this.updatedAt,
    required this.trainingDaysDto,
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
      trainingDaysDto: e.trainingDays.map(RoutineDayDto.fromEntity).toList(),
      isSynced: e.isSynced);
  r.Routine toEntity() => r.Routine(
      id: id,
      apiId: apiId,
      version: version,
      name: name,
      description: description,
      createdAt: createdAt,
      updatedAt: updatedAt,
      trainingDays: trainingDaysDto.map((d) => d.toEntity()).toList(),
      isSynced: isSynced);

  factory RoutineDto.fromJson(Map<String, dynamic> json) =>
      _$RoutineDtoFromJson(json);

  factory RoutineDto.fromTable(db.Routine r,
          [List<RoutineDayDto> days = const []]) =>
      RoutineDto(
        id: r.id,
        apiId: r.apiId,
        version: r.version,
        name: r.name,
        description: r.description,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
        trainingDaysDto: days,
        isCurrent: r.isCurrent,
        isSynced: r.isSynced,
      );

  Map<String, dynamic> toJson() => _$RoutineDtoToJson(this);
}

// @JsonSerializable(explicitToJson: true)
// class RoutineDto implements BaseDTO {
//   final List<RoutineDayDto> trainingDaysDto;
//
//   final int? id, apiId;
//   final int version;
//   final String name;
//   final String? description;
//   final bool isCurrent, isSynced;
//   final DateTime createdAt, updatedAt;
//
//   const RoutineDto({
//     required this.id,
//     required this.apiId,
//     required this.version,
//     required this.name,
//     required this.description,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.trainingDaysDto,
//     required this.isSynced,
//     required this.isCurrent,
//   });
//
//   factory RoutineDto.fromJson(Map<String, dynamic> json) =>
//       _$RoutineDtoFromJson(json);
//
//   factory RoutineDto.fromTable(db.Routine r,
//           [List<RoutineDayDto> days = const []]) =>
//       RoutineDto(
//         id: r.id,
//         apiId: r.apiId,
//         version: r.version,
//         name: r.name,
//         description: r.description,
//         createdAt: r.createdAt,
//         updatedAt: r.updatedAt,
//         trainingDaysDto: days,
//         isCurrent: r.isCurrent,
//         isSynced: r.isSynced,
//       );
//
//   @override
//   Map<String, dynamic> toJson() => _$RoutineDtoToJson(this);
// }