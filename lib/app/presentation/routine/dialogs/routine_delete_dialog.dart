import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/app/presentation/blocs/locale/locale_cubit.dart';

class RoutineDeleteDialog extends StatelessWidget {
  const RoutineDeleteDialog({
    super.key,
    required this.routineName,
    required this.onConfirm,
  });

  final String routineName;
  final void Function() onConfirm;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final ar = context.read<LocaleCubit>().state.isRtl();

    return AlertDialog(
      icon: const Icon(Icons.delete, color: Colors.red, size: 40),
      title: Text("${locale.delete}${ar ? '؟' : '?'}"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(locale.deleteAlertContent(routineName)),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(locale.cancel),
                ),
              ),
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
