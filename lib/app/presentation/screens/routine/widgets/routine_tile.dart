import 'package:flutter/material.dart';

class RoutineTile extends StatelessWidget {
  const RoutineTile({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: const Color.fromARGB(255, 227, 237, 241),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15.0),
          onTap: onTap,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                // shared - name
                Row(
                  children: [
                    Icon(Icons.title_rounded, size: 18),
                    SizedBox(width: 8.0),
                    Text(
                      "Routine #1",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(children: [
                  Icon(Icons.history, size: 18),
                  SizedBox(width: 8.0),
                  Text(
                    "2022/01/11",
                    style: TextStyle(),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    "3 Day(s)",
                    style: TextStyle(),
                  ),
                ]),
                SizedBox(height: 8.0),
                Row(children: [
                  Icon(Icons.share_rounded, size: 18),
                  SizedBox(width: 8.0),
                  Text(
                    "3 persons",
                    style: TextStyle(),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    "0 teams",
                    style: TextStyle(),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
