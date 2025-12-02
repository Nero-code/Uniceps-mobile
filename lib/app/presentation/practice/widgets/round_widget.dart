import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_log.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';
import 'package:uniceps/app/presentation/home/blocs/session/session_bloc.dart';
import 'package:uniceps/core/widgets/box_botton.dart';

class RoundWidget extends StatefulWidget {
  const RoundWidget({
    super.key,
    // required this.onLog,
    required this.sessionId,
    required this.exId,
    required this.exIndex,
    required this.set,
    required this.totalProgress,
    this.log,
  });
  final int sessionId;
  final int exId;
  final int exIndex;
  final RoutineSet set;
  final TLog? log;
  final int totalProgress;

  // final VoidCallback onLog;

  @override
  State<RoundWidget> createState() => _RoundWidgetState();
}

class _RoundWidgetState extends State<RoundWidget> {
  final weightCtl = TextEditingController();

  // ------------------------
  @override
  Widget build(BuildContext context) {
    final weight = widget.log?.weight ?? widget.set.weight;
    final isComplete = widget.log != null;
    return Ink(
      color: widget.log != null ? const Color.fromARGB(255, 224, 240, 242) : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text("${widget.set.index + 1}",
            //       style: TextStyle(
            //         fontWeight: FontWeight.normal,
            //         color: isComplete ? Theme.of(context).colorScheme.primary : Colors.black,
            //       )),
            // ),
            Expanded(
              flex: 1,
              child: ColoredBox(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const Icon(
                    //   Icons.numbers_rounded,
                    //   size: 15,
                    //   color: Colors.grey,
                    // ),
                    Text(
                      "${widget.set.reps}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: isComplete ? Theme.of(context).colorScheme.primary : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "${weight != null ? NumberFormat.decimalPattern().format(weight) : "---"} Kg",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isComplete ? Theme.of(context).colorScheme.primary : Colors.grey.shade700),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ColoredBox(
                color: Colors.transparent,
                child: Center(
                  child: SizedBox(
                    width: 60,
                    child: TextField(
                      controller: weightCtl,
                      textAlign: TextAlign.center,
                      maxLength: 5,
                      buildCounter: (_, {required currentLength, required isFocused, required maxLength}) => null,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        // FilteringTextInputFormatter.deny(RegExp(r"[^0-9^\.]")),
                        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                      ],
                      style: TextStyle(color: Theme.of(context).colorScheme.primary),
                      decoration: InputDecoration(
                        hintText: "0.0",
                        hintStyle: TextStyle(color: Colors.grey.shade300),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 5),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: isComplete ? Colors.white : Colors.grey),
                            borderRadius: BorderRadius.circular(7)),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            BoxButton(
              background: widget.log != null ? const Color.fromARGB(255, 224, 240, 242) : Colors.grey.shade200,
              borderRadius: 10,
              padding: const EdgeInsets.all(3.0),
              onTap: () {
                final log = widget.log?.copywith(weight: double.tryParse(weightCtl.text) ?? 0.0) ??
                    TLog(
                      id: null,
                      completedAt: DateTime.now(),
                      apiId: null,
                      sessionId: widget.sessionId,
                      exerciseId: widget.exId,
                      exerciseIndex: widget.exIndex,
                      setIndex: widget.set.index,
                      reps: widget.set.reps,
                      weight: double.tryParse(weightCtl.text) ?? 0.0,
                    );

                context
                    .read<SessionBloc>()
                    .add(SessionEvent.logSet(log, widget.totalProgress != 0 ? 1 / widget.totalProgress : 0));
              },
              child: Text(
                " ${String.fromCharCode(Icons.done.codePoint)} ",
                style: TextStyle(
                  fontSize: 14,
                  color: widget.log != null ? Theme.of(context).colorScheme.primary : Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontFamily: Icons.hourglass_empty_rounded.fontFamily,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
