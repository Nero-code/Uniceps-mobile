import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_plan.dart';
import 'package:uniceps/app/presentation/diet/blocs/diet_plan/diet_plan_bloc.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class DietPlanAddEditDialog extends StatefulWidget {
  final DietPlan? plan;
  final String? defaultName;

  const DietPlanAddEditDialog({super.key, this.plan, this.defaultName});

  @override
  State<DietPlanAddEditDialog> createState() => _DietPlanAddEditDialogState();
}

class _DietPlanAddEditDialogState extends State<DietPlanAddEditDialog> {
  late TextEditingController _nameController;
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.plan?.name ?? widget.defaultName ?? '');
    _descController = TextEditingController(text: widget.plan?.description ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AlertDialog(
      scrollable: true,
      title: Text(widget.plan == null ? l10n.addPlan : l10n.renamePlan),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(hintText: l10n.pName),
            autofocus: true,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _descController,
            decoration: InputDecoration(hintText: l10n.description),
            minLines: 1,
            maxLines: 5,
          ),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text(l10n.cancel)),
        ElevatedButton(
          onPressed: () {
            final name = _nameController.text.trim();
            final description = _descController.text.trim();
            if (name.isNotEmpty) {
              if (widget.plan == null) {
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
                    widget.plan!.copyWith(name: name, description: description.isEmpty ? null : description),
                  ),
                );
              }
              Navigator.pop(context);
            }
          },
          child: Text(l10n.save),
        ),
      ],
    );
  }
}
