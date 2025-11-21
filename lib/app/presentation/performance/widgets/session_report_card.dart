import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/app/domain/classes/performance_entities/sessions_report.dart';

class SessionReportCard extends StatelessWidget {
  const SessionReportCard({
    super.key,
    required this.report,
  });
  final SessionsReport report;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final screenSize = MediaQuery.sizeOf(context);
    return Container(
      width: screenSize.width,
      margin: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            locale.sessionsReport,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
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
                          style: const TextStyle(fontSize: 12),
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
                          style: const TextStyle(fontSize: 12),
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
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.timer),
                        const SizedBox(width: 5.0),
                        Text(
                          formatDuration(report.totalDuration),
                          textDirection: TextDirection.ltr,
                          style: const TextStyle(fontSize: 12),
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
                        color: Colors.orange.withOpacity(0.5),
                        value: .9,
                        strokeWidth: 10,
                        strokeAlign: 1,
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          locale.sessions,
                          style: const TextStyle(fontSize: 10),
                        ),
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
                  Text(
                    locale.progressRate,
                    style: const TextStyle(fontSize: 10),
                  ),
                  Text(
                    '${report.progressRate}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              )),
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
}
