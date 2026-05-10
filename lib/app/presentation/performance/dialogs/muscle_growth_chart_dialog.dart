import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/domain/classes/performance_entities/chart.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class MuscleGrowthChartDialog extends StatelessWidget {
  const MuscleGrowthChartDialog({super.key, required this.title, required this.chart});
  final String title;
  final Chart<DateTime, double> chart;
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AlertDialog(
      contentPadding: const .only(right: 8, bottom: 25),
      insetPadding: const .all(8),

      icon: Icon(Icons.stacked_line_chart_rounded, size: 50, color: Colors.grey.shade700),
      title: Text(title),
      content: SizedBox(
        width: MediaQuery.sizeOf(context).width * 1,
        height: MediaQuery.sizeOf(context).width * .6,
        child: LineChart(
          LineChartData(
            titlesData: FlTitlesData(
              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  getTitlesWidget: (value, meta) {
                    final dates = chart.points.map((p) => p.x).toList();
                    // value is the 'x' provided in FlSpot(x, y)
                    int index = value.toInt();

                    if (index >= 0 && index < dates.length) {
                      // Format the date as a string (e.g., "Jan 12")
                      String text = DateFormat('MMM d').format(dates[index]);
                      return SideTitleWidget(
                        // axisSide: meta.axisSide,
                        space: 8,
                        meta: meta,
                        child: Text(text, style: const TextStyle(fontSize: 10, color: Colors.grey)),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: [for (int i = 0; i < chart.points.length; i++) FlSpot(i.toDouble(), chart.points[i].y)],
              ),
            ],
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      // actions: [ElevatedButton(onPressed: () => Navigator.pop(context), child: Text(l10n.ok))],
    );
  }
}
