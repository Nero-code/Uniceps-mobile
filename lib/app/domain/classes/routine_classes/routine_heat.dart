import 'package:flutter/material.dart';

class RoutineHeat {
  final String routineName;
  final int sessionCount;
  final int? lastdayId;
  final Duration duration;
  final int days;
  final int exercises;
  final int sets;

  double get value {
    final countNorm = sessionCount / 30;
    final timeNorm = duration.inDays / 60;
    final norm = countNorm - timeNorm > 0 ? countNorm : timeNorm;

    if (norm >= 1) return 1;
    return norm;
  }

  Color get color {
    final countNorm = sessionCount / 30;
    final timeNorm = duration.inDays / 60;
    final norm = countNorm - timeNorm > 0 ? countNorm : timeNorm;

    if (norm >= 1) return Colors.red;
    if (norm >= .75) return Color.lerp(Colors.amber, Colors.red, (norm - .75) * 4)!;
    if (norm > 0) return Colors.blue;
    return Colors.green;
  }

  const RoutineHeat({
    required this.routineName,
    required this.sessionCount,
    required this.duration,
    required this.days,
    required this.exercises,
    required this.sets,
    this.lastdayId,
  });

  factory RoutineHeat.cold(String name) => RoutineHeat(
        routineName: name,
        sessionCount: 0,
        duration: Duration.zero,
        days: 0,
        exercises: 0,
        sets: 0,
      );
}
