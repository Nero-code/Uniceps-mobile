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
import 'package:uniceps/features/Profile/presentation/widgets/subscription_widget_2.dart';
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
      lDay = DateTime.now(), // last
      day1 = DateTime(2000);

  List<Attendence> a = [];

  final controller = PanelController();

  // final i = Attendence(
  //     date: DateTime.now(),
  //     loginTime: DateTime.now(),
  //     logoutTime: DateTime.now(),
  //     gymId: "gymId",
  //     pid: "pid",
  //     sid: "sid");

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final local = AppLocalizations.of(context)!;
    final isRtl = context.read<LocaleCubit>().state.isRtl();
    return Scaffold(
      body: SlidingUpPanel(
        controller: controller,
        backdropEnabled: false,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        collapsed: Material(
          // width: screen.width,
          color: const Color.fromARGB(255, 85, 151, 177),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(25),
          ),
          child: InkWell(
            onTap: () => controller.animatePanelToPosition(1,
                duration: Durations.extralong1, curve: Curves.easeOutExpo),
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(25),
            ),
            child: const Icon(
              Icons.remove_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        minHeight: 30,
        maxHeight: screen.height * 0.7,
        onPanelClosed: () => setState(() {}),
        // color: Color.fromARGB(255, 85, 151, 177),
        panel: BlocBuilder<AttendenceBloc, AttendenceState>(
          builder: (context, state) {
            // print("presence screen bloc type: ${state.runtimeType}");
            if (state is AttendenceInitial) {
              BlocProvider.of<AttendenceBloc>(context).add(
                GetAttendenceEvent(widget.gym!.id, widget.gym!.pid),
              );
            }

            // if (state is AttenedenceLoadedState) {
            // print("Debug: ${state.list.first.date}");
            // print("Debug: ${state.list.first.loginTime}");
            // print("Debug: ${state.list.first.logoutTime}");

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
                    width: screen.width - 20.0,
                    height: screen.height * 0.7,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            local.calender,
                            style: const TextStyle(
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
                                    child: BlocBuilder<PlayerGymBloc,
                                            PlayerGymState>(
                                        builder: (context, pState) {
                                      // if (pState is PlayerInGymLoadedState) {

                                      //   day1 = pState.data.startDate;
                                      //   print("Attendence:: $day1");
                                      // }
                                      return TableCalendar(
                                        daysOfWeekHeight: 20.0,
                                        calendarFormat: CalendarFormat.week,
                                        locale: isRtl ? "ar" : "en",
                                        focusedDay: fDay,
                                        firstDay: DateTime(2000),
                                        lastDay: lDay,
                                        currentDay: cDay,
                                        startingDayOfWeek:
                                            StartingDayOfWeek.sunday,
                                        weekendDays: const [],
                                        availableGestures:
                                            AvailableGestures.none,
                                        daysOfWeekStyle: DaysOfWeekStyle(
                                          dowTextFormatter: (date, locale) =>
                                              intl.DateFormat("EEE", locale)
                                                  .format(date),
                                          weekdayStyle:
                                              const TextStyle(fontSize: 10),
                                        ),
                                        calendarStyle: CalendarStyle(
                                            defaultDecoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              shape: BoxShape.circle,
                                            ),
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
                                          // print("Format Tapped: $format");
                                        },
                                        onPageChanged: (focusedDay) {
                                          // print("OnPageChanged! $focusedDay");

                                          fDay = focusedDay;
                                        },
                                        enabledDayPredicate: (day) {
                                          // for (var i in state.list) {
                                          //   if (i.date.compareTo(day.copyWith(
                                          //           isUtc: false)) ==
                                          //       0) {
                                          //     return true;
                                          //   }
                                          // }
                                          // return false;
                                          return true;
                                        },
                                        selectedDayPredicate: (day) {
                                          if (day.compareTo(cDay) == 0 ||
                                              day.compareTo(sDay) == 0) {
                                            return true;
                                          }

                                          return false;
                                          // if (state is AttenedenceLoadedState) {
                                          //   for (var i in state.list) {
                                          //     if (i.date.compareTo(day.copyWith(
                                          //             isUtc: false)) ==
                                          //         0) {

                                          //       return true;
                                          //     }
                                          //   }
                                          // }

                                          // return false;
                                        },
                                        onDaySelected:
                                            (selectedDay, focusedDay) {
                                          // print("selectedDay: $selectedDay "
                                          // "\n"
                                          // "focusedDay:  $focusedDay");
                                          sDay = selectedDay;

                                          a.clear();
                                          if (state is AttenedenceLoadedState) {
                                            // print("Attendence Loaded");
                                            for (var i in state.list) {
                                              // print(
                                              //     "Attendence Loaded 2 ${i.toJson()}");
                                              // print(
                                              //     "Attendence Loaded 2 ${selectedDay}");
                                              // print(
                                              //     "Attendence: ${DateTime.parse(intl.DateFormat("yyyy-MM-dd").format(i.date))}");

                                              if (selectedDay
                                                      .copyWith(isUtc: false)
                                                      .compareTo(DateTime.parse(
                                                          intl.DateFormat(
                                                                  "yyyy-MM-dd")
                                                              .format(
                                                                  i.date))) ==
                                                  0) {
                                                // print("Attendence Loaded 3");
                                                a.add(i);
                                              }
                                            }
                                          }
                                          // print("Attendence Loaded 4");
                                          setState(() {});
                                          // if (state is AttenedenceLoadedState) {
                                          //   setState(() {
                                          //     state.list.forEach(
                                          //       (element) {
                                          //         if (element.date.day ==
                                          //             selectedDay.day) {
                                          //           a.add(element);
                                          //         }
                                          //       },
                                          //     );
                                          //   });
                                          // }
                                        },
                                      );
                                    }),
                                  ),
                                ),
                                SizedBox(
                                  height: screen.height * 0.45,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        const SizedBox(height: 5.0),
                                        for (var i in a)
                                          Container(
                                            margin: const EdgeInsets.all(10.0),
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
                                                            style:
                                                                const TextStyle(
                                                              color: Color
                                                                  .fromARGB(181,
                                                                      0, 0, 0),
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
                                                            style:
                                                                const TextStyle(
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
                                                            style:
                                                                const TextStyle(
                                                              color: Color
                                                                  .fromARGB(181,
                                                                      0, 0, 0),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          Text(
                                                            intl.DateFormat(
                                                                    "h:mm a")
                                                                .format(i
                                                                    .logoutTime),
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            style:
                                                                const TextStyle(
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
                  // state is AttenedenceLoadedState
                  //     ?
                  SizedBox(
                    width: screen.width - 20.0,
                    height: screen.height * 0.7,
                    child: Column(
                      children: [
                        const SizedBox(height: 15.0),
                        Text(
                          local.list,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0, left: 15.0, right: 15.0),
                            child: Material(
                              elevation: 3,
                              borderRadius: BorderRadius.circular(15.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Scrollbar(
                                  interactive: true,
                                  controller: scrollController,
                                  child: ListView(
                                    controller: scrollController,
                                    children: [
                                      SingleChildScrollView(
                                        child: Table(
                                          textDirection: TextDirection.rtl,
                                          children: [
                                            TableRow(
                                              children: [
                                                Center(
                                                  child: Text(
                                                    local.date,
                                                    style: const TextStyle(
                                                        color: Colors.black54,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Center(
                                                  child: Text(
                                                    local.enteredAt,
                                                    style: const TextStyle(
                                                        color: Colors.black54,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Center(
                                                  child: Text(
                                                    local.exitedAt,
                                                    style: const TextStyle(
                                                        color: Colors.black54,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            if (state is AttenedenceLoadedState)
                                              for (var i in state.list)
                                                TableRow(
                                                  children: [
                                                    Center(
                                                      child: Text(
                                                        "${i.date.year}/${i.date.month}/${i.date.day}",
                                                        textDirection:
                                                            TextDirection.ltr,
                                                        style: const TextStyle(
                                                          color: Colors.black54,
                                                        ),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        intl.DateFormat(
                                                                "h:mm a")
                                                            .format(
                                                                i.loginTime),
                                                        textDirection:
                                                            TextDirection.ltr,
                                                        style: const TextStyle(
                                                          color: Colors.black54,
                                                        ),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        intl.DateFormat(
                                                                "h:mm a")
                                                            .format(
                                                                i.logoutTime),
                                                        textDirection:
                                                            TextDirection.ltr,
                                                        style: const TextStyle(
                                                          color: Colors.black54,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 40,
                            // height: screen.height * 0.1,
                            child: IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(Icons.arrow_back),
                              color: Colors.white,
                              iconSize: 30,
                            ),
                          ),
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
                                  const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Image(image: AssetImage(APP_LOGO_DARK)),
                              ),
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
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
                                  fontSize: widget.gym != null
                                      ? widget.gym!.name.length < 14
                                          ? 20
                                          : widget.gym!.name.length <= 20
                                              ? 15
                                              : 11
                                      : 0.0,
                                ),
                              ),
                              Text(
                                "${local.owner} : ${widget.gym?.ownerName}",
                                style: const TextStyle(
                                  color: Colors.white70,
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
                              " ${widget.gym?.phoneNum} ",
                              textDirection: TextDirection.ltr,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            Text(
                              "${local.balance}"
                              " : ",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            BlocBuilder<PlayerGymBloc, PlayerGymState>(
                              builder: (context, state) {
                                // print("PLAYER: state = ${state.runtimeType}");

                                return Text(
                                  state is PlayerInGymLoadedState
                                      ? f.format(state.data.balance)
                                      : state is PlayerInGymLoadingState
                                          ? "..."
                                          : "0",
                                  textDirection: TextDirection.ltr,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(192, 0, 0, 0),
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
