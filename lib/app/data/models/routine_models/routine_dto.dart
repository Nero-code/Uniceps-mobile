import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/data/models/base_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_day_dto.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';

// part 'routine_dto.freezed.dart';
part 'routine_dto.g.dart'; // Required for JSON serialization

@freezed
@JsonSerializable(explicitToJson: true)
class RoutineDto extends Routine implements BaseDTO {
  final List<RoutineDayDto> trainingDaysDto;

  const RoutineDto({
    required super.id,
    required super.apiId,
    required super.issuerId,
    required super.version,
    required super.name,
    required super.description,
    required super.createdAt,
    required super.updatedAt,
    required this.trainingDaysDto,
    required super.isSynced,
    super.isCurrent,
  }) : super(
          trainingDays: trainingDaysDto,
        );

  factory RoutineDto.fromJson(Map<String, dynamic> json) =>
      _$RoutineDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RoutineDtoToJson(this);
}
