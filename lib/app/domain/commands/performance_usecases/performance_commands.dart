import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/performance_entities/logs_report.dart';
import 'package:uniceps/app/domain/classes/performance_entities/physical_report.dart';
import 'package:uniceps/app/domain/classes/performance_entities/sessions_report.dart';
import 'package:uniceps/app/domain/contracts/performance/performance_contract.dart';
import 'package:uniceps/core/errors/failure.dart';

class PerformanceCommands {
  final IPerformanceContract _repo;

  const PerformanceCommands({required IPerformanceContract repo}) : _repo = repo;

  Future<Either<PerformanceFailure, SessionsReport>> getSessionsReport(int routineId) =>
      _repo.getSessionsReport(routineId);
  Future<Either<PerformanceFailure, LogsReport>> getLogsReport(int routineId) => _repo.getLogsReport(routineId);
  Future<Either<PerformanceFailure, PhysicalReport>> getPhysicalReport() => _repo.getPhysicalReport();
}
