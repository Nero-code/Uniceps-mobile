import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart' as intl;
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/widgets/reload_widget.dart';
import 'package:uniceps/features/Profile/domain/entities/attendence.dart';
import 'package:uniceps/features/Profile/domain/entities/gym.dart';
import 'package:uniceps/features/Profile/presentation/bloc/attendence_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/player_gym_bloc.dart';
import 'package:uniceps/features/Profile/presentation/bloc/subs_bloc.dart';
import 'package:uniceps/features/Profile/presentation/widgets/Subscription_widget_2.dart';
import 'package:uniceps/main_cubit/locale_cubit.dart';

class GymProfileScreen2 extends StatefulWidget {
  const GymProfileScreen2({super.key, required this.gym});

  final Gym? gym;

  @override
  State<GymProfileScreen2> createState() => _GymProfileScreen2State();
}

class _GymProfileScreen2State extends State<GymProfileScreen2> {
  DateTime cDay = DateTime.now(), // Current
      fDay = DateTime.now(), // focused
      sDay = DateTime.now(), // selected
      lDay = DateTime.now(); // last

  List<Attendence> a = [];

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final local = AppLocalizations.of(context)!;
    return Scaffold(
      body: SlidingUpPanel(
        backdropEnabled: false,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        collapsed: Container(
          width: screen.width,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 85, 151, 177),
            // gradient: LinearGradient(
            //   colors: [
            //     Colors.white,
            //     Color.fromARGB(255, 85, 151, 177),
            //   ],
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            // ),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
            boxShadow: [],
          ),
          child: Column(
            children: [
              const Icon(
                Icons.remove_rounded,
                color: Colors.white,
                size: 30,
              ),
              // Text(
              //   local.attendenceLog,
              //   style: TextStyle(
              //     fontSize: 12,
              //     color: Colors.white,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ],
          ),
        ),
        minHeight: 30,
        maxHeight: screen.height * 0.7,
        // color: Color.fromARGB(255, 85, 151, 177),
        panel: BlocBuilder<AttendenceBloc, AttendenceState>(
          builder: (context, state) {
            print("presence screen bloc type: ${state.runtimeType}");
            if (state is AttendenceInitial) {
              BlocProvider.of<AttendenceBloc>(context).add(
                GetAttendenceEvent(widget.gym!.id, widget.gym!.pid),
              );
            }

            if (state is AttenedenceLoadedState) {
              print("Debug: ${state.list.first.date}");
              print("Debug: ${state.list.first.loginTime}");
              print("Debug: ${state.list.first.logoutTime}");

              return Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      mainBlueLight,
                      mainBlueLight,
                      background,
                    ],
                    stops: [
                      0.0,
                      0.2,
                      0.2,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const PageScrollPhysics(),
                  children: [
                    //
                    //  A T T E N D E N C E   V I E W   T Y P E   [CALENDER]
                    //
                    SizedBox(
                      width: screen.width - 25,
                      height: screen.height * 0.7,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              local.calender,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          SizedBox(
                            width: screen.width,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Column(
                                children: [
                                  Center(
                                    child: Material(
                                      elevation: 2,
                                      borderRadius: BorderRadius.circular(15),
                                      // decoration: BoxDecoration(
                                      //     // color: secondaryLight,
                                      //     color: Color(0xFFEEEEEE),
                                      //     borderRadius:
                                      //         BorderRadius.circular(15),
                                      //     boxShadow: [
                                      //       BoxShadow(
                                      //         offset: Offset(0.0, 0.0),
                                      //         color: Colors.grey,
                                      //         blurRadius: 500.0,
                                      //         spreadRadius: 25.0,
                                      //       ).scale(0.1),
                                      //     ]),
                                      child: TableCalendar(
                                        daysOfWeekHeight: 20.0,
                                        calendarFormat: CalendarFormat.week,
                                        locale: LocaleCubit()
                                            .state
                                            .locale
                                            .languageCode,
                                        focusedDay: fDay,
                                        firstDay: state.list.first.date,
                                        lastDay: lDay,
                                        currentDay: cDay,
                                        startingDayOfWeek:
                                            StartingDayOfWeek.sunday,
                                        availableGestures:
                                            AvailableGestures.none,
                                        calendarStyle: CalendarStyle(
                                            selectedDecoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onBackground,
                                                shape: BoxShape.circle),
                                            todayDecoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                                shape: BoxShape.circle)),
                                        onHeaderTapped: null,
                                        onFormatChanged: (format) {
                                          print("Format Tapped: $format");
                                        },
                                        onPageChanged: (focusedDay) {
                                          print("OnPageChanged! $focusedDay");

                                          fDay = focusedDay;
                                        },
                                        enabledDayPredicate: (day) {
                                          for (var i in state.list) {
                                            if (i.date.compareTo(day.copyWith(
                                                    isUtc: false)) ==
                                                0) {
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
                                        onDaySelected:
                                            (selectedDay, focusedDay) {
                                          print(
                                              "selectedDay: $selectedDay \nfocusedDay:  $focusedDay");
                                          sDay = selectedDay;
                                          setState(() {
                                            a.clear();
                                            state.list.forEach(
                                              (element) {
                                                if (element.date.day ==
                                                    selectedDay.day) {
                                                  a.add(element);
                                                }
                                              },
                                            );
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    // height: screen.height * 0.25,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        textDirection: TextDirection.rtl,
                                        children: [
                                          const SizedBox(height: 5.0),
                                          for (var i in a)
                                            Container(
                                              margin:
                                                  const EdgeInsets.all(10.0),
                                              width: screen.width,
                                              alignment: Alignment.center,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              local.enteredAt,
                                                              style: TextStyle(
                                                                color: const Color
                                                                    .fromARGB(
                                                                    181,
                                                                    0,
                                                                    0,
                                                                    0),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              // "${i.loginTime.toLocal().hour}:${i.loginTime.toLocal().minute}",
                                                              intl.DateFormat(
                                                                      "h:mm a")
                                                                  .format(i
                                                                      .loginTime),
                                                              textDirection:
                                                                  TextDirection
                                                                      .ltr,
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black54,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              local.exitedAt,
                                                              style: TextStyle(
                                                                color: const Color
                                                                    .fromARGB(
                                                                    181,
                                                                    0,
                                                                    0,
                                                                    0),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              intl.DateFormat(
                                                                      "h:mm a")
                                                                  .format(i
                                                                      .loginTime),
                                                              textDirection:
                                                                  TextDirection
                                                                      .ltr,
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black54,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(
                                                    color: Colors.grey.shade300,
                                                    endIndent: 20,
                                                    indent: 20,
                                                  ),
                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //
                    //  A T T E N D E N C E   V I E W   T Y P E   [LIST]
                    //
                    SizedBox(
                      width: screen.width - 25,
                      height: screen.height * 0.7,
                      child: Column(
                        children: [
                          Text(
                            local.list,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SingleChildScrollView(
                              child: Column(
                            children: [
                              for (var i in state.list)
                                Material(
                                  elevation: 3,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            local.date,
                                            style: const TextStyle(
                                              color:
                                                  Color.fromARGB(181, 0, 0, 0),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "${i.date.year}/${i.date.month}/${i.date.day}",
                                            textDirection: TextDirection.ltr,
                                            style: const TextStyle(
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            local.enteredAt,
                                            textDirection: TextDirection.ltr,
                                            style: const TextStyle(
                                              color: Colors.black54,
                                            ),
                                          ),
                                          Text(
                                            intl.DateFormat("h:mm a")
                                                .format(i.loginTime),
                                            textDirection: TextDirection.ltr,
                                            style: const TextStyle(
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            local.exitedAt,
                                            textDirection: TextDirection.ltr,
                                            style: const TextStyle(
                                              color: Colors.black54,
                                            ),
                                          ),
                                          Text(
                                            intl.DateFormat("h:mm a")
                                                .format(i.loginTime),
                                            textDirection: TextDirection.ltr,
                                            style: const TextStyle(
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is AttenedenceErrorState) {
              print(state.f.runtimeType);
              print(state.f.getErrorMessage());

              return ReloadScreenWidget(
                f: state.f,
                callBack: () {
                  BlocProvider.of<AttendenceBloc>(context)
                      .add(GetAttendenceEvent(widget.gym!.id, widget.gym!.pid));
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
        body: Stack(
          children: [
            Container(
              width: screen.width,
              height: screen.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary,
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      width: screen.width,
                      height: screen.height * 0.1,
                      child: Row(
                        children: [
                          const SizedBox(width: 15),
                          Center(
                            child: CachedNetworkImage(
                              imageUrl: "$API"
                                  "$HTTP_GYMS"
                                  "$HTTP_GYM_LOGO"
                                  "/${widget.gym?.id}",
                              imageBuilder: (context, imageprovider) =>
                                  ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image(image: imageprovider),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Image(image: AssetImage(APP_LOGO_DARK)),
                            ),
                          ),
                          const SizedBox(width: 25),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${widget.gym?.name}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${local.owner} : ${widget.gym?.ownerName}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: screen.width - 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${local.address} : ${widget.gym?.address}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "${local.telephone} : ",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              " ${widget.gym?.telephone} ",
                              textDirection: TextDirection.ltr,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              " - ",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              " ${widget.gym?.telephone} ",
                              textDirection: TextDirection.ltr,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        BlocBuilder<PlayerGymBloc, PlayerGymState>(
                          builder: (context, state) {
                            return Text(
                              "${local.balance} : ${state is PlayerInGymLoadedState ? state.data.balance.toInt() : "0"}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  // const Divider(),
                ],
              ),
            ),
            Positioned(
              top: screen.height * 0.3,
              width: screen.width,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      // CustomPaint(
                      //   size: Size(screen.width, screen.height * 0.1),
                      //   painter: PanaleCirclePainter(),
                      // ),
                      Container(
                        height: screen.height * 0.7,
                        width: screen.width,
                        padding: const EdgeInsets.only(
                          // top: 15.0,
                          // left: 15.0,
                          // right: 15.0,
                          bottom: 0.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(25),
                          ),
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.white70,
                              offset: Offset(0.0, 2.0),
                              spreadRadius: 25.0,
                              blurRadius: 500.0,
                            ).scale(0.1),
                          ],
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(0.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white70,
                              width: 5.0,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: BlocBuilder<SubsBloc, SubsState>(
                            builder: (context, state) {
                              if (state is SubsInitial) {
                                BlocProvider.of<SubsBloc>(context).add(
                                  GetSubsEvent(
                                      gymId: widget.gym!.id,
                                      pid: widget.gym!.pid),
                                );
                              }
                              return Column(
                                children: [
                                  Text(
                                    "${local.subscriptions} (${(state is SubsLoadedState) ? state.list.length : "0"})",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(192, 0, 0, 0),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    height: screen.height * 0.6,
                                    child:
                                        //  if
                                        state is SubsLoadedState
                                            ? SingleChildScrollView(
                                                padding: EdgeInsets.only(
                                                    bottom:
                                                        screen.height * 0.05),
                                                child: Column(
                                                  children: [
                                                    for (var i in state.list)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: SizedBox(
                                                          width: screen.width *
                                                              0.9,
                                                          height: screen.width *
                                                              0.5,
                                                          child:
                                                              SubsrciptionWidget2(
                                                            sub: i,
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              )
                                            // else if
                                            : state is SubsErrorState
                                                ? Center(
                                                    child: ReloadScreenWidget(
                                                      f: state.f,
                                                      callBack: () =>
                                                          BlocProvider.of<
                                                                      SubsBloc>(
                                                                  context)
                                                              .add(
                                                        GetSubsEvent(
                                                            gymId:
                                                                widget.gym!.id,
                                                            pid: widget
                                                                .gym!.pid),
                                                      ),
                                                    ),
                                                  )
                                                :
                                                //else
                                                const Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                            strokeWidth: 2.0),
                                                  ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
