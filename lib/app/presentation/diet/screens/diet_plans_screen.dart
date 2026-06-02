import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_plan.dart';
import 'package:uniceps/app/presentation/diet/blocs/diet_plan/diet_plan_bloc.dart';
import 'package:uniceps/app/presentation/diet/screens/diet_screen.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/core/widgets/reload_widget.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class DietPlansScreen extends StatelessWidget {
  const DietPlansScreen({super.key});

  void _showPlanDialog(BuildContext context, {DietPlan? plan}) {
    final l10n = AppLocalizations.of(context)!;
    final nameController = TextEditingController(text: plan?.name ?? '');
    final descController = TextEditingController(text: plan?.description ?? '');
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(plan == null ? l10n.addPlan : l10n.renamePlan),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: l10n.pName),
              autofocus: true,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: descController,
              decoration: InputDecoration(hintText: l10n.description),
              maxLines: 5,
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l10n.cancel)),
          ElevatedButton(
            onPressed: () {
              final name = nameController.text.trim();
              final description = descController.text.trim();
              if (name.isNotEmpty) {
                if (plan == null) {
                  context.read<DietPlanBloc>().add(
                    DietPlanEvent.addPlan(
                      DietPlan(
                        name: name,
                        description: description.isEmpty ? null : description,
                        createdAt: DateTime.now(),
                        days: [],
                      ),
                    ),
                  );
                } else {
                  context.read<DietPlanBloc>().add(
                    DietPlanEvent.updatePlan(
                      plan.copyWith(name: name, description: description.isEmpty ? null : description),
                    ),
                  );
                }
                Navigator.pop(ctx);
              }
            },
            child: Text(l10n.save),
          ),
        ],
      ),
    );
  }

  void _showDeletePlanDialog(BuildContext context, DietPlan plan) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('${l10n.deletePlan}?'),
        content: Text(l10n.deleteAlertContent(plan.name)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l10n.cancel)),
          ElevatedButton(
            onPressed: () {
              context.read<DietPlanBloc>().add(DietPlanEvent.deletePlan(plan.id!));
              Navigator.pop(ctx);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );
  }

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
                      ElevatedButton(onPressed: () => _showPlanDialog(context), child: Text(l10n.createFirstPlan)),
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
                            icon: const Icon(Icons.delete_outline, color: Colors.red),
                            onPressed: () => _showDeletePlanDialog(context, plan),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showPlanDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
