import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/blocs/locale/locale_cubit.dart';

class RoutineImportDialog extends StatelessWidget {
  const RoutineImportDialog({super.key, required this.onConfirm});
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final ar = context.read<LocaleCubit>().state.isRtl();

    return AlertDialog(
      icon: const Icon(Icons.download, color: Colors.grey, size: 40),
      title: Text("${locale.importRoutine}${ar ? '؟' : '?'}"),
      content: Text(locale.importRoutineAlertContent),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(locale.cancel),
        ),
        ElevatedButton(
            onPressed: () {
              onConfirm();
              Navigator.pop(context);
            },
            child: Text(locale.confirm)),
      ],
    );
  }
}
