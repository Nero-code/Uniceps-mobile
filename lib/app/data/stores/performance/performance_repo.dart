import 'package:dartz/dartz.dart';
import 'package:uniceps/app/data/sources/local/dal_measurements/measurements_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_practice/t_session_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_profile/profile_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_management_local_source.dart';
import 'package:uniceps/app/domain/classes/performance_entities/logs_report.dart';
import 'package:uniceps/app/domain/classes/performance_entities/physical_report.dart';
import 'package:uniceps/app/domain/classes/performance_entities/sessions_report.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_session.dart';
import 'package:uniceps/app/domain/classes/profile_classes/measrument.dart';
import 'package:uniceps/app/domain/contracts/performance/performance_contract.dart';
import 'package:uniceps/core/errors/exceptions.dart';
import 'package:uniceps/core/errors/failure.dart';

class PerformanceRepo implements IPerformanceContract {
  final IProfileLocalSource profileLocalSource;
  final IRoutineManagementLocalSourceContract routineLocalSource;
  final ITSessionLocalSourceContract tSessionsLocalSource;
  final IMeasurementsLocalSource measurementsLocalSource;

  PerformanceRepo({
    required this.profileLocalSource,
    required this.routineLocalSource,
    required this.tSessionsLocalSource,
    required this.measurementsLocalSource,
  });

  final Map<int, List<TSession>> sessionsBuffer = {};
  final List<Measurement> measrumentsBuffer = [];

  @override
  Future<Either<PerformanceFailure, SessionsReport>> getSessionsReport(int routineId) async {
    try {
      final res = await tSessionsLocalSource.getSessionsByRoutine(routineId);
      sessionsBuffer.addAll({routineId: res});
    } on EmptyCacheExeption {
      return const Left(PerformanceFailure.noValues());
    } catch (e) {
      return const Left(PerformanceFailure.invalidValues());
    }

    Duration maxDuration, avgDuration, minDuration, totalDuration;
    maxDuration = avgDuration = minDuration = totalDuration = Duration.zero;
    double progressRate = 0;
    final list = sessionsBuffer[routineId]!;

    for (final s in list) {
      final sDuration = s.finishedAt!.difference(s.createdAt);
      maxDuration = sDuration.compareTo(maxDuration) > 0 ? sDuration : maxDuration;
      minDuration = sDuration.compareTo(minDuration) < 0 ? sDuration : minDuration;
      totalDuration += sDuration;
      progressRate += s.progress;
    }

    final avgSeconds = (maxDuration - minDuration).inSeconds / 2;
    avgDuration = Duration(seconds: avgSeconds.round());

    progressRate = progressRate / list.length;

    return Right(SessionsReport(
      maxDuration: maxDuration,
      avgDuration: avgDuration,
      minDuration: minDuration,
      totalDuration: totalDuration,
      progressRate: progressRate,
    ));
  }

  @override
  Future<Either<PerformanceFailure, LogsReport>> getLogsReport(int routineId) async {
    if (!sessionsBuffer.containsKey(routineId)) return const Left(PerformanceFailure.noValues());

    double maxWeight = 0, avgWeight = 0, minWeight = 0, totalWeight = 0;
    double maxVolume = 0, avgVolume = 0, minVolume = 0, totalVolume = 0;
    List<double> intensity = [], density = [];

    try {
      final sessions = sessionsBuffer[routineId]!;
      for (final s in sessions) {
        int totalReps = 0;

        final volume = s.logs
            .map((log) {
              totalReps += log.reps;
              totalWeight += log.weight;
              maxWeight = log.weight > maxWeight ? log.weight : maxWeight;
              minWeight = log.weight < minWeight ? log.weight : minWeight;

              return log.setIndex * log.reps * (log.weight == 0 ? 1.0 : log.weight);
            })
            .reduce((a, b) => a + b)
            .round();
        avgWeight = totalWeight / s.logs.length;

        totalVolume += volume;
        intensity.add(totalReps != 0 ? volume / totalReps : 0);
        final duration = s.createdAt.difference(s.finishedAt!).inMinutes;
        density.add(duration > 0 ? volume / duration : 0);
      }
    } catch (e) {
      return const Left(PerformanceFailure.invalidValues());
    }

    return Right(LogsReport(
      maxWeight: maxWeight,
      avgWeight: avgWeight,
      minWeight: minWeight,
      totalWeights: totalWeight,
      maxVolume: maxVolume,
      avgVolume: avgVolume,
      minVolume: minVolume,
      totalVolume: totalVolume,
      intensity: intensity,
      density: density,
    ));
  }

  @override
  Future<Either<PerformanceFailure, PhysicalReport>> getPhysicalReport() async {
    // TODO: implement getPhysicalReport
    throw UnimplementedError();
  }
}
