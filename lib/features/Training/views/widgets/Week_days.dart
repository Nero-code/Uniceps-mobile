import 'package:flutter/material.dart';

const weekDaysList = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

class WeekDaysBanner extends StatelessWidget {
  WeekDaysBanner({super.key});

  final today = DateTime.now();
  final List<int> datesOfWeek = [];

  void calcWeekDays() {
    final firstDayOfWeek = DateTime.now().add(Duration(days: -today.weekday));
    for (int i = 0; i < 7; i++) {
      datesOfWeek.add(firstDayOfWeek.add(Duration(days: i)).day);
    }
  }

  @override
  Widget build(BuildContext context) {
    calcWeekDays();
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        textDirection: TextDirection.ltr,
        children: [
          for (int i = 0; i < 7; i++)
            Container(
              width: MediaQuery.of(context).size.width * 0.1,
              // padding: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: (today.weekday % 7) == i
                      ? Theme.of(context).colorScheme.primary
                      : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset.zero,
                      color: (today.weekday % 7) == i
                          ? Theme.of(context).colorScheme.primary
                          : Colors.white,
                      blurRadius: 2,
                    ),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Text(weekDaysList[i],
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    alignment: Alignment.center,
                    decoration: i == (today.weekday % 7)
                        ? const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white)
                        : null,
                    child: Text(
                      "${datesOfWeek[i]}",
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
