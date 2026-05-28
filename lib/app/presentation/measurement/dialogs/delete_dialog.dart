import 'package:flutter/material.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({super.key, required this.onPositive, required this.itemName});

  final String itemName;

  final void Function() onPositive;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    // final isRtl = context.read<LocaleCubit>().state.isRtl();
    final isRtl = Directionality.of(context) == .rtl;
    final screen = MediaQuery.sizeOf(context);

    return AlertDialog(
      icon: Icon(Icons.delete_forever, color: Colors.red.shade300, size: 40),
      title: Text("${locale.delete} $itemName${isRtl ? '؟' : '?'}"),
      content: Text(locale.deleteAlertContent(itemName)),
      actions: [
        SizedBox(
          width: screen.width * .3,
          child: OutlinedButton(onPressed: () => Navigator.pop(context), child: Text(locale.cancel)),
        ),
        SizedBox(
          width: screen.width * .3,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.red.shade300),
              foregroundColor: const WidgetStatePropertyAll(Colors.white),
            ),
            onPressed: () {
              onPositive();
              Navigator.pop(context);
            },
            child: Text(locale.ok),
          ),
        ),
      ],
    );
  }
}
