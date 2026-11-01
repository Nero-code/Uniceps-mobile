import 'package:equatable/equatable.dart';
import 'package:uniceps/app/domain/classes/performance_entities/chart.dart';
import 'package:uniceps/app/domain/classes/performance_entities/muscle_focus.dart';
import 'package:uniceps/app/domain/classes/performance_entities/uniceps_summery.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_session.dart';
import 'package:uniceps/app/domain/classes/profile_classes/measurement.dart';

import 'package:uniceps/app/domain/classes/performance_entities/physical_report.dart';

class PerformanceResult extends Equatable {
  final UnicepsSummery summary;
  final List<MuscleFocus> muscleFocus;
  final PhysicalReport physicalReport;
  final List<TSession> sessions;
  final List<Measurement> measurements;
  final List<Chart<DateTime, double>> musclesEvolution;

  const PerformanceResult({
    required this.summary,
    required this.muscleFocus,
    required this.physicalReport,
    required this.sessions,
    required this.measurements,
    required this.musclesEvolution,
  });

  factory PerformanceResult.empty() => PerformanceResult(
    summary: UnicepsSummery.empty(),
    muscleFocus: const [],
    physicalReport: PhysicalReport.empty(),
    sessions: const [],
    measurements: const [],
    musclesEvolution: const [],
  );

  @override
  List<Object?> get props => [summary, muscleFocus, physicalReport, sessions, measurements, musclesEvolution];
}
