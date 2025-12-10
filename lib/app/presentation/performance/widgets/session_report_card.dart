import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/performance_entities/sessions_report.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class SessionReportCard extends StatelessWidget {
  const SessionReportCard({super.key, required this.report});
  final SessionsReport report;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final screenSize = MediaQuery.sizeOf(context);
    return Container(
      width: screenSize.width,
      margin: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Text(locale.sessionsReport, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.arrow_drop_up_rounded),
                        const SizedBox(width: 5.0),
                        Text(
                          formatDuration(report.maxDuration),
                          textDirection: TextDirection.ltr,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.remove),
                        const SizedBox(width: 5.0),
                        Text(
                          formatDuration(report.avgDuration),
                          textDirection: TextDirection.ltr,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.arrow_drop_down_rounded),
                        const SizedBox(width: 5.0),
                        Text(
                          formatDuration(report.minDuration),
                          textDirection: TextDirection.ltr,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.timer_outlined),
                        const SizedBox(width: 5.0),
                        Text(
                          formatDuration(report.totalDuration),
                          textDirection: TextDirection.ltr,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox.square(
                      dimension: screenSize.width * .2,
                      child: CircularProgressIndicator(
                        color: report.color.withValues(alpha: 0.7),
                        value: report.value,
                        backgroundColor: Colors.white,
                        strokeWidth: 10,
                        strokeAlign: 1,
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                    Column(
                      children: [
                        Text(locale.sessions, style: const TextStyle(fontSize: 10)),
                        Text(
                          '${report.sessionsCount}',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    // Icon(
                    //   Icons.local_fire_department_rounded,
                    //   color: report.color,
                    //   size: 35,
                    // ),
                    Text(locale.progressRate, style: const TextStyle(fontSize: 10)),
                    Text(
                      formatNum(report.progressRate),
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final s = twoDigits(d.inSeconds.remainder(60));
    final m = twoDigits(d.inMinutes.remainder(60));
    final h = twoDigits(d.inHours);
    return '$h:$m:$s';
  }

  String formatNum(double x) {
    return x.toStringAsFixed(1);
  }
}
