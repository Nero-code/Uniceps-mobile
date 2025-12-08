import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_heat.dart';
import 'package:uniceps/app/presentation/home/widgets/water_gauge.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class RoutineWithHeat extends StatelessWidget {
  const RoutineWithHeat({
    super.key,
    required this.routine,
    required this.heat,
    required this.onTap,
    this.onMenu,
    this.onLongPress,
  });

  final Routine routine;
  final RoutineHeat heat;
  final void Function() onTap;
  final void Function()? onMenu;
  final void Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: Material(
        color: Colors.white,
        shape: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Colors.grey, width: 0.5),
        ),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          onTap: onTap,
          onLongPress: onLongPress,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox.square(
                  dimension: 30,
                  child: onMenu != null
                      ? IconButton(
                          style: IconButton.styleFrom(padding: const EdgeInsets.all(3.0), iconSize: 20),
                          onPressed: onMenu,
                          icon: const Icon(Icons.more_vert_rounded, size: 20),
                        )
                      : null,
                ),
                const SizedBox(width: 5.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // shared - name
                      Text(
                        routine.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.calendar_view_day_rounded, size: 18, color: Colors.blue),
                              const SizedBox(width: 5.0),
                              Text("${heat.days}", style: const TextStyle()),
                            ],
                          ),
                          const SizedBox(width: 8.0),
                          Row(children: [
                            const Icon(Icons.fitness_center, size: 18, color: Colors.red),
                            const SizedBox(width: 5.0),
                            Text("${heat.exercises}", style: const TextStyle()),
                          ]),
                          const SizedBox(width: 8.0),
                          Row(
                            children: [
                              const Icon(Icons.sports, size: 18, color: Colors.orange),
                              const SizedBox(width: 5.0),
                              Text("${heat.sets}", style: const TextStyle()),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                        children: [
                          const Icon(Icons.calendar_month, size: 18),
                          const SizedBox(width: 8.0),
                          Text(
                            DateFormat('d/M/y').format(routine.createdAt),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 8.0),
                          if (routine.isCurrent)
                            Ink(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                locale.active,
                                style: const TextStyle(color: Colors.green, fontSize: 11, fontWeight: FontWeight.bold),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    WaveBottleGauge(
                      value: heat.value.clamp(0, 1),
                      size: 50,
                      width: 1,
                      fillColor: Colors.blue.withOpacity(0.75),
                      borderColor: Colors.grey.shade300,
                      backgroundColor: Colors.grey.shade100,
                    ),
                    Text(
                      '${heat.sessionCount}',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
