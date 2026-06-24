import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_plan.dart';
import 'package:uniceps/app/presentation/diet/blocs/diet_plan/diet_plan_bloc.dart';
import 'package:uniceps/app/presentation/diet/dialogs/delete_diet_plan_dialog.dart';
import 'package:uniceps/app/presentation/diet/dialogs/diet_plan_add_edit_dialog.dart';
import 'package:uniceps/app/presentation/diet/screens/diet_screen.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class DietPlanWidget extends StatelessWidget {
  const DietPlanWidget({super.key, required this.plan});

  final DietPlan plan;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Card(
      color: plan.isCurrent ? Theme.of(context).colorScheme.secondary.withAlpha(100) : null,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        visualDensity: const VisualDensity(),
        title: Text(plan.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (plan.description != null)
              Text(
                plan.description!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            Text(
              '${l10n.createdOn} ${DateFormat.yMMMd().format(plan.createdAt)}',
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: plan.isCurrent
                  ? Icon(Icons.check_circle, color: Theme.of(context).colorScheme.primary)
                  : const Icon(Icons.circle_outlined),
              padding: .zero,
              onPressed: plan.isCurrent
                  ? null
                  : () => context.read<DietPlanBloc>().add(DietPlanEvent.setCurrentPlan(plan.id!)),
            ),
            IconButton(
              icon: const Icon(Icons.edit_outlined),
              padding: .zero,
              onPressed: () => showDialog(
                context: context,
                builder: (_) => BlocProvider.value(
                  value: context.read<DietPlanBloc>(),
                  child: DietPlanAddEditDialog(plan: plan),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              padding: .zero,
              onPressed: () => showDialog(
                context: context,
                builder: (_) => BlocProvider.value(
                  value: context.read<DietPlanBloc>(),
                  child: DeleteDietPlanDialog(plan: plan),
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DietScreen(plan: plan)));
        },
      ),
    );
  }
}
