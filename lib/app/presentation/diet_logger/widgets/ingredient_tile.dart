import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/diet_classes/ingredient.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class IngredientTile extends StatelessWidget {
  final Ingredient ingredient;
  final VoidCallback? onTap;

  const IngredientTile({super.key, required this.ingredient, this.onTap});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 0,
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: ingredient.isUserGenerated
              ? Colors.orange.withValues(alpha: 0.1)
              : mainBlueLight.withValues(alpha: 0.1),
          child: Icon(
            ingredient.isUserGenerated ? Icons.person : Icons.restaurant,
            color: ingredient.isUserGenerated ? Colors.orange : mainBlueLight,
            size: 20,
          ),
        ),
        title: Text(ingredient.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(ingredient.categoryName),
            const SizedBox(height: 4),
            Row(
              children: [
                _MacroBadge(
                  label: locale.protein[0].toUpperCase(),
                  value: '${ingredient.protein.toStringAsFixed(1)}${locale.grams}',
                  color: Colors.orange,
                ),
                const SizedBox(width: 8),
                _MacroBadge(
                  label: locale.carbs[0].toUpperCase(),
                  value: '${ingredient.carbs.toStringAsFixed(1)}${locale.grams}',
                  color: Colors.green,
                ),
                const SizedBox(width: 8),
                _MacroBadge(
                  label: locale.fats[0].toUpperCase(),
                  value: '${ingredient.fats.toStringAsFixed(1)}${locale.grams}',
                  color: Colors.redAccent,
                ),
              ],
            ),
          ],
        ),
        trailing: Text(
          '${ingredient.calories.toStringAsFixed(0)} ${locale.kcal}',
          style: const TextStyle(fontWeight: FontWeight.bold, color: mainBlue),
        ),
      ),
    );
  }
}

class _MacroBadge extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _MacroBadge({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 10),
        ),
        const SizedBox(width: 2),
        Text(value, style: const TextStyle(fontSize: 10)),
      ],
    );
  }
}
