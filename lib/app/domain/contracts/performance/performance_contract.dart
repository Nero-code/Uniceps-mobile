import 'package:dartz/dartz.dart';
import 'package:uniceps/app/domain/classes/performance_entities/logs_report.dart';
import 'package:uniceps/app/domain/classes/performance_entities/physical_report.dart';
import 'package:uniceps/app/domain/classes/performance_entities/sessions_report.dart';
import 'package:uniceps/core/errors/failure.dart';

abstract class IPerformanceContract {
  Future<Either<PerformanceFailure, SessionsReport>> getSessionsReport(int routineId);
  Future<Either<PerformanceFailure, LogsReport>> getLogsReport(int routineId);
  Future<Either<PerformanceFailure, PhysicalReport>> getPhysicalReport();
}
