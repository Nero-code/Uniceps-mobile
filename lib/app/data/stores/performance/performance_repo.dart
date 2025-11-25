import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:uniceps/app/data/models/auth_models/player_model.dart';
import 'package:uniceps/app/data/models/profile_models/measurement_model.dart';
import 'package:uniceps/app/data/sources/local/dal_measurements/measurements_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_practice/t_session_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_profile/profile_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_management_local_source.dart';
import 'package:uniceps/app/domain/classes/performance_entities/logs_report.dart';
import 'package:uniceps/app/domain/classes/performance_entities/physical_report.dart';
import 'package:uniceps/app/domain/classes/performance_entities/sessions_report.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_session.dart';
import 'package:uniceps/app/domain/contracts/performance/i_performance_contract.dart';
import 'package:uniceps/core/constants/constants.dart';
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
    list.sort((a, b) => a.createdAt.compareTo(b.createdAt));

    for (final s in list) {
      final sDuration = s.finishedAt!.difference(s.createdAt);
      maxDuration = sDuration.compareTo(maxDuration) > 0 ? sDuration : maxDuration;
      minDuration = sDuration.compareTo(minDuration) < 0 ? sDuration : minDuration;
      totalDuration += sDuration;
      progressRate += s.logs.length;
    }

    final avgSeconds = (maxDuration - minDuration).inSeconds / 2;
    avgDuration = Duration(seconds: avgSeconds.round());
    if (totalDuration.inMinutes != 0) {
      progressRate = progressRate / totalDuration.inMinutes;
    }

    return Right(SessionsReport(
      maxDuration: maxDuration,
      avgDuration: avgDuration,
      minDuration: minDuration,
      totalDuration: totalDuration,
      progressRate: progressRate,
      sessionsCount: list.length,
      firstSession: list.first.createdAt,
    ));
  }

  @override
  Future<Either<PerformanceFailure, LogsReport>> getLogsReport(int routineId) async {
    if (!sessionsBuffer.containsKey(routineId)) return const Left(PerformanceFailure.noValues());

    double maxWeight = 0, avgWeight = 0, totalWeight = 0;
    double? minWeight;
    double maxVolume = 0, avgVolume = 0, totalVolume = 0;
    double? minVolume;
    List<double> intensity = [], density = [];

    final sessions = sessionsBuffer[routineId]!;
    try {
      for (final s in sessions) {
        int totalReps = 0;

        final volume = s.logs
            .map((log) {
              totalReps += log.reps;
              totalWeight += log.weight;
              maxWeight = maxWeight < log.weight ? log.weight : maxWeight;
              minWeight = (minWeight ?? log.weight) > log.weight ? log.weight : minWeight;

              return log.setIndex * log.reps * (log.weight == 0 ? 1.0 : log.weight);
            })
            .reduce((a, b) => a + b)
            .round();
        avgWeight = totalWeight / s.logs.length;

        totalVolume += volume;
        maxVolume = maxVolume > volume ? maxVolume : volume.toDouble();
        minVolume = (minVolume ?? volume) < volume ? minVolume : volume.toDouble();

        intensity.add(totalReps != 0 ? volume / totalReps : 0);
        final duration = s.finishedAt!.difference(s.createdAt).inMinutes;
        density.add(duration > 0 ? volume / duration : 0);
      }
    } catch (e) {
      return const Left(PerformanceFailure.invalidValues());
    }

    avgVolume = totalVolume / sessions.length;

    return Right(LogsReport(
      maxWeight: maxWeight,
      avgWeight: avgWeight,
      minWeight: minWeight ?? 0,
      totalWeights: totalWeight,
      maxVolume: maxVolume,
      avgVolume: avgVolume,
      minVolume: minVolume ?? 0,
      totalVolume: totalVolume,
      intensity: intensity,
      density: density,
    ));
  }

  @override
  Future<Either<PerformanceFailure, PhysicalReport>> getPhysicalReport() async {
    PlayerModel profile;
    List<MeasurementModel> measures;
    MeasurementModel m;
    try {
      profile = await profileLocalSource.getProfileData();
      measures = await measurementsLocalSource.getMeasurements();
      if (measures.isEmpty) {
        return const Left(PerformanceFailure.noValues());
      }
    } catch (e) {
      return const Left(PerformanceFailure.noValues());
    }

    measures.sort((a, b) => b.checkDate.compareTo(a.checkDate));
    try {
      m = measures.firstWhere((m) => m.weight > 0 && m.height > 0);
    } catch (e) {
      return const Left(PerformanceFailure.invalidValues());
    }

    final age = DateTime.now().year - profile.birthDate.year;
    final bmi = m.weight / pow(m.height / 100, 2);
    final bmr = (10 * m.weight) + (6.25 * m.height) - (5 * age) + (profile.gender == Gender.male ? 5 : -161);

    double bf = 0;
    if (profile.gender == Gender.male && m.waist - m.neck > 0) {
      bf = 86.01 * log10(m.waist - m.neck) - 70.041 * log10(m.height);
    } else if (profile.gender == Gender.female && m.waist + m.hips - m.neck > 0) {
      bf = 163.205 * log10(m.waist + m.hips - m.neck) - 97.684 * log10(m.height);
    }

    return Right(PhysicalReport(bmi: bmi, bmr: bmr, gender: profile.gender, bodyFatPercentage: bf));
  }

  double log10(num x) => log(x) / ln10;
}
