import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/presentation/diet/blocs/diet_plan/diet_plan_bloc.dart';
import 'package:uniceps/app/presentation/diet/dialogs/delete_diet_plan_dialog.dart';
import 'package:uniceps/app/presentation/diet/dialogs/diet_plan_add_edit_dialog.dart';
import 'package:uniceps/app/presentation/diet/screens/diet_screen.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/core/widgets/reload_widget.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class DietPlansScreen extends StatelessWidget {
  const DietPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.myDietPlans)),
      body: BlocBuilder<DietPlanBloc, DietPlanState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const LoadingIndicator(),
            error: (f) => ReloadScreenWidget(
              f: f,
              callBack: () => context.read<DietPlanBloc>().add(const DietPlanEvent.getPlans()),
            ),
            loaded: (plans, current) {
              if (plans.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(l10n.empty),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => showDialog(
                          context: context,
                          builder: (_) => BlocProvider.value(
                            value: context.read<DietPlanBloc>(),
                            child: DietPlanAddEditDialog(defaultName: '${l10n.dietPlans} #1'),
                          ),
                        ),
                        child: Text(l10n.createFirstPlan),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: plans.length,
                itemBuilder: (context, index) {
                  final plan = plans[index];
                  final isCurrent = plan.id == current?.id;
                  return Card(
                    color: isCurrent ? Theme.of(context).colorScheme.secondary.withAlpha(100) : null,
                    elevation: 0,
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
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
                          if (isCurrent)
                            Icon(Icons.check_circle, color: Theme.of(context).colorScheme.primary)
                          else
                            IconButton(
                              icon: const Icon(Icons.circle_outlined),
                              onPressed: () => context.read<DietPlanBloc>().add(DietPlanEvent.setCurrentPlan(plan.id!)),
                            ),
                          IconButton(
                            icon: const Icon(Icons.edit_outlined),
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
                },
              );
            },
            orElse: () => const SizedBox(),
          );
        },
      ),
      floatingActionButton: BlocBuilder<DietPlanBloc, DietPlanState>(
        builder: (context, state) {
          final count = state.maybeWhen(loaded: (plans, _) => plans.length, orElse: () => 0);
          return FloatingActionButton(
            onPressed: () => showDialog(
              context: context,
              builder: (_) => BlocProvider.value(
                value: context.read<DietPlanBloc>(),
                child: DietPlanAddEditDialog(defaultName: '${l10n.dietPlans} #${count + 1}'),
              ),
            ),
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}
