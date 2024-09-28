import 'package:flutter/material.dart';
import 'package:uniceps/features/Training/services/entities/exercise.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExerciseInfoDialog extends StatelessWidget {
  const ExerciseInfoDialog({
    super.key,
    required this.weightCtl,
    required this.e,
    required this.onPressed,
  });

  final TextEditingController weightCtl;
  final void Function(double) onPressed;
  final Exercise e;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(e.name),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.memory(e.imageBitMap!),
            ),
            const SizedBox(height: 10),
            Text(e.notes),
            const Divider(),
            const SizedBox(height: 10),
            Text("${local!.lastWeight}: ${e.lastWaight} Kg"),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    if (weightCtl.text.isEmpty) return;
                    print(double.parse(weightCtl.text));
                    onPressed(double.parse(weightCtl.text));
                    weightCtl.clear();
                    Navigator.pop(context);
                  },
                  child: Text(local.update),
                ),
                SizedBox(
                  width: 70,
                  child: TextField(
                    maxLength: 10,
                    textAlign: TextAlign.center,
                    controller: weightCtl,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      counter: SizedBox(),
                      isDense: true,
                      contentPadding: EdgeInsets.all(5),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      if (value.contains(RegExp(r"[^0-9^\.]"))) {
                        weightCtl.text = weightCtl.value.text
                            .substring(0, weightCtl.value.text.length - 1);
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ).build(context);
  }
}
