import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uniceps/core/widgets/box_botton.dart';

class RoundWidget extends StatelessWidget {
  const RoundWidget(
      {super.key,
      required this.controller,
      required this.index,
      required this.lastWeight});
  final TextEditingController? controller;
  final int index;
  final double? lastWeight;

  final expanded = const <int>[0, 1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("$index",
                style: const TextStyle(fontWeight: FontWeight.normal)),
          ),
          Expanded(
            child: Center(
              child: Text(
                "${lastWeight ?? "---"} Kg",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
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
                    hintText: "00",
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),
          ),
          BoxBotton(
            background: Colors.green.shade50,
            borderRadius: 500,
            padding: 3.0,
            onTap: () {},
            child: Text(
              " ${String.fromCharCode(Icons.done.codePoint)} ",
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.green,
                fontWeight: FontWeight.bold, // Apply bold styling
                fontFamily: Icons.done.fontFamily,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
