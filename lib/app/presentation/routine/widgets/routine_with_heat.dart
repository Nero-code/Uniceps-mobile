import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_heat.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RoutineWithHeat extends StatelessWidget {
  const RoutineWithHeat({
    super.key,
    required this.routine,
    required this.heat,
    required this.onTap,
    this.onMenu,
  });

  final Routine routine;
  final RoutineHeat heat;
  final void Function() onTap;
  final void Function()? onMenu;

  @override
  Widget build(BuildContext context) {
    // final local = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: Material(
        // borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        shape: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(color: Colors.grey, width: 0.5),
        ),
        // elevation: 1,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          onTap: onTap,
          // onLongPress: onLongPress,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox.square(
                  dimension: 30,
                  child: onMenu != null
                      ? IconButton(
                          style: IconButton.styleFrom(padding: EdgeInsets.all(3.0), iconSize: 20),
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
                              Text(
                                "${heat.days}",
                                style: const TextStyle(),
                              ),
                            ],
                          ),
                          const SizedBox(width: 8.0),
                          Row(children: [
                            const Icon(Icons.fitness_center, size: 18, color: Colors.red),
                            const SizedBox(width: 5.0),
                            Text(
                              "${heat.exercises}",
                              style: const TextStyle(),
                            ),
                          ]),
                          const SizedBox(width: 8.0),
                          Row(
                            children: [
                              const Icon(Icons.sports, size: 18, color: Colors.orange),
                              const SizedBox(width: 5.0),
                              Text(
                                "${heat.sets}",
                                style: const TextStyle(),
                              ),
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
                            DateFormat.yMd().format(routine.createdAt),
                            style: const TextStyle(),
                          ),
                          const SizedBox(width: 8.0),
                          if (routine.isCurrent)
                            const Icon(
                              Icons.flag,
                              color: Colors.pink,
                              size: 20,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox.square(
                  dimension: 70,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox.square(
                          dimension: 50,
                          child:
                              // Icon(
                              //   Icons.local_fire_department,
                              //   size: 50,
                              //   color: Colors.teal,
                              // ),
                              CircularProgressIndicator(
                            value: heat.sessionCount / 30,
                            strokeWidth: 5,
                            strokeCap: StrokeCap.round,
                            color: Colors.green,
                            backgroundColor: Color.fromARGB(57, 158, 158, 158),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "${heat.sessionCount}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
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
