import 'package:uniceps/app/domain/classes/diet_classes/diet_day.dart';

class DietPlan {
  final int? id;
  final String name;
  final String? description;
  final bool isCurrent;
  final DateTime createdAt;
  final List<DietDay> days;

  const DietPlan({
    this.id,
    required this.name,
    this.description,
    this.isCurrent = false,
    required this.createdAt,
    this.days = const [],
  });

  DietPlan copyWith({
    int? id,
    String? name,
    String? description,
    bool? isCurrent,
    DateTime? createdAt,
    List<DietDay>? days,
  }) {
    return DietPlan(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      isCurrent: isCurrent ?? this.isCurrent,
      createdAt: createdAt ?? this.createdAt,
      days: days ?? this.days,
    );
  }
}
