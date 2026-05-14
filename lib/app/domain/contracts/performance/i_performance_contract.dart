import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/performance_entities/chart.dart';
import 'package:uniceps/app/domain/classes/performance_entities/logs_report.dart';
import 'package:uniceps/app/domain/classes/performance_entities/muscle_focus.dart';
import 'package:uniceps/app/domain/classes/performance_entities/physical_report.dart';
import 'package:uniceps/app/domain/classes/performance_entities/sessions_report.dart';
import 'package:uniceps/app/domain/classes/performance_entities/uniceps_summery.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IPerformanceContract {
  Future<Either<PerformanceFailure, SessionsReport>> getSessionsReport(int routineId);
  Future<Either<PerformanceFailure, LogsReport>> getLogsReport(int routineId);
  Future<Either<PerformanceFailure, PhysicalReport>> getPhysicalReport();

  // New Performance
  Future<Either<PerformanceFailure, UnicepsSummery>> getSummery();
  Future<Either<PerformanceFailure, List<MuscleFocus>>> getMuscleFocusChart();
  Future<Either<PerformanceFailure, List<Chart<DateTime, double>>>> getMusclesEvolution(
    DateTime month, {
    DateTime? since,
  });
  // Future<Either<PerformanceFailure, List<Chart<DateTime, double>>>> getBodyMetrics();
  Future<Either<PerformanceFailure, List<Chart<DateTime, double>>>> getMeasurementCharts(
    DateTime month, {
    DateTime? since,
  });
}
