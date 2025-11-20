import 'package:dartz/dartz.dart' as z;
import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/performance_entities/logs_report.dart';
import 'package:uniceps/app/domain/classes/performance_entities/physical_report.dart';
import 'package:uniceps/app/domain/classes/performance_entities/sessions_report.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/commands/performance_usecases/performance_commands.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_management_commands.dart';
import 'package:uniceps/app/presentation/performance/widgets/analytics_card.dart';
import 'package:uniceps/core/constants/app_routes.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/widgets/loading_page.dart';

class PerformanceScreen extends StatefulWidget {
  const PerformanceScreen({super.key, required this.performanceCommands, required this.routineCommnds});

  final PerformanceCommands performanceCommands;
  final RoutineManagementCommands routineCommnds;

  @override
  State<PerformanceScreen> createState() => _PerformanceScreenState();
}

class _PerformanceScreenState extends State<PerformanceScreen> {
  Future<bool>? routinesTrigger;
  List<Routine> routines = [];
  Routine? selectedRoutine;
  Future<z.Either<PerformanceFailure, SessionsReport>>? sessionsReport;
  Future<z.Either<PerformanceFailure, LogsReport>>? logsReport;
  Future<z.Either<PerformanceFailure, PhysicalReport>>? physicalReport;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    final rEither = await widget.routineCommnds.getAllRoutines();
    rEither.fold<void>(
      (l) => routinesTrigger = Future.error(l),
      (r) {
        routines = r;
        routines.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        routinesTrigger = Future.value(true);
      },
    );
    if (routines.isNotEmpty) {
      selectRoutine(routines.first);
    }
  }

  Future<void> selectRoutine(Routine r) async {
    selectedRoutine = r;
    sessionsReport = widget.performanceCommands.getSessionsReport(r.id!);
    logsReport = widget.performanceCommands.getLogsReport(r.id!);
    physicalReport = widget.performanceCommands.getPhysicalReport();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: FutureBuilder(
        future: routinesTrigger,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  centerTitle: true,
                  pinned: true,
                  actions: [
                    IconButton(
                      onPressed: () => Navigator.pushNamed(context, AppRoutes.measurementTool),
                      icon: const Icon(Icons.straighten_rounded),
                    ),
                  ],
                  title: SizedBox(
                    width: screenSize.width * .75,
                    child: DropdownButton(
                      value: selectedRoutine,
                      elevation: 1,
                      borderRadius: BorderRadius.circular(10),
                      onChanged: (value) => value != null ? selectRoutine(value) : null,
                      items: routines.map((r) => DropdownMenuItem(value: r, child: Text(r.name))).toList(),
                    ),
                  ),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 10)),

                //
                //  Sessions Report
                //

                SliverToBoxAdapter(
                  child: Container(
                    width: screenSize.width,
                    margin: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Sessions Report',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.arrow_drop_up_rounded),
                                      SizedBox(width: 5.0),
                                      Text(
                                        '02:00:00',
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.remove),
                                      SizedBox(width: 5.0),
                                      Text(
                                        '01:00:00',
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.arrow_drop_down_rounded),
                                      SizedBox(width: 5.0),
                                      Text(
                                        '00:30:00',
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.timer),
                                      SizedBox(width: 5.0),
                                      Text(
                                        '120:30:15',
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox.square(
                                    dimension: screenSize.width * .2,
                                    child: CircularProgressIndicator(
                                      color: Colors.orange.withOpacity(0.5),
                                      value: .9,
                                      strokeWidth: 10,
                                      strokeAlign: 1,
                                      strokeCap: StrokeCap.round,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Sessions',
                                        style: TextStyle(fontSize: 10),
                                      ),
                                      Text(
                                        '26',
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                Text(
                                  'Progress Rate',
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  '45.2',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                //
                //  Logs Report
                //

                SliverPadding(
                  padding: const EdgeInsets.all(8.0),
                  sliver: SliverGrid.count(
                    crossAxisCount: 2,
                    childAspectRatio: 16 / 12,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    children: const [
                      AnalyticsCard(
                        title: 'Weight Lifting',
                        icon: Icon(Icons.fitness_center, color: Colors.red),
                        iconBackground: Colors.red,
                        max: 0,
                        avg: 0,
                        min: 0,
                      ),
                      AnalyticsCard(
                        title: 'Exercise Density',
                        icon: Icon(Icons.menu_open_rounded, color: Colors.blue),
                        iconBackground: Colors.lightBlue,
                        max: 0,
                        avg: 0,
                        min: 0,
                      ),
                      AnalyticsCard(
                        title: 'Exercise Volume',
                        icon: Icon(Icons.multitrack_audio_rounded, color: Colors.green),
                        iconBackground: Colors.green,
                        max: 0,
                        avg: 0,
                        min: 0,
                      ),
                      AnalyticsCard(
                        title: 'Exercise Intensity',
                        icon: Icon(
                          Icons.keyboard_double_arrow_up,
                          color: Colors.orange,
                        ),
                        iconBackground: Colors.amber,
                        max: 0,
                        avg: 0,
                        min: 0,
                      ),
                    ],
                  ),
                ),

                //
                //  Physical Report
                //
                SliverToBoxAdapter(
                  child: Container(
                    width: screenSize.width,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Physical Report',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox.square(
                                      dimension: screenSize.width * .2,
                                      child: CircularProgressIndicator(
                                        color: Colors.red.withOpacity(0.5),
                                        backgroundColor: Colors.grey.shade100,
                                        value: .74,
                                        strokeWidth: 10,
                                        strokeAlign: 1,
                                        strokeCap: StrokeCap.round,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'BMI',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        Text(
                                          '74.3%',
                                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox.square(
                                      dimension: screenSize.width * .2,
                                      child: CircularProgressIndicator(
                                        color: Colors.amber.withOpacity(0.5),
                                        backgroundColor: Colors.grey.shade100,
                                        value: .43,
                                        strokeWidth: 10,
                                        strokeAlign: 1,
                                        strokeCap: StrokeCap.round,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'BMR',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        Text(
                                          '43%',
                                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox.square(
                                      dimension: screenSize.width * .2,
                                      child: CircularProgressIndicator(
                                        color: Colors.green.withOpacity(0.5),
                                        backgroundColor: Colors.grey.shade100,
                                        value: .26,
                                        strokeWidth: 10,
                                        strokeAlign: 1,
                                        strokeCap: StrokeCap.round,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'BF%',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        Text(
                                          '26%',
                                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'disclaimer: note that these values help you gain insight into your body measurements and ratios',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return const LoadingIndicator();
        },
      ),
    );
  }
}
