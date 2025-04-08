import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/data/models/base_dto.dart';
import 'package:uniceps/app/data/models/routine_models/routine_item_dto.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';

// part 'routine_day_dto.freezed.dart';
part 'routine_day_dto.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class RoutineDayDto extends RoutineDay implements BaseDTO {
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

  @override
  Map<String, dynamic> toJson() => _$RoutineDayDtoToJson(this);
}
