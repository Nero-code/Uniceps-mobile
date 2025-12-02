import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RoutineListTile extends StatelessWidget {
  const RoutineListTile({super.key, required this.routine, required this.onTap, required this.onLongPress});

  final Routine routine;
  final void Function() onTap, onLongPress;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        // color: const Color.fromARGB(255, 227, 237, 241),
        border: Border.all(),
        color: Colors.white54,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15.0),
          onTap: onTap,
          onLongPress: onLongPress,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // shared - name
                    Row(
                      children: [
                        // const Icon(Icons.title_rounded, size: 18),
                        // const SizedBox(width: 8.0),
                        Text(
                          routine.name,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        const Icon(Icons.history, size: 18),
                        const SizedBox(width: 8.0),
                        Text(
                          DateFormat.yMd().format(routine.createdAt),
                          style: const TextStyle(),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8.0),
                    Row(
                      children: [
                        const Icon(Icons.check_circle),
                        Text(
                          "${DateTime.now().difference(routine.createdAt).inDays}"
                          " "
                          "${local.day}",
                          style: const TextStyle(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    // Row(children: [
                    //   const Icon(Icons.share_rounded, size: 18),
                    //   const SizedBox(width: 8.0),
                    //   Text(
                    //     "3 ${local.about}",
                    //     style: const TextStyle(),
                    //   ),
                    //   const SizedBox(width: 8.0),
                    //   const Text(
                    //     "0 teams",
                    //     style: TextStyle(),
                    //   ),
                    // ]),
                  ],
                ),
                if (routine.isCurrent)
                  const Center(
                    child: Text(
                      '30',
                      style: TextStyle(fontSize: 30),
                      // color: Colors.blueGrey.shade300,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
