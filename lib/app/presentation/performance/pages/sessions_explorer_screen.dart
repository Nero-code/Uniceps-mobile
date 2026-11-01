import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_session.dart';
import 'package:uniceps/app/presentation/performance/cubits/metrics/metrics_cubit.dart';
import 'package:uniceps/app/presentation/performance/widgets/sessions_card.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/l10n/app_localizations.dart';

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
    final l10n = AppLocalizations.of(context)!;
    final primaryColor = theme.colorScheme.primary;

    return BlocBuilder<MetricsCubit, MetricsState>(
      builder: (context, state) {
        if (state is MetricsLoading || state is MetricsInitial) {
          return const LoadingIndicator();
        }

        if (state is MetricsFailure) {
          return Center(
            child: Text(l10n.errLoadSessions, style: TextStyle(color: theme.colorScheme.onSurfaceVariant)),
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
                            SummaryTile(
                              icon: Icons.check_circle_outline,
                              label: l10n.finished,
                              value: "${allSessions.length}",
                            ),
                            SummaryTile(
                              icon: Icons.pie_chart_outline,
                              label: l10n.avgProgress,
                              value: "${avgCompletionProgress.toInt()}%",
                            ),
                            SummaryTile(
                              icon: Icons.fitness_center_outlined,
                              label: l10n.totalVolumeLabel,
                              value: "${(totalAllTimeVolume / 1000).toStringAsFixed(1)}k ${l10n.kg}",
                            ),
                            SummaryTile(
                              icon: Icons.timer_outlined,
                              label: l10n.timeSpent,
                              value: "${(totalTimeMinutes / 60).toStringAsFixed(1)} ${l10n.hour}",
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
                                              ? "${l10n.from}: ${DateFormat('MMM dd, yyyy').format(_fromDate!)}"
                                              : l10n.fromAnyDate,
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
                                              ? "${l10n.to}: ${DateFormat('MMM dd, yyyy').format(_toDate!)}"
                                              : l10n.toToday,
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
                                tooltip: l10n.clearDateFilter,
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
                                l10n.noSessionsInRange,
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
                            return SessionsCard(session: session);
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
}

class SummaryTile extends StatelessWidget {
  const SummaryTile({super.key, required this.icon, required this.value, required this.label});

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
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
