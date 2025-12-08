import 'package:flutter/material.dart';
import 'package:uniceps/l10n/app_localizations.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';
import 'package:uniceps/app/presentation/blocs/locale/locale_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DayDeleteDialog extends StatelessWidget {
  const DayDeleteDialog({super.key, required this.onPositive, required this.dayToDelete});

  final RoutineDay dayToDelete;

  final void Function(RoutineDay toDelete) onPositive;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final rtl = context.read<LocaleCubit>().state.isRtl();
    return AlertDialog(
      icon: Icon(
        Icons.delete_forever,
        color: Colors.red.shade300,
        size: 40,
      ),
      title: Text("${locale.delete}${rtl ? '؟' : '?'} ${dayToDelete.name}"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(locale.deleteAlertContent(dayToDelete.name)),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(locale.cancel),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.red.shade300),
                    foregroundColor: const WidgetStatePropertyAll(Colors.white),
                  ),
                  onPressed: () {
                    onPositive(dayToDelete);
                    Navigator.pop(context);
                  },
                  child: Text(locale.ok),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
