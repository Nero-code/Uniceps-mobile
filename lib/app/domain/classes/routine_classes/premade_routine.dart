import 'package:uniceps/core/constants/constants.dart';

class PremadeRoutine {
  final String apiId;
  final String title;
  final String description;
  final RoutineLevel level;
  final Gender targetGender;
  final int daysCount;

  const PremadeRoutine({
    required this.apiId,
    required this.title,
    required this.description,
    required this.level,
    required this.targetGender,
    required this.daysCount,
  });

  factory PremadeRoutine.fromJson(Map<String, dynamic> json) => PremadeRoutine(
    apiId: json['apiId'],
    title: json['title'],
    description: json['description'],
    level: parseRoutineLevel(json['level'] as int),
    targetGender: parseGender(json['targetGender'] as int),
    daysCount: json['daysCount'],
  );

  Map<String, dynamic> toJson() => {
    'apiId': apiId,
    'title': title,
    'description': description,
    'level': level.val,
    'targetGender': targetGender.val,
    'daysCount': daysCount,
  };
}
