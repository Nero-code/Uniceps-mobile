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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: screenSize.width * .45,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0.0, 2.0),
                  color: Colors.grey.shade300,
                  blurRadius: 4,
                  spreadRadius: 1,
                )
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text("Edit"), // TODO: Translate
                leading: const Icon(Icons.edit),
                onTap: onEdit,
              ),
              ListTile(
                title: const Text("Reorder"), // TODO: Translate
                leading: const Icon(Icons.swap_vert_rounded),
                onTap: onReorder,
              ),
              ListTile(
                title: const Text("Remove"), // TODO: Translate
                leading: const Icon(Icons.delete),
                onTap: onRemove,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
