import 'package:flutter/material.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class DayEditFlaotingMenu extends StatelessWidget {
  const DayEditFlaotingMenu({super.key, required this.onEdit, required this.onReorder, required this.onRemove});

  final void Function() onEdit, onReorder, onRemove;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final screenSize = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
        child: SizedBox(
          width: screenSize.width * .45,
          child: Material(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(5.0),
            elevation: 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text(locale.edit),
                  leading: const Icon(Icons.edit),
                  onTap: onEdit,
                ),
                ListTile(
                  title: Text(locale.reorder),
                  leading: const Icon(Icons.swap_vert_rounded),
                  onTap: onReorder,
                ),
                ListTile(
                  title: Text(locale.delete),
                  leading: const Icon(Icons.delete),
                  onTap: onRemove,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
