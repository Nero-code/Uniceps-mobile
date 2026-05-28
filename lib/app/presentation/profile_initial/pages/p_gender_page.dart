import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class PGenderPage extends StatelessWidget {
  final Gender? selectedGender;
  final ValueChanged<Gender> onGenderSelected;

  const PGenderPage({super.key, required this.selectedGender, required this.onGenderSelected});

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
            Icon(Icons.wc_outlined, size: 80, color: theme.primaryColor),
            const SizedBox(height: 24),
            Text(
              locale.gender,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              locale.pGenderDescription,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: _GenderCard(
                    genderType: Gender.male,
                    icon: Icons.male_rounded,
                    label: locale.male,
                    color: Colors.blue,
                    isSelected: selectedGender == Gender.male,
                    onTap: () => onGenderSelected(Gender.male),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _GenderCard(
                    genderType: Gender.female,
                    icon: Icons.female_rounded,
                    label: locale.female,
                    color: Colors.pink,
                    isSelected: selectedGender == Gender.female,
                    onTap: () => onGenderSelected(Gender.female),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _GenderCard extends StatelessWidget {
  final Gender genderType;
  final IconData icon;
  final String label;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const _GenderCard({
    required this.genderType,
    required this.icon,
    required this.label,
    required this.color,
    required bool this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 40),
        decoration: BoxDecoration(
          color: isSelected ? color.withAlpha(26) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isSelected ? color : Colors.grey.withAlpha(51), width: isSelected ? 3 : 1),
        ),
        child: Column(
          children: [
            Icon(icon, size: 60, color: isSelected ? color : Colors.grey),
            const SizedBox(height: 16),
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? color : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
