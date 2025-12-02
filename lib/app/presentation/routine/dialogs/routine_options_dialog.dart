import 'package:flutter/material.dart';
import 'package:uniceps/core/widgets/box_botton.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum Option {
  edit,
  delete,
  export,
  setCurrent,
}

class RoutineOptionsDialog extends StatelessWidget {
  const RoutineOptionsDialog({super.key, required this.routineName});

  final String routineName;
  final double fontSize = 14;
  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.sizeOf(context);
    final locale = AppLocalizations.of(context)!;

    return AlertDialog(
      icon: const Icon(Icons.edit, size: 40),
      title: Text(routineName),
      content: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          BoxButton(
            onTap: () => Navigator.pop(context, Option.edit),
            // width: screenSize.width * 0.5,
            border: Border.all(color: Colors.blueGrey, width: 2.0),
            borderRadius: 10.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.text_fields_rounded, color: Colors.blueGrey),
                const SizedBox(width: 5.0),
                Text(
                  locale.rename,
                  style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          BoxButton(
            onTap: () => Navigator.pop(context, Option.setCurrent),
            // width: 75,
            border: Border.all(color: Colors.green.shade300, width: 2.0),
            borderRadius: 10.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.flag, color: Colors.green),
                const SizedBox(width: 5.0),
                Text(
                  locale.setCurrent,
                  style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          BoxButton(
            onTap: () => Navigator.pop(context, Option.delete),
            // width: 75,
            border: Border.all(color: Colors.red.shade300, width: 2.0),
            borderRadius: 10.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.delete, color: Colors.red),
                const SizedBox(width: 5.0),
                Text(
                  locale.delete,
                  style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
