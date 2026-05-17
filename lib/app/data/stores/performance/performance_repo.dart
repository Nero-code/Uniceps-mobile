import 'dart:math' as math;

import 'package:dartz/dartz.dart';
import 'package:uniceps/app/data/models/auth_models/player_model.dart';
import 'package:uniceps/app/data/models/profile_models/measurement_model.dart';
import 'package:uniceps/app/data/models/routine_models/muscle_group_dto.dart';
import 'package:uniceps/app/data/sources/local/dal_measurements/measurements_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_practice/t_session_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_profile/profile_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/exercises_local_source.dart';
import 'package:uniceps/app/data/sources/local/dal_routine/routine_management_local_source.dart';
import 'package:uniceps/app/domain/classes/performance_entities/chart.dart';
import 'package:uniceps/app/domain/classes/performance_entities/logs_report.dart';
import 'package:uniceps/app/domain/classes/performance_entities/muscle_focus.dart';
import 'package:uniceps/app/domain/classes/performance_entities/physical_report.dart';
import 'package:uniceps/app/domain/classes/performance_entities/point.dart';
import 'package:uniceps/app/domain/classes/performance_entities/sessions_report.dart';
import 'package:uniceps/app/domain/classes/performance_entities/uniceps_summery.dart';
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
  final IExercisesLocalSourceContract exercisesLocalSource;

  PerformanceRepo({
    required this.profileLocalSource,
    required this.routineLocalSource,
    required this.tSessionsLocalSource,
    required this.measurementsLocalSource,
    required this.exercisesLocalSource,
  });

  final Map<int, List<TSession>> sessionsBuffer = {};

  @override
  Future<Either<PerformanceFailure, SessionsReport>> getSessionsReport(int routineId) async {
    try {
      final res = await tSessionsLocalSource.getSessionsByRoutine(routineId);
      sessionsBuffer.addAll({routineId: res.map((e) => e.toEntity()).toList()});
    } on EmptyCacheExeption {
      return const Left(PerformanceFailure.noValues());
    } catch (e) {
      return const Left(PerformanceFailure.invalidValues());
    }

    Duration maxDuration, avgDuration, totalDuration;
    Duration? minDuration;
    maxDuration = avgDuration = totalDuration = Duration.zero;

    double progressRate = 0;
    final list = sessionsBuffer[routineId]!;
    list.sort((a, b) => a.createdAt.compareTo(b.createdAt));

    for (final s in list) {
      final sDuration = s.finishedAt!.difference(s.createdAt);
      maxDuration = sDuration.compareTo(maxDuration) > 0 ? sDuration : maxDuration;
      minDuration = sDuration.compareTo(minDuration ?? sDuration) <= 0 ? sDuration : minDuration;
      totalDuration += sDuration;
      progressRate += s.logs.length;
    }
    final avgSeconds = (maxDuration + (minDuration ?? maxDuration)).inSeconds / 2;
    avgDuration = Duration(seconds: avgSeconds.round());
    if (totalDuration.inMinutes != 0) {
      progressRate = progressRate / totalDuration.inMinutes;
    }

    return Right(
      SessionsReport(
        maxDuration: maxDuration,
        avgDuration: avgDuration,
        minDuration: minDuration ?? Duration.zero,
        totalDuration: totalDuration,
        progressRate: progressRate,
        sessionsCount: list.length,
        firstSession: list.first.createdAt,
      ),
    );
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
            .reduce((a, b) => a + b);
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

    return Right(
      LogsReport(
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
      ),
    );
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
    final bmi = m.weight / math.pow(m.height / 100, 2);
    final bmr = (10 * m.weight) + (6.25 * m.height) - (5 * age) + (profile.gender == Gender.male ? 5 : -161);

    double bf = 0;
    if (profile.gender == Gender.male && m.waist - m.neck > 0) {
      bf = 86.01 * log10(m.waist - m.neck) - 70.041 * log10(m.height) + 36.76;
    } else if (profile.gender == Gender.female && m.waist + m.hips - m.neck > 0) {
      bf = 163.205 * log10(m.waist + m.hips - m.neck) - 97.684 * log10(m.height) - 78.387;
    }

    return Right(PhysicalReport(bmi: bmi, bmr: bmr, gender: profile.gender, bodyFatPercentage: bf));
  }

  double log10(num x) => math.log(x) / math.ln10;

  @override
  Future<Either<PerformanceFailure, UnicepsSummery>> getSummery() async {
    try {
      final sessions = await tSessionsLocalSource.getAllSessions();
      int totalWeight = 0, totalReps = 0;
      Duration totalDuration = .zero;
      double totalCompletionRate = 0;
      double efficiency = 0;
      int currentStreak = 0, longestStreak = 0;
      if (sessions.isNotEmpty) {
        var tempSession = sessions.first;
        for (final s in sessions) {
          totalWeight += s.logs.map((l) => l.weight).fold(0.0, (sum, weight) => sum + weight).toInt();
          totalReps += s.logs.map((l) => l.reps).fold(0, (sum, reps) => sum + reps);
          totalDuration += s.finishedAt!.difference(s.createdAt);
          totalCompletionRate += s.progress;

          if (tempSession.createdAt.difference(s.createdAt).inDays < 3) {
            currentStreak++;
          } else {
            currentStreak = 0;
          }
          if (currentStreak > longestStreak) {
            longestStreak = currentStreak;
          }
          tempSession = s;
        }
        if (tempSession.createdAt.difference(DateTime.now()).inDays >= 3) currentStreak = 0;
        efficiency = totalWeight / totalDuration.inMinutes;
        return Right(
          UnicepsSummery(
            totalWeight: totalWeight,
            totalReps: totalReps,
            totalDurationInMinutes: totalDuration.inMinutes,
            totalSessions: sessions.length,
            averageCompletionRate: (totalCompletionRate / sessions.length),
            efficiency: efficiency,
            currentStreak: currentStreak,
            longestStreak: longestStreak,
          ),
        );
      } else {
        return Right(UnicepsSummery.empty());
      }
    } catch (e) {
      return const Left(.invalidValues());
    }
  }

  @override
  Future<Either<PerformanceFailure, List<MuscleFocus>>> getMuscleFocusChart() async {
    try {
      final res = await tSessionsLocalSource.getAllSessions();
      final groups = await exercisesLocalSource.getMuscleGroups();

      final List<MuscleFocus> list = [];

      final Map<MuscleGroupDto, double> data = {};
      for (final s in res) {
        for (final g in groups) {
          final exercises = await exercisesLocalSource.getExercisesByGroup(g.muscleGroupCode);
          final groupVol = s.logs
              .where((l) => exercises.where((e) => e.apiId == l.exerciseId).isNotEmpty)
              .fold(0.0, (previousValue, element) => previousValue + (element.weight * element.reps));

          data.update(g, (value) => value + groupVol, ifAbsent: () => groupVol);
        }
      }
      final totalVol = data.values.fold(0.0, (previousValue, element) => previousValue + element);
      if (totalVol == 0) return const Left(PerformanceFailure.noValues());
      for (final e in data.entries) {
        list.add(MuscleFocus(group: e.key.toEntity(), percentage: e.value / totalVol));
      }
      return Right(list);
    } catch (e) {
      return const Left(PerformanceFailure.invalidValues());
    }
  }

  @override
  Future<Either<PerformanceFailure, List<Chart<DateTime, double>>>> getMusclesEvolution(
    DateTime month, {
    DateTime? since,
  }) async {
    try {
      final sessions = await tSessionsLocalSource.getAllSessions();
      final groups = await exercisesLocalSource.getMuscleGroups();

      final List<Chart<DateTime, double>> list = List.generate(
        groups.length,
        (i) => Chart(points: [], title: groups[i].muscleGroupName),
      );

      final to = month.add(const Duration(days: 31));
      final sessionsSinceTime = sessions.where((s) => s.createdAt.isAfter(month) && s.createdAt.isBefore(to));
      for (final s in sessionsSinceTime) {
        for (int i = 0; i < groups.length; i++) {
          final g = groups[i];
          final exercises = await exercisesLocalSource.getExercisesByGroup(g.muscleGroupCode);
          final groupVol = s.logs
              .where((l) => exercises.where((e) => e.apiId == l.exerciseId).isNotEmpty)
              .fold(0.0, (previousValue, element) => previousValue + (element.weight * element.reps));
          if (groupVol != 0) {
            list[i].points.add(Point(x: s.createdAt, y: groupVol));
          }
        }
      }
      return Right(list);
    } catch (e) {
      return const Left(.invalidValues());
    }
  }

  List<MeasurementModel> allMeasurements = [];
  @override
  Future<Either<PerformanceFailure, List<Chart<DateTime, double>>>> getMeasurementCharts(
    DateTime month, {
    DateTime? since,
  }) async {
    try {
      if (allMeasurements.isEmpty) {
        allMeasurements = await measurementsLocalSource.getMeasurements();
      }
      final to = month.add(const Duration(days: 31));
      final measurements = allMeasurements
          .where((m) => m.checkDate.isAfter(month) && m.checkDate.isBefore(to))
          .toList();

      final List<Chart<DateTime, double>> list = List.generate(
        MeasurementModel.propsNumbers,
        (index) => Chart(points: [], title: '$index'),
      );

      for (int i = 0; i < measurements.length; i++) {
        final m = measurements[i];
        list[i].points.add(Point(x: m.checkDate, y: m.getByIndex(i)));
      }
      return Right(list);
    } catch (e) {
      return const Left(.noValues());
    }
  }
}
