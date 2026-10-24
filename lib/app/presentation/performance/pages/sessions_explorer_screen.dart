import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_log.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_session.dart';
import 'package:uniceps/app/domain/commands/routine_management/exercises_commands.dart';
import 'package:uniceps/app/presentation/performance/cubits/metrics/metrics_cubit.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/injection_dependency.dart';

class SessionsExplorerScreen extends StatefulWidget {
  const SessionsExplorerScreen({super.key});

  @override
  State<SessionsExplorerScreen> createState() => _SessionsExplorerScreenState();
}

class _SessionsExplorerScreenState extends State<SessionsExplorerScreen> {
  DateTime? _fromDate;
  DateTime? _toDate;

  List<TSession> _getFilteredSessions(List<TSession> allSessions) {
    return allSessions.where((session) {
      if (_fromDate != null) {
        final startOfDay = DateTime(_fromDate!.year, _fromDate!.month, _fromDate!.day);
        if (session.createdAt.isBefore(startOfDay)) return false;
      }
      if (_toDate != null) {
        final endOfDay = DateTime(_toDate!.year, _toDate!.month, _toDate!.day, 23, 59, 59);
        if (session.createdAt.isAfter(endOfDay)) return false;
      }
      return true;
    }).toList();
  }

  double _calcAvgCompletionProgress(List<TSession> sessions) {
    if (sessions.isEmpty) return 0.0;
    final totalProgress = sessions.fold(0.0, (sum, session) => sum + session.progress);
    return (totalProgress / sessions.length) * 100;
  }

  double _calcTotalAllTimeVolume(List<TSession> sessions) {
    double sum = 0;
    for (var session in sessions) {
      for (var log in session.logs) {
        sum += (log.weight * log.finishedReps);
      }
    }
    return sum;
  }

  int _calcTotalTimeMinutes(List<TSession> sessions) {
    int total = 0;
    for (var session in sessions) {
      if (session.finishedAt != null) {
        total += session.finishedAt!.difference(session.createdAt).inMinutes;
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return BlocBuilder<MetricsCubit, MetricsState>(
      builder: (context, state) {
        if (state is MetricsLoading || state is MetricsInitial) {
          return const LoadingIndicator();
        }

        if (state is MetricsFailure) {
          return Center(
            child: Text("Failed to load sessions", style: TextStyle(color: theme.colorScheme.onSurfaceVariant)),
          );
        }

        if (state is MetricsLoaded) {
          final allSessions = state.result.sessions;
          final filtered = _getFilteredSessions(allSessions);

          final avgCompletionProgress = _calcAvgCompletionProgress(allSessions);
          final totalAllTimeVolume = _calcTotalAllTimeVolume(allSessions);
          final totalTimeMinutes = _calcTotalTimeMinutes(allSessions);

          return ColoredBox(
            color: Colors.white,
            child: Column(
              children: [
                // All-time summary header
                ColoredBox(
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.paddingOf(context).top + 12,
                          left: 16,
                          right: 16,
                          bottom: 4,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainerHighest.withAlpha(120),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: theme.colorScheme.outlineVariant.withAlpha(80)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildSummaryTile(context, Icons.check_circle_outline, "${allSessions.length}", "Finished"),
                            _buildSummaryTile(
                              context,
                              Icons.pie_chart_outline,
                              "${avgCompletionProgress.toInt()}%",
                              "Avg Progress",
                            ),
                            _buildSummaryTile(
                              context,
                              Icons.fitness_center_outlined,
                              "${(totalAllTimeVolume / 1000).toStringAsFixed(1)}k kg",
                              "Total Volume",
                            ),
                            _buildSummaryTile(
                              context,
                              Icons.timer_outlined,
                              "${(totalTimeMinutes / 60).toStringAsFixed(1)} hrs",
                              "Time Spent",
                            ),
                          ],
                        ),
                      ),

                      // Date Search Controls (From / To)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  final picked = await showDatePicker(
                                    context: context,
                                    initialDate: _fromDate ?? DateTime.now().subtract(const Duration(days: 30)),
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime.now(),
                                  );
                                  if (picked != null) {
                                    setState(() => _fromDate = picked);
                                  }
                                },
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: _fromDate != null
                                          ? primaryColor
                                          : theme.colorScheme.outline.withAlpha(100),
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    color: _fromDate != null ? primaryColor.withAlpha(15) : theme.colorScheme.surface,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.calendar_month, size: 16, color: primaryColor),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          _fromDate != null
                                              ? "From: ${DateFormat('MMM dd, yyyy').format(_fromDate!)}"
                                              : "From: Any Date",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: _fromDate != null ? FontWeight.bold : FontWeight.normal,
                                            color: _fromDate != null
                                                ? primaryColor
                                                : theme.colorScheme.onSurfaceVariant,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  final picked = await showDatePicker(
                                    context: context,
                                    initialDate: _toDate ?? DateTime.now(),
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime.now(),
                                  );
                                  if (picked != null) {
                                    setState(() => _toDate = picked);
                                  }
                                },
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: _toDate != null ? primaryColor : theme.colorScheme.outline.withAlpha(100),
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    color: _toDate != null ? primaryColor.withAlpha(15) : theme.colorScheme.surface,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.event, size: 16, color: primaryColor),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          _toDate != null
                                              ? "To: ${DateFormat('MMM dd, yyyy').format(_toDate!)}"
                                              : "To: Today",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: _toDate != null ? FontWeight.bold : FontWeight.normal,
                                            color: _toDate != null ? primaryColor : theme.colorScheme.onSurfaceVariant,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            if (_fromDate != null || _toDate != null) ...[
                              const SizedBox(width: 6),
                              IconButton(
                                icon: const Icon(Icons.clear, size: 20),
                                onPressed: () {
                                  setState(() {
                                    _fromDate = null;
                                    _toDate = null;
                                  });
                                },
                                tooltip: "Clear Date Filter",
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Sessions List
                Expanded(
                  child: filtered.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.history_toggle_off_rounded,
                                size: 64,
                                color: theme.colorScheme.outline.withAlpha(120),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                "No finished sessions found in selected range",
                                style: TextStyle(color: theme.colorScheme.onSurfaceVariant, fontSize: 14),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                          itemCount: filtered.length,
                          itemBuilder: (context, index) {
                            final session = filtered[index];
                            return _SessionCard(session: session);
                          },
                        ),
                ),
              ],
            ),
          );
        }

        return const SizedBox();
      },
    );
  }

  Widget _buildSummaryTile(BuildContext context, IconData icon, String value, String label) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: primaryColor),
            const SizedBox(width: 5),
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: theme.colorScheme.onSurface),
            ),
          ],
        ),
        const SizedBox(height: 3),
        Text(label, style: TextStyle(fontSize: 11, color: theme.colorScheme.onSurfaceVariant)),
      ],
    );
  }
}

