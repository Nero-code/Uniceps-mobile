import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/performance_entities/chart.dart';
import 'package:uniceps/app/domain/classes/performance_entities/logs_report.dart';
import 'package:uniceps/app/domain/classes/performance_entities/muscle_focus.dart';
import 'package:uniceps/app/domain/classes/performance_entities/physical_report.dart';
import 'package:uniceps/app/domain/classes/performance_entities/sessions_report.dart';
import 'package:uniceps/app/domain/classes/performance_entities/uniceps_summery.dart';
import 'package:uniceps/app/domain/contracts/performance/i_performance_contract.dart';
import 'package:uniceps/core/errors/failure.dart';

class PerformanceCommands {
  final IPerformanceContract _repo;

  const PerformanceCommands({required IPerformanceContract repo}) : _repo = repo;

  Future<Either<PerformanceFailure, SessionsReport>> getSessionsReport(int routineId) =>
      _repo.getSessionsReport(routineId);
  Future<Either<PerformanceFailure, LogsReport>> getLogsReport(int routineId) => _repo.getLogsReport(routineId);
  Future<Either<PerformanceFailure, PhysicalReport>> getPhysicalReport() => _repo.getPhysicalReport();

  // New Performance
  Future<Either<PerformanceFailure, UnicepsSummery>> getSummery() => _repo.getSummery();
  Future<Either<PerformanceFailure, List<MuscleFocus>>> getMuscleFocusChart() => _repo.getMuscleFocusChart();
  Future<Either<PerformanceFailure, List<Chart<DateTime, double>>>> getMusclesEvolution(DateTime month) =>
      _repo.getMusclesEvolution(month);
  // Future<Either<PerformanceFailure, List<Chart<DateTime, double>>>> getBodyMetrics() => _repo.getBodyMetrics();
  Future<Either<PerformanceFailure, List<Chart<DateTime, double>>>> getMeasurementCharts(DateTime month) =>
      _repo.getMeasurementCharts(month);
}
