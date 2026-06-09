import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_day.dart';
import 'package:uniceps/app/presentation/diet/blocs/diet_day/diet_day_bloc.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class DietDayAddEditDialog extends StatefulWidget {
  final int planId;
  final DietDay? day;
  final String? defaultName;

  const DietDayAddEditDialog({super.key, required this.planId, this.day, this.defaultName});

  @override
  State<DietDayAddEditDialog> createState() => _DietDayAddEditDialogState();
}

class _DietDayAddEditDialogState extends State<DietDayAddEditDialog> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.day?.name ?? widget.defaultName ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(widget.day == null ? '${l10n.add} ${l10n.day}' : l10n.rename),
      content: TextField(
        controller: _nameController,
        decoration: InputDecoration(hintText: l10n.pName),
        autofocus: true,
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text(l10n.cancel)),
        ElevatedButton(
          onPressed: () {
            final name = _nameController.text.trim();
            if (name.isNotEmpty) {
              if (widget.day == null) {
                context.read<DietDayBloc>().add(
                  DietDayEvent.addDay(widget.planId, DietDay(name: name, index: 0, meals: [])),
                );
              } else {
                context.read<DietDayBloc>().add(
                  DietDayEvent.updateDay(widget.planId, widget.day!.copyWith(name: name)),
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
