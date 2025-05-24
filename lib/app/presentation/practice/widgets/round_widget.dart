import 'package:flutter/material.dart';
import 'package:uniceps/core/widgets/box_botton.dart';

class RoundWidget extends StatelessWidget {
  const RoundWidget(
      {super.key,
      required this.controller,
      required this.index,
      required this.lasWeight});
  final TextEditingController? controller;
  final int index;
  final double? lasWeight;

  final expanded = const <int>[0, 1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$index"),
          Text("${lasWeight ?? "--"}"),
          SizedBox(
            width: 40,
            child: TextField(
              controller: controller,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                label: Center(child: Text("00")),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 5),
                border: OutlineInputBorder(),
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
