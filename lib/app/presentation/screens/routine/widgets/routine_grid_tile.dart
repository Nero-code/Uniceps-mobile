import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RoutineGridTile extends StatelessWidget {
  const RoutineGridTile({
    super.key,
    required this.routine,
    required this.onTap,
  });

  final Routine routine;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.onPrimary,
          color: const Color.fromARGB(255, 227, 235, 240),
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(0.0, 3.0),
              spreadRadius: 1.0,
              blurRadius: 3.0,
            ),
          ]),
      child: Column(
        children: [
          Center(
            child: Text(
              routine.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.blueGrey.shade700),
            ),
          ),

          Divider(
            color: Colors.grey.shade200,
            thickness: 0.5,
          ),
          Row(
            children: [
              const Expanded(
                child: Icon(Icons.history, size: 15),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  DateFormat.yMd().format(routine.createdAt),
                  style: const TextStyle(fontSize: 11),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  "${routine.trainingDays.length} ${local.days}",
                  style: const TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Expanded(
                child: Icon(Icons.fitness_center_rounded, size: 15),
              ),
              const Expanded(
                flex: 3,
                child: Text(
                  "Exercises",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  "${routine.trainingDays.length}",
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
          // const SizedBox(height: 8.0),
          const Row(
            children: [
              Expanded(
                child: Icon(Icons.person, size: 15),
              ),
              Expanded(
                flex: 3,
                child: Text("3", style: TextStyle(fontSize: 10)),
              ),
              Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Icon(Icons.groups, size: 15),
                      SizedBox(width: 5),
                      Text("0", style: TextStyle(fontSize: 10)),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
