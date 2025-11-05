import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/app_routes.dart';

class CurrentRoutineCard extends StatelessWidget {
  const CurrentRoutineCard({super.key});

  final btnBackgroundColor = const Color.fromARGB(29, 96, 125, 139);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: btnBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("الروتين الحالي"),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("عدد التمارين:"),
              Text("2"),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("عدد الجلسات التمرينية:"),
              Text("2"),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("تاريخ الصنع:"),
              Text("18/8/2020"),
            ],
          ),
          SizedBox(
            // width: screenSize.width,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.routineManager);
              },
              child: const Icon(Icons.edit),
            ),
          ),
        ],
      ),
    );
  }
}
