import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DaysSortingDialog extends StatefulWidget {
  const DaysSortingDialog(
      {super.key, required this.days, required this.onReorder});

  final List<RoutineDay> days;

  final void Function(List<RoutineDay> sorted) onReorder;

  @override
  State<DaysSortingDialog> createState() => _DaysSortingDialogState();
}

class _DaysSortingDialogState extends State<DaysSortingDialog> {
  List<RoutineDay> reorderedList = [];
  @override
  void initState() {
    super.initState();
    reorderedList = widget.days;
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return AlertDialog(
      title: const Text("title"),
      content: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ReorderableListView(
          shrinkWrap: true,
          primary: true,
          // proxyDecorator: (child, index, animation) => Material(
          //   color: Colors.white,
          //   child: Transform.scale(
          //     child: child,
          //   ),
          // ),
          children: widget.days
              .map((day) => ListTile(
                    key: Key("${day.index}"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    title: Text(day.name),
                    leading: const Icon(
                      Icons.drag_handle,
                      size: 15,
                      color: Colors.red,
                    ),
                  ))
              .toList(),
          onReorder: (oldIndex, newIndex) {
            print("onReorder: $oldIndex : $newIndex");
            final item = reorderedList.removeAt(oldIndex);

            print("onReorder 1: $reorderedList");
            reorderedList.insert(
                newIndex - (newIndex > oldIndex ? 1 : 0), item);

            print("onReorder 2: $reorderedList");
            setState(() {});
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(locale.cancel),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onReorder(reorderedList);
            Navigator.pop(context, reorderedList);
          },
          child: Text(locale.ok),
        ),
      ],
    );
  }
}