class _SessionCard extends StatelessWidget {
  const _SessionCard({required this.session});

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
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outlineVariant.withAlpha(100), width: 1.0),
      ),
      child: Theme(
        data: theme.copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
          childrenPadding: const EdgeInsets.fromLTRB(14.0, 0, 14.0, 14.0),
          title: Row(
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
                decoration: BoxDecoration(color: primaryColor.withAlpha(20), borderRadius: BorderRadius.circular(6)),
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
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  _buildHeaderMetricChip(context, Icons.fitness_center_outlined, "$uniqueExercisesCount ex"),
                  _buildHeaderMetricChip(context, Icons.format_list_bulleted, "${session.logs.length} sets"),
                  _buildHeaderMetricChip(context, Icons.bar_chart, "${sessionVolume.toInt()} kg"),
                  _buildHeaderMetricChip(context, Icons.pie_chart_outline, "${(session.progress * 100).toInt()}%"),
                ],
              ),
            ],
          ),
          children: [
            const Divider(height: 16, thickness: 0.5),
            // Exercise Logs Breakdown
            _buildLogsBreakdown(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderMetricChip(BuildContext context, IconData icon, String label) {
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

  Widget _buildLogsBreakdown(BuildContext context) {
    final Map<String, List<TLog>> groupedLogs = {};
    for (var log in session.logs) {
      groupedLogs.putIfAbsent(log.exerciseId, () => []).add(log);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: groupedLogs.entries.map((entry) {
        final logs = entry.value;
        final logsDescending = logs.reversed.toList();

        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ExerciseNameText(exerciseId: entry.key),
              const SizedBox(height: 6),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: logsDescending.map((log) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainerHighest.withAlpha(150),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Theme.of(context).colorScheme.outlineVariant.withAlpha(80), width: 0.5),
                    ),
                    child: Text(
                      "Set ${log.setIndex}: ${log.weight}kg × ${log.finishedReps}",
                      style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.onSurface),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _ExerciseNameText extends StatelessWidget {
  const _ExerciseNameText({required this.exerciseId});

  final String exerciseId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final commands = sl<ExercisesCommands>();

    return FutureBuilder<String>(
      future: commands.getExerciseName(exerciseId),
      builder: (context, snapshot) {
        final name = snapshot.data ?? exerciseId;
        return Text(
          name,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: theme.colorScheme.primary),
        );
      },
    );
  }
}
