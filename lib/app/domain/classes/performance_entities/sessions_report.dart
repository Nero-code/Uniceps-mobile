import 'package:flutter/material.dart';

class SessionsReport {
  final Duration maxDuration;
  final Duration avgDuration;
  final Duration minDuration;

  final Duration totalDuration;

  final int sessionsCount;
  final DateTime firstSession;

  /// Repreasents number of sets(logs) achieved within a session
  ///
  /// Rate = sets / duration
  final double progressRate;

  double get value {
    final countNorm = sessionsCount / 30;
    final timeNorm = DateTime.now().difference(firstSession).inDays / 60;
    final norm = countNorm - timeNorm > 0 ? countNorm : timeNorm;

    if (norm >= 1) return 1;
    return norm;
  }

  Color get color {
    final countNorm = sessionsCount / 30;
    final timeNorm = DateTime.now().difference(firstSession).inDays / 60;
    final norm = countNorm - timeNorm > 0 ? countNorm : timeNorm;

    if (norm >= 1) return Colors.red;
    if (norm >= .75) return Color.lerp(Colors.amber, Colors.red, (norm - .75) * 4)!;
    if (norm > 0) return Colors.blue;
    return Colors.green;
  }

  const SessionsReport({
    required this.maxDuration,
    required this.avgDuration,
    required this.minDuration,
    required this.totalDuration,
    required this.progressRate,
    required this.sessionsCount,
    required this.firstSession,
  });
}
