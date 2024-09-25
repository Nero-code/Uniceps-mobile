import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/widgets/reload_wiget.dart';
import 'package:uniceps/features/Profile/domain/entities/attendence.dart';
import 'package:uniceps/features/Profile/presentation/bloc/attendence_bloc.dart';

class PresenceScreen extends StatefulWidget {
  const PresenceScreen({
    super.key,
    required this.gymId,
  });

  final String gymId;
  @override
  State<PresenceScreen> createState() => _PresenceScreenState();
}

class _PresenceScreenState extends State<PresenceScreen> {
  DateTime cDay = DateTime.now(), // Current
      fDay = DateTime.now(), // focused
      sDay = DateTime.now(), // selected
      lDay = DateTime.now(); // last

  Attendence? a;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Uniceps"),
      ),
      body: BlocBuilder<AttendenceBloc, AttendenceState>(
        builder: (context, state) {
          print("presence screen bloc type: ${state.runtimeType}");

          if (state is AttenedenceLoadedState) {
            state.list.forEach((element) {
              print(element.toJson());
            });
            print("length: ${state.list.length}");
            return SingleChildScrollView(
              child: Column(
                children: [
                  TableCalendar(
                    // locale: 'ar',
                    focusedDay: fDay,
                    firstDay: state.list.first.date,
                    lastDay: lDay,
                    currentDay: cDay,
                    startingDayOfWeek: StartingDayOfWeek.sunday,
                    availableGestures: AvailableGestures.horizontalSwipe,
                    calendarStyle: CalendarStyle(
                        selectedDecoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onBackground,
                            shape: BoxShape.circle),
                        todayDecoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            shape: BoxShape.circle)),

                    onHeaderTapped: (focusedDay) {
                      print("Header tapped: $focusedDay");
                    },
                    onFormatChanged: (format) {
                      print("Format Tapped: $format");
                    },
                    onPageChanged: (focusedDay) {
                      print("OnPageChanged! $focusedDay");

                      fDay = focusedDay;
                    },
                    enabledDayPredicate: (day) {
                      for (var i in state.list) {
                        print("i: ${i.date}");
                        print("day: $day");
                        print(
                            "compare: ${i.date.compareTo(day.copyWith(isUtc: false))}");
                        if (i.date.compareTo(day.copyWith(isUtc: false)) == 0) {
                          return true;
                        }
                      }
                      return false;
                    },
                    selectedDayPredicate: (day) {
                      if (day.compareTo(cDay) == 0 ||
                          day.compareTo(sDay) == 0) {
                        return true;
                      }

                      return false;
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      print(
                          "selectedDay: $selectedDay \nfocusedDay:  $focusedDay");
                      sDay = selectedDay;
                      setState(() {
                        state.list.forEach((element) {
                          if (element.date.day == selectedDay.day) {
                            a = element;
                          }
                        });
                      });
                    },
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      textDirection: TextDirection.rtl,
                      children: a != null
                          ? [
                              Text('Entered At: \n${a!.loginTime}'),
                              Text('Exited At: \n${a!.logoutTime}'),
                            ]
                          : [],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is AttenedenceErrorState) {
            print(state.f.runtimeType);
            print(state.f.getErrorMessage());
            switch (state.f.runtimeType) {
              case NoAttendenceFoundFailure:
                return ReloadScreenWiget(
                  image: const Icon(Icons.highlight_off_rounded),
                  message: Text(state.f.getErrorMessage()),
                  callBack: const SizedBox(),
                );
              case EmptyCacheFailure:
                return ReloadScreenWiget(
                  image: const Icon(Icons.error),
                  message: Text(state.f.getErrorMessage()),
                  callBack: IconButton(
                    onPressed: () {
                      BlocProvider.of<AttendenceBloc>(context)
                          .add(GetAttendenceEvent(widget.gymId));
                    },
                    icon: const Icon(Icons.refresh),
                  ),
                );
              case ServerFailure:
                return ReloadScreenWiget(
                  image: const Icon(Icons.dangerous),
                  message: Text(state.f.getErrorMessage()),
                  callBack: IconButton(
                    onPressed: () {
                      BlocProvider.of<AttendenceBloc>(context)
                          .add(GetAttendenceEvent(widget.gymId));
                    },
                    icon: const Icon(Icons.refresh),
                  ),
                );
              default:
                return ReloadScreenWiget(
                  image: const Icon(Icons.dangerous),
                  message: Text(state.f.getErrorMessage()),
                  callBack: IconButton(
                    onPressed: () {
                      BlocProvider.of<AttendenceBloc>(context)
                          .add(GetAttendenceEvent(widget.gymId));
                    },
                    icon: const Icon(Icons.refresh),
                  ),
                );
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
