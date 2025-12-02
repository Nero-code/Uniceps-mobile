import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/blocs/locale/locale_cubit.dart';

class RoutineImportExportDialog extends StatelessWidget {
  const RoutineImportExportDialog(
      {super.key, required this.onConfirm, required this.title, required this.content, required this.isIn});

  final VoidCallback onConfirm;
  final String title, content;
  final bool isIn;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final ar = context.read<LocaleCubit>().state.isRtl();

    return AlertDialog(
      icon:
          Icon(isIn ? Icons.download : Icons.import_export, color: const Color.fromARGB(255, 192, 192, 192), size: 50),
      title: Text("$title${ar ? '؟' : '?'}"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(content),
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
                    onPressed: () {
                      onConfirm();
                      Navigator.pop(context);
                    },
                    child: Text(locale.confirm)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
