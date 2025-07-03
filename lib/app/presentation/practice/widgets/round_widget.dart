import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uniceps/core/widgets/box_botton.dart';

class RoundWidget extends StatelessWidget {
  const RoundWidget({
    super.key,
    required this.controller,
    required this.index,
    required this.reps,
    required this.lastWeight,
    required this.onTap,
    this.isDone = false,
  });
  final void Function() onTap;
  final TextEditingController? controller;
  final int index, reps;
  final double? lastWeight;
  final bool isDone;

  final expanded = const <int>[0, 1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${index + 1}",
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
                    "$reps",
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
                  "${lastWeight ?? "---"} Kg",
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
                    controller: controller,
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
          BoxBotton(
            background: isDone ? Colors.green.shade50 : Colors.grey.shade200,
            borderRadius: 500,
            padding: 3.0,
            onTap: onTap,
            child: Text(
              " ${String.fromCharCode(Icons.done.codePoint)} ",
              style: TextStyle(
                fontSize: 14.0,
                color: isDone ? Colors.green : Colors.black54,
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
