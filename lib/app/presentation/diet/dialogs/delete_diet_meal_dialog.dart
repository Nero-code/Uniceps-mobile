import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_meal.dart';
import 'package:uniceps/app/presentation/diet/blocs/diet_meal/diet_meal_bloc.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class DeleteDietMealDialog extends StatelessWidget {
  final int dayId;
  final DietMeal meal;

  const DeleteDietMealDialog({super.key, required this.dayId, required this.meal});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text('${l10n.deleteMeal}?'),
      content: Text(l10n.deleteAlertContent(meal.name)),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text(l10n.cancel)),
        ElevatedButton(
          onPressed: () {
            context.read<DietMealBloc>().add(DietMealEvent.deleteMeal(dayId, meal.id!));
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
          child: Text(l10n.delete),
        ),
      ],
    );
  }
}
