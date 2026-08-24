import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_log.dart';
import 'package:uniceps/core/Themes/light_theme.dart';

class DietLogTile extends StatelessWidget {
  final DietLog log;
  final VoidCallback? onTap;
  const DietLogTile({super.key, required this.log, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: mainBlueLight.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(Icons.restaurant, color: mainBlueLight),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      log.ingredientName,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: mainBlueDark),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${log.totalGrams.toStringAsFixed(0)}g • ${log.calories.toStringAsFixed(0)} kcal',
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  NutrientBadge(label: 'P', value: '${log.protein.toStringAsFixed(0)}g', color: Colors.orange),
                  const SizedBox(height: 4),
                  NutrientBadge(label: 'C', value: '${log.carbs.toStringAsFixed(0)}g', color: Colors.green),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NutrientBadge extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  const NutrientBadge({super.key, required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 10),
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: mainBlueDark),
        ),
      ],
    );
  }
}
