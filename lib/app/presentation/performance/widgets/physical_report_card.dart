import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:uniceps/app/domain/classes/performance_entities/physical_report.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class PhysicalReportCard extends StatelessWidget {
  const PhysicalReportCard({super.key, required this.report});

  final PhysicalReport report;

  Color _getBmiColor(double bmi) {
    if (bmi <= 0) return Colors.grey;
    if (bmi < 18.5) return Colors.blue.shade700;
    if (bmi < 25.0) return Colors.green.shade700;
    if (bmi < 30.0) return Colors.orange.shade800;
    return Colors.red.shade700;
  }

  String _getBmiStatus(double bmi) {
    if (bmi <= 0) return "N/A";
    if (bmi < 18.5) return "Underweight";
    if (bmi < 25.0) return "Normal";
    if (bmi < 30.0) return "Overweight";
    return "Obese";
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final primaryColor = Theme.of(context).colorScheme.primary;
    final numberFormat = intl.NumberFormat.decimalPattern()..maximumFractionDigits = 1;

    final bmiColor = _getBmiColor(report.bmi);
    final bmiStatus = _getBmiStatus(report.bmi);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.monitor_weight_outlined, color: primaryColor, size: 20),
                  const SizedBox(width: 8),
                  Text(locale.physicalReport, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: primaryColor.withAlpha(20),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: primaryColor.withAlpha(60)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(report.gender == Gender.male ? Icons.male : Icons.female, size: 14, color: primaryColor),
                    const SizedBox(width: 4),
                    Text(
                      report.gender == Gender.male ? "Male" : "Female",
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: primaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 3 Metric Cards Grid
          Row(
            children: [
              // BMI Tile
              Expanded(
                child: _buildMetricTile(
                  context,
                  title: "BMI",
                  value: report.bmi > 0 ? numberFormat.format(report.bmi) : "--",
                  badgeText: bmiStatus,
                  badgeColor: bmiColor,
                  icon: Icons.speed,
                  iconColor: bmiColor,
                  unit: '',
                ),
              ),
              const SizedBox(width: 8),

              // BF% Tile
              Expanded(
                child: _buildMetricTile(
                  context,
                  title: "BF%",
                  value: report.bodyFatPercentage > 0 ? "${numberFormat.format(report.bodyFatPercentage)}%" : "--",
                  badgeText: "Body Fat",
                  badgeColor: Colors.deepOrange.shade700,
                  icon: Icons.pie_chart_outline,
                  iconColor: Colors.deepOrange.shade700,
                  unit: '',
                ),
              ),
              const SizedBox(width: 8),

              // BMR Tile
              Expanded(
                child: _buildMetricTile(
                  context,
                  title: "BMR",
                  value: report.bmr > 0 ? numberFormat.format(report.bmr) : "--",
                  unit: "kcal/${locale.day}",
                  badgeText: "Metabolism",
                  badgeColor: Colors.amber.shade900,
                  icon: Icons.local_fire_department_outlined,
                  iconColor: Colors.amber.shade800,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          const Divider(height: 12, thickness: 0.5),

          // Disclaimer Footer
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.info_outline, size: 14, color: Colors.grey.shade600),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  locale.physicalReportDisclaimer,
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade600, height: 1.3),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricTile(
    BuildContext context, {
    required String title,
    required String value,
    String? unit,
    required String badgeText,
    required Color badgeColor,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withAlpha(80),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 14, color: iconColor),
              const SizedBox(width: 4),
              Text(
                title,
                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          if (unit != null) ...[
            const SizedBox(height: 2),
            Text(
              unit,
              style: TextStyle(fontSize: 9, color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
          ],
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(color: badgeColor.withAlpha(20), borderRadius: BorderRadius.circular(4)),
            child: Text(
              badgeText,
              style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: badgeColor),
            ),
          ),
        ],
      ),
    );
  }
}
