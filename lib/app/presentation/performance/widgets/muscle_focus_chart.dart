import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/domain/classes/performance_entities/muscle_focus.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class MuscleFocusChart extends StatelessWidget {
  const MuscleFocusChart({super.key, required this.chartData});

  final List<MuscleFocus> chartData;

  static const List<Color> colorWheel = [
    Color(0xFF4C6EF5), // Blue
    Color(0xFFFF6B6B), // Red
    Color(0xFFFCC419), // Amber
    Color(0xFF51CF66), // Green
    Color(0xFFCC5DE8), // Purple
    Color(0xFFFF922B), // Orange
    Color(0xFF20C997), // Teal
    Color(0xFF845EF7), // Deep Purple
    Color(0xFF94D82D), // Lime
    Color(0xFF339AF0), // Light Blue
    Color(0xFF868E96), // Grey
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    if (chartData.isEmpty) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300),
        ),
        alignment: Alignment.center,
        child: Text(
          l10n.noMuscleFocusData,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
        ),
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.pie_chart_outline, color: theme.colorScheme.primary, size: 20),
              const SizedBox(width: 8),
              Text(l10n.muscleFocusBreakdown, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              // Donut Chart
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 160,
                  child: PieChart(
                    PieChartData(
                      sectionsSpace: 2,
                      centerSpaceRadius: 36,
                      sections: List.generate(chartData.length, (i) {
                        final item = chartData[i];
                        final pct = (item.percentage * 100).toInt();
                        return PieChartSectionData(
                          radius: 28,
                          value: item.percentage * 100,
                          title: pct >= 5 ? "$pct%" : "",
                          titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white),
                          color: colorWheel[i % colorWheel.length],
                        );
                      }),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Legend
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(chartData.length, (index) {
                    final item = chartData[index];
                    final color = colorWheel[index % colorWheel.length];
                    final pctStr = NumberFormat.percentPattern().format(item.percentage);

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      child: Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              item.group.muscleGroupName,
                              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            pctStr,
                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey.shade700),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
