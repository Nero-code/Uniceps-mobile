import 'package:flutter/material.dart';
import 'package:uniceps/app/presentation/profile/widgets/selection_tile.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class PActivityLevelPage extends StatelessWidget {
  const PActivityLevelPage({super.key, required this.selectedLevel, required this.onLevelChanged});

  final ActivityLevel? selectedLevel;
  final ValueChanged<ActivityLevel> onLevelChanged;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Icon(Icons.directions_run, size: 80, color: Theme.of(context).primaryColor),
            const SizedBox(height: 24),
            Text(
              locale.pActivityLevel,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              locale.pActivityLevelDescription,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            SelectionTile(
              title: locale.sedentary,
              isSelected: selectedLevel == ActivityLevel.sedentary,
              onTap: () => onLevelChanged(ActivityLevel.sedentary),
            ),
            const SizedBox(height: 10),
            SelectionTile(
              title: locale.lightlyActive,
              isSelected: selectedLevel == ActivityLevel.lightlyActive,
              onTap: () => onLevelChanged(ActivityLevel.lightlyActive),
            ),
            const SizedBox(height: 10),
            SelectionTile(
              title: locale.moderatelyActive,
              isSelected: selectedLevel == ActivityLevel.moderatelyActive,
              onTap: () => onLevelChanged(ActivityLevel.moderatelyActive),
            ),
            const SizedBox(height: 10),
            SelectionTile(
              title: locale.veryActive,
              isSelected: selectedLevel == ActivityLevel.veryActive,
              onTap: () => onLevelChanged(ActivityLevel.veryActive),
            ),
            const SizedBox(height: 10),
            SelectionTile(
              title: locale.extraActive,
              isSelected: selectedLevel == ActivityLevel.extraActive,
              onTap: () => onLevelChanged(ActivityLevel.extraActive),
            ),
          ],
        ),
      ),
    );
  }
}
