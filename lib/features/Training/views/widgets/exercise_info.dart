import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Training/services/entities/exercise.dart';

class ExerciseInfoDialog extends StatelessWidget {
  const ExerciseInfoDialog(
      {super.key, required this.weightCtl, required this.e});

  final TextEditingController weightCtl;
  final Exercise e;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(e.name),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
                aspectRatio: 16 / 9,
                child: CachedNetworkImage(
                    imageUrl: imgUrlParser(e.muscleGroup, e.imageUrl))),
            const SizedBox(height: 10),
            Text(e.notes),
            const Divider(),
            const SizedBox(height: 10),
            Text("Last Weight: ${e.lastWaight} Kg"),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 70,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: weightCtl,
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.all(5),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade700,
                          ),
                        ),
                        border: OutlineInputBorder()),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Add Weight to database...
                  },
                  child: Text("Update"),
                ),
              ],
            ),
          ],
        ),
      ),
    ).build(context);
  }
}
