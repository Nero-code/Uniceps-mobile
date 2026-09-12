import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_heat.dart';
import 'package:uniceps/app/presentation/home/widgets/water_gauge.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class RoutineWithHeat extends StatelessWidget {
  const RoutineWithHeat({
    super.key,
    required this.routine,
    required this.heat,
    required this.onTap,
    this.onMenu,
    this.onLongPress,
  });

  final Routine routine;
  final RoutineHeat heat;
  final void Function() onTap;
  final void Function()? onMenu;
  final void Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.5)),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 12, offset: const Offset(0, 4))],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: onTap,

          onLongPress: onLongPress,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Consistency Gauge
                Stack(
                  alignment: Alignment.center,
                  children: [
                    WaveBottleGauge(
                      value: heat.value.clamp(0, 1),
                      size: 56,
                      width: 1.5,
                      fillColor: colorScheme.primary.withValues(alpha: 0.8),
                      borderColor: colorScheme.outlineVariant,
                      backgroundColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                    ),
                    Text(
                      '${heat.sessionCount}',
                      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: colorScheme.onSurface),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                // Routine Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              routine.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: -0.5),
                            ),
                          ),
                          if (routine.isCurrent)
                            Container(
                              margin: const EdgeInsets.only(left: 8),
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.green.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.green.withValues(alpha: 0.2)),
                              ),
                              child: Text(
                                locale.active.toUpperCase(),
                                style: const TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.w900),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          _StatBadge(
                            icon: Icons.calendar_view_day_rounded,
                            label: "${heat.days}",
                            iconColor: Colors.blue,
                          ),
                          const SizedBox(width: 12),
                          _StatBadge(
                            icon: Icons.fitness_center_rounded,
                            label: "${heat.exercises}",
                            iconColor: Colors.red,
                          ),
                          const SizedBox(width: 12),
                          _StatBadge(icon: Icons.repeat_rounded, label: "${heat.sets}", iconColor: Colors.orange),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        DateFormat('MMM d, yyyy').format(routine.createdAt),
                        style: TextStyle(
                          fontSize: 12,
                          color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                // Options Menu
                if (onMenu != null)
                  IconButton(
                    onPressed: onMenu,
                    style: IconButton.styleFrom(
                      backgroundColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                      padding: const EdgeInsets.all(8),
                    ),
                    icon: const Icon(Icons.more_horiz_rounded, size: 20),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatBadge extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;

  const _StatBadge({required this.icon, required this.label, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: iconColor.withValues(alpha: 0.8)),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
