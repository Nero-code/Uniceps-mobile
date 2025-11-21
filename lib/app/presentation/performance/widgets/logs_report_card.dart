import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/performance_entities/logs_report.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/app/presentation/performance/widgets/analytics_card.dart';

class LogsReportCard extends StatelessWidget {
  const LogsReportCard({
    super.key,
    required this.r,
  });

  final LogsReport r;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Column(
      children: [
        Row(
          children: [
            AnalyticsCard(
              title: locale.weightsReport,
              icon: const Icon(Icons.fitness_center, color: Colors.red),
              iconBackground: Colors.red,
              max: r.maxWeight,
              avg: r.avgWeight,
              min: r.minWeight,
              total: r.totalWeights,
            ),
            AnalyticsCard(
              title: locale.exerciseDensity,
              icon: const Icon(Icons.menu_open_rounded, color: Colors.blue),
              iconBackground: Colors.lightBlue,
              max: r.density.reduce((a, b) => max(a, b)),
              avg: r.density.reduce((a, b) => a + b) / r.density.length,
              min: r.density.reduce((a, b) => min(a, b)),
              total: r.density.reduce((a, b) => a + b),
            ),
          ],
        ),
        Row(
          children: [
            AnalyticsCard(
              title: locale.exerciseVolume,
              icon: const Icon(Icons.multitrack_audio_rounded, color: Colors.green),
              iconBackground: Colors.green,
              max: r.maxVolume,
              avg: r.avgVolume,
              min: r.minVolume,
              total: r.totalVolume,
            ),
            AnalyticsCard(
              title: locale.exerciseIntensity,
              icon: const Icon(
                Icons.keyboard_double_arrow_up,
                color: Colors.orange,
              ),
              iconBackground: Colors.amber,
              max: r.intensity.reduce((a, b) => max(a, b)),
              avg: r.intensity.reduce((a, b) => a + b) / r.intensity.length,
              min: r.intensity.reduce((a, b) => min(a, b)),
              total: r.intensity.reduce((a, b) => a + b),
            ),
          ],
        ),
      ],
    );
  }
}
