import 'package:flutter/material.dart';
import 'package:uniceps/app/presentation/profile_initial/widgets/selection_tile.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class PGoalPage extends StatelessWidget {
  final Goal? selectedGoal;
  final ValueChanged<Goal> onGoalSelected;

  const PGoalPage({super.key, required this.selectedGoal, required this.onGoalSelected});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.track_changes, size: 80, color: theme.primaryColor),
            const SizedBox(height: 24),
            Text(
              locale.pGoal,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              locale.pGoalDescription,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            SelectionTile(
              title: locale.bulking,
              isSelected: selectedGoal == Goal.bulking,
              onTap: () => onGoalSelected(Goal.bulking),
            ),
            const SizedBox(height: 12),
            SelectionTile(
              title: locale.losingWeight,
              isSelected: selectedGoal == Goal.losingWeight,
              onTap: () => onGoalSelected(Goal.losingWeight),
            ),
            const SizedBox(height: 12),
            SelectionTile(
              title: locale.maintenance,
              isSelected: selectedGoal == Goal.maintenance,
              onTap: () => onGoalSelected(Goal.maintenance),
            ),
          ],
        ),
      ),
    );
  }
}
