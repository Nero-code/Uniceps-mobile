import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/performance_entities/uniceps_summery.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_session.dart';
import 'package:uniceps/app/presentation/performance/cubits/metrics/metrics_cubit.dart';
import 'package:uniceps/app/presentation/performance/widgets/physical_report_card.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class UnicepsSummaryPage extends StatelessWidget {
  const UnicepsSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);
    final l10n = AppLocalizations.of(context)!;
    return BlocBuilder<MetricsCubit, MetricsState>(
      builder: (context, state) {
        if (state is MetricsLoading || state is MetricsInitial) {
          return const LoadingIndicator();
        }

        if (state is MetricsFailure) {
          return Center(child: Text(l10n.errLoadSummary));
        }

        if (state is MetricsLoaded) {
          final summary = state.result.summary;
          final physicalReport = state.result.physicalReport;
          final sessions = state.result.sessions;

          return SingleChildScrollView(
            padding: EdgeInsets.only(
              top: MediaQuery.paddingOf(context).top + 16,
              bottom: MediaQuery.paddingOf(context).bottom + 50,
            ),
            child: Center(
              child: SizedBox(
                width: screen.width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Physical Report Card
                    PhysicalReportCard(report: physicalReport),
                    const SizedBox(height: 16),

                    // Consistency Heatmap Widget
                    _ConsistencyHeatmapWidget(summery: summary, sessions: sessions),
                    const SizedBox(height: 16),

                    // Progressive Overload Trend Widget
                    _ProgressiveOverloadWidget(sessions: sessions),
                  ],
                ),
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}

class _ConsistencyHeatmapWidget extends StatelessWidget {
  const _ConsistencyHeatmapWidget({required this.summery, required this.sessions});

  final UnicepsSummery summery;
  final List<TSession> sessions;

  List<List<int>> _generateHeatmapData() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final currentWeekMonday = today.subtract(Duration(days: today.weekday - 1));
    final gridStartDate = currentWeekMonday.subtract(const Duration(days: 15 * 7));

    final Set<String> sessionDates = {};
    for (final session in sessions) {
      final key =
          "${session.createdAt.year}-${session.createdAt.month.toString().padLeft(2, '0')}-${session.createdAt.day.toString().padLeft(2, '0')}";
      sessionDates.add(key);
    }

    final calcStartDate = gridStartDate.subtract(const Duration(days: 4));
    int daysSinceLastSession = 999;
    final Map<String, int> dateLevelMap = {};

    for (DateTime d = calcStartDate; !d.isAfter(today); d = d.add(const Duration(days: 1))) {
      final key = "${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}";
      if (sessionDates.contains(key)) {
        daysSinceLastSession = 0;
        dateLevelMap[key] = 3;
      } else {
        daysSinceLastSession++;
        if (daysSinceLastSession == 1) {
          dateLevelMap[key] = 2;
        } else if (daysSinceLastSession <= 2) {
          dateLevelMap[key] = 1;
        } else {
          dateLevelMap[key] = 0;
        }
      }
    }

    final List<List<int>> grid = [];
    for (int w = 0; w < 16; w++) {
      final List<int> week = [];
      for (int d = 0; d < 7; d++) {
        final cellDate = gridStartDate.add(Duration(days: (w * 7) + d));
        if (cellDate.isAfter(today)) {
          week.add(-1);
          continue;
        }
        final key =
            "${cellDate.year}-${cellDate.month.toString().padLeft(2, '0')}-${cellDate.day.toString().padLeft(2, '0')}";
        week.add(dateLevelMap[key] ?? 0);
      }
      grid.add(week);
    }
    return grid;
  }

  Color _getCellColor(int level, Color primaryColor) {
    switch (level) {
      case 3:
        return primaryColor; // Recharged on session day
      case 2:
        return primaryColor.withAlpha(150); // Fading 1st rest day
      case 1:
        return primaryColor.withAlpha(75); // Fading 2nd/3rd rest day
      case -1:
        return Colors.transparent; // Future day
      default:
        return Colors.grey.shade200; // Streak broken / empty day
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final primaryColor = theme.colorScheme.primary;
    final heatmapData = _generateHeatmapData();
    const dayLabels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.local_fire_department, color: Colors.orange.shade700, size: 22),
                  const SizedBox(width: 6),
                  Text(l10n.consistencyHeatmap, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  border: Border.all(color: Colors.orange.shade200),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "🔥 ${l10n.dayStreak(summery.currentStreak)}",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.orange.shade900),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Heatmap Grid
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: List.generate(
                    7,
                    (i) => SizedBox(
                      height: 14,
                      width: 16,
                      child: Text(
                        dayLabels[i],
                        style: TextStyle(fontSize: 9, color: Colors.grey.shade600, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Row(
                  children: heatmapData.map((week) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Column(
                        children: week.map((level) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 1.5),
                            width: 11,
                            height: 11,
                            decoration: BoxDecoration(
                              color: _getCellColor(level, primaryColor),
                              borderRadius: BorderRadius.circular(2.5),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Legend
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.longestStreakLabel(summery.longestStreak),
                style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
              ),
              Row(
                children: [
                  Text("${l10n.rest} ", style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 1.5),
                    width: 9,
                    height: 9,
                    decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(2)),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 1.5),
                    width: 9,
                    height: 9,
                    decoration: BoxDecoration(
                      color: primaryColor.withAlpha(75),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 1.5),
                    width: 9,
                    height: 9,
                    decoration: BoxDecoration(
                      color: primaryColor.withAlpha(150),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 1.5),
                    width: 9,
                    height: 9,
                    decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(2)),
                  ),
                  Text(" ${l10n.sessionLabel}", style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProgressiveOverloadWidget extends StatelessWidget {
  const _ProgressiveOverloadWidget({required this.sessions});

  final List<TSession> sessions;

  List<FlSpot> _generateWeeklyVolumeSpots() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final currentWeekMonday = today.subtract(Duration(days: today.weekday - 1));

    final List<FlSpot> spots = [];
    for (int w = 1; w <= 8; w++) {
      final weekStart = currentWeekMonday.subtract(Duration(days: (8 - w) * 7));
      final weekEnd = weekStart.add(const Duration(days: 7));

      double weeklyVolume = 0.0;
      for (final s in sessions) {
        if (!s.createdAt.isBefore(weekStart) && s.createdAt.isBefore(weekEnd)) {
          for (final log in s.logs) {
            weeklyVolume += (log.weight * log.finishedReps);
          }
        }
      }
      final volumeK = weeklyVolume / 1000.0;
      spots.add(FlSpot(w.toDouble(), volumeK));
    }
    return spots;
  }

  double _calcPercentageChange(List<FlSpot> spots) {
    if (spots.length < 2) return 0.0;
    final last = spots.last.y;
    final prev = spots[spots.length - 2].y;
    if (prev == 0) return last == 0 ? 0.0 : 100.0;
    return ((last - prev) / prev) * 100.0;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final primaryColor = theme.colorScheme.primary;
    final spots = _generateWeeklyVolumeSpots();
    final pctChange = _calcPercentageChange(spots);
    final isPositive = pctChange >= 0;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.trending_up, color: Colors.green.shade700, size: 22),
                  const SizedBox(width: 6),
                  Text(
                    l10n.progressiveOverloadTrend,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: isPositive ? Colors.green.shade50 : Colors.red.shade50,
                  border: Border.all(color: isPositive ? Colors.green.shade300 : Colors.red.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                      size: 12,
                      color: isPositive ? Colors.green.shade800 : Colors.red.shade800,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      "${isPositive ? '+' : ''}${pctChange.toStringAsFixed(1)}%",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: isPositive ? Colors.green.shade800 : Colors.red.shade800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(l10n.weeklyVolumeProgression, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
          const SizedBox(height: 16),

          // Line Chart
          SizedBox(
            height: 150,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => FlLine(color: Colors.grey.shade200, strokeWidth: 1),
                ),
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text("W${value.toInt()}", style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
                        );
                      },
                      reservedSize: 22,
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    color: primaryColor,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) =>
                          FlDotCirclePainter(radius: 3, color: Colors.white, strokeWidth: 2, strokeColor: primaryColor),
                    ),
                    belowBarData: BarAreaData(show: true, color: primaryColor.withAlpha(35)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue.shade50.withAlpha(120),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade100),
            ),
            child: Row(
              children: [
                Icon(Icons.lightbulb_outline, size: 16, color: Colors.blue.shade800),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    isPositive ? l10n.volumeIncreasedTip : l10n.volumeDecreasedTip,
                    style: TextStyle(fontSize: 11, color: Colors.blue.shade900),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
