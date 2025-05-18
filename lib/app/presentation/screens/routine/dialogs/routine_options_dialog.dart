import 'package:flutter/material.dart';
import 'package:uniceps/core/widgets/box_botton.dart';

enum Option {
  edit,
  delete,
}

class RoutineOptionsDialog extends StatelessWidget {
  const RoutineOptionsDialog({super.key, required this.routineName});

  final String routineName;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(Icons.edit, size: 40),
      title: Text(routineName),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BoxBotton(
            onTap: () => Navigator.pop(context, Option.edit),
            width: 75,
            border: Border.all(color: Colors.blueGrey, width: 2.0),
            borderRadius: 10.0,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.text_fields_rounded, color: Colors.blueGrey),
                Text(
                  "Rename",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blueGrey),
                ),
              ],
            ),
          ),
          BoxBotton(
            onTap: () => Navigator.pop(context, Option.delete),
            width: 75,
            border: Border.all(color: Colors.red.shade300, width: 2.0),
            borderRadius: 10.0,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.delete, color: Colors.red),
                Text(
                  "Delete",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
