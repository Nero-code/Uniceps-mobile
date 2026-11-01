import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/data/services/media_helper.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_log.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_session.dart';
import 'package:uniceps/app/domain/commands/routine_management/exercises_commands.dart';
import 'package:uniceps/injection_dependency.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class SessionDetailsScreen extends StatelessWidget {
  const SessionDetailsScreen({super.key, required this.session});

  final TSession session;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final Map<String, List<TLog>> exercises = extractExerciseLogs(session.logs);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          session.dayName.isNotEmpty ? session.dayName : l10n.sessionsReport,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _SessionSummaryCard(session: session, uniqueExercisesCount: exercises.length),
          const SizedBox(height: 16),
          ...exercises.keys.map((k) => ExerciseLogDetailsWidget(exerciseId: k, logs: exercises[k] ?? [])),
        ],
      ),
    );
  }

  Map<String, List<TLog>> extractExerciseLogs(List<TLog> logs) {
    final logGroup = <String, List<TLog>>{};
    for (final log in logs) {
      if (logGroup.containsKey(log.exerciseId)) {
        logGroup[log.exerciseId]?.add(log);
      } else {
        logGroup.addAll({
          log.exerciseId: [log],
        });
      }
    }
    return logGroup;
  }
}

class _SessionSummaryCard extends StatelessWidget {
  const _SessionSummaryCard({required this.session, required this.uniqueExercisesCount});

  final TSession session;
  final int uniqueExercisesCount;

  int get durationMinutes {
    if (session.finishedAt == null) return 0;
    return session.finishedAt!.difference(session.createdAt).inMinutes;
  }

  double get sessionVolume {
    return session.logs.fold(0, (sum, log) => sum + (log.weight * log.finishedReps));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final primaryColor = theme.colorScheme.primary;
    final dateStr = DateFormat('EEE, MMM dd, yyyy').format(session.createdAt);
    final timeStr = DateFormat('hh:mm a').format(session.createdAt);

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer.withAlpha(60),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: primaryColor.withAlpha(60), width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.calendar_today_rounded, size: 16, color: primaryColor),
                  const SizedBox(width: 6),
                  Text(
                    dateStr,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              if (session.finishedAt != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: primaryColor.withAlpha(30), borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.timer_outlined, size: 14, color: primaryColor),
                      const SizedBox(width: 4),
                      Text(
                        '$durationMinutes ${l10n.min}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: primaryColor),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(timeStr, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: [
              _buildSummaryChip(theme, Icons.fitness_center_rounded, '$uniqueExercisesCount ${l10n.exercises}'),
              _buildSummaryChip(theme, Icons.format_list_bulleted_rounded, '${session.logs.length} ${l10n.set}'),
              _buildSummaryChip(theme, Icons.bar_chart_rounded, '${sessionVolume.toInt()} ${l10n.kg}'),
              _buildSummaryChip(theme, Icons.pie_chart_outline_rounded, '${(session.progress * 100).toInt()}%'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryChip(ThemeData theme, IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: theme.colorScheme.outlineVariant.withAlpha(100), width: 0.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: theme.colorScheme.primary),
          const SizedBox(width: 4),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600, color: theme.colorScheme.onSurface),
          ),
        ],
      ),
    );
  }
}

class ExerciseLogDetailsWidget extends StatelessWidget {
  const ExerciseLogDetailsWidget({super.key, required this.exerciseId, required this.logs});

  final String exerciseId;
  final List<TLog> logs;

  double get maxWeight {
    if (logs.isEmpty) return 0;
    return logs.map((e) => e.weight).reduce((a, b) => a > b ? a : b);
  }

  double get totalVolume {
    return logs.fold(0, (sum, log) => sum + (log.weight * log.finishedReps));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    final sortedLogs = List<TLog>.from(logs)..sort((a, b) => a.setIndex.compareTo(b.setIndex));

    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: theme.colorScheme.outlineVariant.withAlpha(120), width: 1.0),
        boxShadow: [BoxShadow(color: Colors.black.withAlpha(8), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Container(
                    width: 70,
                    height: 70,
                    color: theme.colorScheme.surfaceContainerHighest.withAlpha(120),
                    child: FutureBuilder<Uint8List?>(
                      future: sl<MediaHelper>().getImage(exerciseId),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                          return Image.memory(snapshot.data!, fit: BoxFit.cover);
                        }
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(
                            child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)),
                          );
                        }
                        return Icon(Icons.fitness_center_rounded, color: theme.colorScheme.primary, size: 30);
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FutureBuilder<String>(
                        future: sl<ExercisesCommands>().getExerciseName(exerciseId),
                        builder: (context, snapshot) {
                          return Text(
                            snapshot.data ?? '...',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.onSurface,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          );
                        },
                      ),
                      const SizedBox(height: 6),
                      Wrap(
                        spacing: 6,
                        runSpacing: 4,
                        children: [
                          _buildMetricBadge(theme, Icons.format_list_bulleted_rounded, '${logs.length} ${l10n.set}'),
                          _buildMetricBadge(
                            theme,
                            Icons.fitness_center_outlined,
                            '${l10n.maxLabel}: $maxWeight ${l10n.kg}',
                          ),
                          _buildMetricBadge(
                            theme,
                            Icons.bar_chart_rounded,
                            '${l10n.volLabel}: ${totalVolume.toInt()} ${l10n.kg}',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Divider(height: 16, thickness: 0.8, color: theme.colorScheme.outlineVariant.withAlpha(100)),
            const SizedBox(height: 4),

            // Sets Table Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 44,
                    child: Text(
                      l10n.set.toUpperCase(),
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      l10n.weight.toUpperCase(),
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      l10n.reps.toUpperCase(),
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 75,
                    child: Text(
                      l10n.time.toUpperCase(),
                      textAlign: TextAlign.end,
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),

            // Sets List
            ...sortedLogs.map((log) {
              final formattedTime = DateFormat('hh:mm a').format(log.completedAt);
              final isRepsMismatch = log.finishedReps != log.reps;

              return Container(
                margin: const EdgeInsets.only(top: 6.0),
                padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest.withAlpha(60),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 44,
                      child: Container(
                        width: 24,
                        height: 24,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withAlpha(30),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${log.setIndex + 1}',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: theme.colorScheme.primary),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${log.weight} ${l10n.kg}',
                        style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        isRepsMismatch ? '${log.finishedReps} / ${log.reps}' : '${log.finishedReps}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: isRepsMismatch ? theme.colorScheme.error : null,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 75,
                      child: Text(
                        formattedTime,
                        textAlign: TextAlign.end,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricBadge(ThemeData theme, IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withAlpha(120),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: theme.colorScheme.onSurfaceVariant),
          const SizedBox(width: 3),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurfaceVariant,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

typedef NewWidget = ExerciseLogDetailsWidget;
