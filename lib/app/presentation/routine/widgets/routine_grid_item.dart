import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_heat.dart';
import 'package:uniceps/app/presentation/home/widgets/water_gauge.dart';

class RoutineGridItem extends StatelessWidget {
  const RoutineGridItem({super.key, required this.routine, required this.heat, required this.onTap, this.onMenu});

  final Routine routine;
  final RoutineHeat heat;
  final void Function() onTap;
  final void Function()? onMenu;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.5)),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 8),
                      // Gauge
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          WaveBottleGauge(
                            value: heat.value.clamp(0, 1),
                            size: 60,
                            width: 1.5,
                            fillColor: colorScheme.primary.withValues(alpha: 0.8),
                            borderColor: colorScheme.outlineVariant,
                            backgroundColor: colorScheme.onSurfaceVariant.withValues(alpha: 0.1),
                          ),
                          Text(
                            '${heat.sessionCount}',
                            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: colorScheme.onSurface),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      // Name
                      Text(
                        routine.name,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, letterSpacing: -0.5),
                      ),
                      const Spacer(),
                      // Stats Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _StatMini(icon: Icons.calendar_today_rounded, label: "${heat.days}"),
                          const SizedBox(width: 8),
                          _StatMini(icon: Icons.fitness_center_rounded, label: "${heat.exercises}"),
                          const SizedBox(width: 8),
                          _StatMini(icon: Icons.repeat_rounded, label: "${heat.sets}"),
                        ],
                      ),
                    ],
                  ),
                ),
                // Active Badge
                if (routine.isCurrent)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                // Menu
                if (onMenu != null)
                  Positioned(
                    top: 4,
                    right: 4,
                    child: IconButton(
                      onPressed: onMenu,
                      icon: const Icon(Icons.more_vert_rounded, size: 18),
                      style: IconButton.styleFrom(
                        visualDensity: VisualDensity.compact,
                        backgroundColor: colorScheme.onSurfaceVariant.withValues(alpha: 0.05),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatMini extends StatelessWidget {
  final IconData icon;
  final String label;

  const _StatMini({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.6)),
        Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
