import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class PresenceScreen extends StatefulWidget {
  const PresenceScreen({super.key});

  @override
  State<PresenceScreen> createState() => _PresenceScreenState();
}

class _PresenceScreenState extends State<PresenceScreen> {
  DateTime cDay = DateTime.now(), // Current
      fDay = DateTime.now(), // focused
      sDay = DateTime.now(), // selected
      lDay = DateTime.now(); // last

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Uniceps"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              // locale: 'ar',
              focusedDay: fDay,
              firstDay: DateTime(2024),
              lastDay: lDay,
              currentDay: cDay,
              startingDayOfWeek: StartingDayOfWeek.sunday,
              availableGestures: AvailableGestures.horizontalSwipe,
              calendarStyle: CalendarStyle(),
              onHeaderTapped: (focusedDay) {
                print("Header tapped: $focusedDay");
              },
              onFormatChanged: (format) {
                print("Format Tapped: $format");
              },
              onPageChanged: (focusedDay) {
                print("OnPageChanged! $focusedDay");
              },
              enabledDayPredicate: (day) {
                return day.weekday % 2 == 0;
              },
              selectedDayPredicate: (day) {
                if (day.compareTo(cDay) == 0 || day.compareTo(sDay) == 0)
                  return true;

                return false;
              },
              onDaySelected: (selectedDay, focusedDay) {
                print("selectedDay: $selectedDay \nfocusedDay:  $focusedDay");
                setState(() {
                  sDay = focusedDay;
                });
              },
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                textDirection: TextDirection.ltr,
                children: [
                  Text('Entered At: \n${sDay.day}'),
                  Text('Exited At: \n${sDay.day}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
