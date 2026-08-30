import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/routine_classes/premade_routine.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class PremadeRoutineDetailsDialog extends StatelessWidget {
  final PremadeRoutine routine;
  final VoidCallback onDownload;

  const PremadeRoutineDetailsDialog({super.key, required this.routine, required this.onDownload});

  String _getLevelName(BuildContext context, RoutineLevel level) {
    final l10n = AppLocalizations.of(context)!;
    switch (level) {
      case RoutineLevel.beginner:
        return l10n.levelBeginner;
      case RoutineLevel.novice:
        return l10n.levelNovice;
      case RoutineLevel.intermediate:
        return l10n.levelIntermediate;
      case RoutineLevel.advanced:
        return l10n.levelAdvanced;
      case RoutineLevel.elite:
        return l10n.levelElite;
      default:
        return 'N/A';
    }
  }

  String _getGenderName(BuildContext context, Gender gender) {
    final l10n = AppLocalizations.of(context)!;
    switch (gender) {
      case Gender.male:
        return l10n.male;
      case Gender.female:
        return l10n.female;
      case Gender.both:
        return l10n.both;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primaryTeal.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.fitness_center_rounded, color: AppColors.primaryTeal),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(routine.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Level & Gender Chips
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildInfoChip(
                  context,
                  Icons.signal_cellular_alt_rounded,
                  _getLevelName(context, routine.level),
                  Colors.orange,
                ),
                _buildInfoChip(
                  context,
                  routine.targetGender == Gender.male
                      ? Icons.male
                      : (routine.targetGender == Gender.female ? Icons.female : Icons.transgender),
                  _getGenderName(context, routine.targetGender),
                  routine.targetGender == Gender.male
                      ? Colors.blue
                      : (routine.targetGender == Gender.female ? Colors.pink : Colors.purple),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              l10n.description,
              style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textSubtle),
            ),
            const SizedBox(height: 4),
            Text(routine.description),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.calendar_month_rounded, size: 20, color: AppColors.primaryTeal),
                const SizedBox(width: 8),
                Text(
                  l10n.trainingDaysCount(routine.daysCount),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text(l10n.cancel)),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryTeal,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onPressed: () {
            onDownload();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.download_rounded),
          label: Text(l10n.download),
        ),
      ],
    );
  }

  Widget _buildInfoChip(BuildContext context, IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
