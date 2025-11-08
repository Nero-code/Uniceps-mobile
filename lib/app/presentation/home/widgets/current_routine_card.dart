import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';

class CurrentRoutineCard extends StatelessWidget {
  const CurrentRoutineCard({super.key, this.onPressed, required this.routine});

  final btnBackgroundColor = const Color.fromARGB(29, 96, 125, 139);
  final VoidCallback? onPressed;
  final Routine routine;

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
              // onPressed: () async{
              //   Navigator.pushNamed(context, AppRoutes.routineManager);
              //   setstat
              // },
              onPressed: onPressed,
              child: const Icon(Icons.edit),
            ),
          ),
        ],
      ),
    );
  }
}
