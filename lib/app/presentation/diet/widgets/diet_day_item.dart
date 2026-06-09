import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_day.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_meal.dart';

class DietDayItem extends StatelessWidget {
  final DietDay day;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final Function(DietMeal meal) onMealTap;
  final VoidCallback onAddMeal;

  const DietDayItem({
    super.key,
    required this.day,
    required this.onEdit,
    required this.onDelete,
    required this.onMealTap,
    required this.onAddMeal,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ExpansionTile(
        title: Text(day.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(icon: const Icon(Icons.edit, size: 20), onPressed: onEdit),
            IconButton(
              icon: const Icon(Icons.delete, size: 20, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
        children: [
          ...day.meals.map(
            (meal) => ListTile(
              title: Text(meal.name),
              subtitle: Text('${meal.ingredients.length} ingredients'),
              onTap: () => onMealTap(meal),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
          ListTile(leading: const Icon(Icons.add), title: const Text('Add Meal'), onTap: onAddMeal),
        ],
      ),
    );
  }
}
