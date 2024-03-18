import 'package:flutter/material.dart';

class TrainingGroup extends StatelessWidget {
  const TrainingGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(50),
        ),
        color: const Color.fromARGB(255, 230, 230, 230),
      ),
      margin: EdgeInsets.only(right: 15),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "1",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Container(
            width: 2,
            height: double.infinity,
            color: Colors.pink,
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Training Group Name",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("Number of Excersises: 3"),
              ],
            ),
          ),
          Container(
            width: 45,
            height: 45,
            margin: EdgeInsets.only(right: 7),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
