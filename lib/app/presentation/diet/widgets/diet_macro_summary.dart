import 'package:flutter/material.dart';

class DietMacroSummary extends StatelessWidget {
  final double calories;
  final double protein;
  final double carbs;
  final double fats;
  final bool compact;

  const DietMacroSummary({
    super.key,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fats,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    if (compact) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildCompactItem(context, 'P', protein, Colors.orange),
          const SizedBox(width: 8),
          _buildCompactItem(context, 'C', carbs, Colors.blue),
          const SizedBox(width: 8),
          _buildCompactItem(context, 'F', fats, Colors.red),
        ],
      );
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.blueGrey.shade50, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Text(
            '${calories.toStringAsFixed(0)} kcal',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMacroItem(context, 'Protein', protein, Colors.orange),
              _buildMacroItem(context, 'Carbs', carbs, Colors.blue),
              _buildMacroItem(context, 'Fats', fats, Colors.red),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMacroItem(BuildContext context, String label, double value, Color color) {
    return Column(
      children: [
        Text(
          '${value.toStringAsFixed(1)}g',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
        ),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildCompactItem(BuildContext context, String label, double value, Color color) {
    return Row(
      children: [
        Text(
          '$label:',
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: color),
        ),
        const SizedBox(width: 2),
        Text('${value.toStringAsFixed(0)}g', style: const TextStyle(fontSize: 10)),
      ],
    );
  }
}
