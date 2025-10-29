import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_log.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';
import 'package:uniceps/app/presentation/home/blocs/session/session_bloc.dart';
import 'package:uniceps/core/widgets/box_botton.dart';

class RoundWidget extends StatefulWidget {
  const RoundWidget({
    super.key,
    required this.sessionId,
    required this.exId,
    required this.exIndex,
    required this.set,
    this.log,

    // required this.controller,
    // required this.index,
    // required this.reps,
    // required this.lastWeight,
    // required this.onTap,
    // this.isDone = false,
  });
  final int sessionId;
  final int exId;
  final int exIndex;
  final RoutineSet set;
  final TLog? log;

  @override
  State<RoundWidget> createState() => _RoundWidgetState();
}

class _RoundWidgetState extends State<RoundWidget> {
  final weightCtl = TextEditingController();

  // ------------------------
  @override
  Widget build(BuildContext context) {
    final weight = widget.log?.weight ?? widget.set.weight;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${widget.set.index + 1}",
                style: const TextStyle(fontWeight: FontWeight.normal)),
          ),
          Expanded(
            flex: 1,
            child: ColoredBox(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.numbers_rounded,
                    size: 15,
                    color: Colors.grey,
                  ),
                  Text(
                    "${widget.set.reps}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  "${weight ?? "---"} Kg",
                  style: const TextStyle(fontWeight: FontWeight.bold),
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
                    buildCounter: (_,
                            {required currentLength,
                            required isFocused,
                            required maxLength}) =>
                        null,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r"[^0-9^\.]"))
                    ],
                    decoration: InputDecoration(
                      hintText: "0.0",
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 5),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(7)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          BoxButton(
            background: widget.log != null
                ? Colors.green.shade50
                : Colors.grey.shade200,
            borderRadius: 10,
            padding: 3.0,
            onTap: () {
              context.read<SessionBloc>().add(
                    LogSetEvent(
                      log: widget.log?.copywith(
                              weight: double.tryParse(weightCtl.text) ?? 0.0) ??
                          TLog(
                            id: null,
                            sessionId: widget.sessionId,
                            exerciseId: widget.exId,
                            exerciseIndex: widget.exIndex,
                            setIndex: widget.set.index,
                            reps: widget.set.reps,
                            weight: double.tryParse(weightCtl.text) ?? 0.0,
                            completedAt: DateTime.now(),
                            apiId: null,
                          ),
                    ),
                  );
            },
            child: Text(
              " ${String.fromCharCode(Icons.done.codePoint)} ",
              style: TextStyle(
                fontSize: 14.0,
                color: widget.log != null ? Colors.green : Colors.black54,
                fontWeight: FontWeight.bold, // Apply bold styling
                fontFamily: Icons.hourglass_empty_rounded.fontFamily,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
