import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_session.dart';
import 'package:uniceps/app/presentation/performance/screens/session_details_screen.dart';

class SessionsCard extends StatelessWidget {
  const SessionsCard({super.key, required this.session});

  final TSession session;

  int get durationMinutes {
    if (session.finishedAt == null) return 0;
    return session.finishedAt!.difference(session.createdAt).inMinutes;
  }

  int get uniqueExercisesCount {
    final exIds = session.logs.map((e) => e.exerciseId).toSet();
    return exIds.length;
  }

  double get sessionVolume {
    return session.logs.fold(0, (sum, log) => sum + (log.weight * log.finishedReps));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final dateStr = DateFormat('EEE, MMM dd, yyyy').format(session.createdAt);
    final timeStr = DateFormat('hh:mm a').format(session.createdAt);

    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: theme.secondaryHeaderColor.withAlpha(50),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outlineVariant.withAlpha(100), width: 1.0),
      ),
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SessionDetailsScreen(session: session))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      session.dayName,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: theme.colorScheme.onSurface),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: primaryColor.withAlpha(20),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.timer_outlined, size: 12, color: primaryColor),
                        const SizedBox(width: 3),
                        Text(
                          "${durationMinutes}m",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.calendar_today_outlined, size: 12, color: theme.colorScheme.onSurfaceVariant),
                  const SizedBox(width: 4),
                  Text(
                    "$dateStr • $timeStr",
                    style: TextStyle(fontSize: 11, color: theme.colorScheme.onSurfaceVariant),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Session Summary Metrics Chips in Header
              Wrap(
                spacing: 6,
                runSpacing: 4,
                children: [
                  HeaderMetricChip(icon: Icons.fitness_center_outlined, label: "$uniqueExercisesCount ex"),
                  HeaderMetricChip(icon: Icons.format_list_bulleted, label: "${session.logs.length} sets"),
                  HeaderMetricChip(icon: Icons.bar_chart, label: "${sessionVolume.toInt()} kg"),
                  HeaderMetricChip(icon: Icons.pie_chart_outline, label: "${(session.progress * 100).toInt()}%"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderMetricChip extends StatelessWidget {
  const HeaderMetricChip({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withAlpha(120),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: theme.colorScheme.outlineVariant.withAlpha(60), width: 0.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: theme.colorScheme.onSurfaceVariant),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: theme.colorScheme.onSurface),
          ),
        ],
      ),
    );
  }
}
