import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_day.dart';
import 'package:uniceps/app/presentation/diet/blocs/diet_day/diet_day_bloc.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class DeleteDietDayDialog extends StatelessWidget {
  final int planId;
  final DietDay day;
  final VoidCallback? onDelete;

  const DeleteDietDayDialog({super.key, required this.planId, required this.day, this.onDelete});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text('${l10n.delete} ${l10n.day}?'),
      content: Text(l10n.deleteAlertContent(day.name)),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text(l10n.cancel)),
        ElevatedButton(
          onPressed: () {
            context.read<DietDayBloc>().add(DietDayEvent.deleteDay(planId, day.id!));
            Navigator.pop(context);
            onDelete?.call();
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
          child: Text(l10n.delete),
        ),
      ],
    );
  }
}
