import 'package:flutter/material.dart';

class DayEditFlaotingMenu extends StatelessWidget {
  const DayEditFlaotingMenu(
      {super.key,
      required this.onEdit,
      required this.onReorder,
      required this.onRemove});

  final void Function() onEdit, onReorder, onRemove;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: SizedBox(
        width: screenSize.width * .4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text("Edit"),
              leading: const Icon(Icons.edit),
              onTap: onEdit,
            ),
            ListTile(
              title: const Text("Reorder"),
              leading: const Icon(Icons.swap_vert_rounded),
              onTap: onReorder,
            ),
            ListTile(
              title: const Text("Remove"),
              leading: const Icon(Icons.delete),
              onTap: onRemove,
            ),
          ],
        ),
      ),
    );
  }
}
