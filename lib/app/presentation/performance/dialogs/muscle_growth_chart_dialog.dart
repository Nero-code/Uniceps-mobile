import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/domain/classes/performance_entities/chart.dart';

class MuscleGrowthChartDialog extends StatelessWidget {
  const MuscleGrowthChartDialog({super.key, required this.title, required this.chart});
  final String title;
  final Chart<DateTime, double> chart;
  @override
  Widget build(BuildContext context) {
    var xAxisTitles = AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          final dates = chart.points.map((p) => p.x).toList();
          // value is the 'x' provided in FlSpot(x, y)
          int index = value.toInt();

          if (index >= 0 && index < dates.length) {
            // Format the date as a string (e.g., "Jan 12")
            String text = DateFormat('d/M').format(dates[index]);
            return SideTitleWidget(
              meta: meta,
              child: Text(text, style: const TextStyle(fontSize: 10, color: Colors.grey)),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
    return Directionality(
      textDirection: .ltr,
      child: AlertDialog(
        contentPadding: const .only(right: 8, bottom: 25),
        insetPadding: const .all(8),

        icon: Icon(Icons.stacked_line_chart_rounded, size: 50, color: Colors.grey.shade700),
        title: Text(title, style: TextStyle(color: Colors.grey.shade700)),
        content: SizedBox(
          width: MediaQuery.sizeOf(context).width * 1,
          height: MediaQuery.sizeOf(context).width * .6,

          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: LineChart(
              LineChartData(
                borderData: FlBorderData(show: true, border: .all(width: .5, color: Colors.grey)),
                titlesData: FlTitlesData(
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 50,
                      getTitlesWidget: (i, meta) => SideTitleWidget(
                        meta: meta,
                        child: Text(NumberFormat.compact().format(i), style: TextStyle(color: Colors.grey)),
                      ),
                    ),
                  ),
                  bottomTitles: xAxisTitles,
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: [for (int i = 0; i < chart.points.length; i++) FlSpot(i.toDouble(), chart.points[i].y)],
                  ),
                ],
              ),
            ),
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        // actions: [ElevatedButton(onPressed: () => Navigator.pop(context), child: Text(l10n.ok))],
      ),
    );
  }
}
