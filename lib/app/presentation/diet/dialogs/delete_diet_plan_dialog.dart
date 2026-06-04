import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_plan.dart';
import 'package:uniceps/app/presentation/diet/blocs/diet_plan/diet_plan_bloc.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class DeleteDietPlanDialog extends StatelessWidget {
  final DietPlan plan;

  const DeleteDietPlanDialog({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text('${l10n.deletePlan}?'),
      content: Text(l10n.deleteAlertContent(plan.name)),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text(l10n.cancel)),
        ElevatedButton(
          onPressed: () {
            context.read<DietPlanBloc>().add(DietPlanEvent.deletePlan(plan.id!));
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
          child: Text(l10n.delete),
        ),
      ],
    );
  }
}
