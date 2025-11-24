import 'dart:async';

import 'package:dartz/dartz.dart' as z;
import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/performance_entities/logs_report.dart';
import 'package:uniceps/app/domain/classes/performance_entities/physical_report.dart';
import 'package:uniceps/app/domain/classes/performance_entities/sessions_report.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine.dart';
import 'package:uniceps/app/domain/commands/performance_usecases/performance_commands.dart';
import 'package:uniceps/app/domain/commands/routine_management/routine_management_commands.dart';
import 'package:uniceps/app/presentation/performance/widgets/logs_report_card.dart';
import 'package:uniceps/app/presentation/performance/widgets/no_report_widget.dart';
import 'package:uniceps/app/presentation/performance/widgets/physical_report_card.dart';
import 'package:uniceps/app/presentation/performance/widgets/session_report_card.dart';
import 'package:uniceps/core/constants/app_routes.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PerformanceScreen extends StatefulWidget {
  const PerformanceScreen({super.key, required this.performanceCommands, required this.routineCommnds});

  final PerformanceCommands performanceCommands;
  final RoutineManagementCommands routineCommnds;

  @override
  State<PerformanceScreen> createState() => _PerformanceScreenState();
}

class _PerformanceScreenState extends State<PerformanceScreen> {
  Completer<bool>? routinesTrigger;
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
    routinesTrigger = Completer();
    final rEither = await widget.routineCommnds.getAllRoutines();
    try {
      rEither.fold(
        (l) {
          // routinesTrigger = Future.error(l);
          routinesTrigger?.completeError(l);
          return null;
        },
        (r) {
          routines = r;
          routines.sort((a, b) => b.createdAt.compareTo(a.createdAt));
          // return (routinesTrigger = Future.value(true));
          routinesTrigger?.complete(true);
        },
      );
    } catch (e) {
      print(e.toString());
    }
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
    final locale = AppLocalizations.of(context)!;
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: FutureBuilder(
        future: routinesTrigger?.future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
                  child: FutureBuilder(
                      future: sessionsReport,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data!.fold(
                            (l) => NoReportWidget(
                                message: l.when(
                              noValues: () => locale.sessionsReportNoValues,
                              invalidValues: () => locale.sessionsReportInvalidValues,
                            )),
                            (r) => SessionReportCard(report: r),
                          );
                        }
                        return const LoadingIndicator();
                      }),
                ),

                //
                //  Logs Report
                //

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FutureBuilder(
                        future: logsReport,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return snapshot.data!.fold(
                                (l) => NoReportWidget(
                                        message: l.when(
                                      noValues: () => locale.logsReportNoValues,
                                      invalidValues: () => locale.logsReportInvalidValues,
                                    )),
                                (r) => LogsReportCard(r: r));
                          }
                          return const LoadingIndicator();
                        }),
                  ),
                ),

                //
                //  Physical Report
                //
                SliverToBoxAdapter(
                  child: FutureBuilder(
                      future: physicalReport,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data!.fold(
                            (l) => NoReportWidget(
                                message: l.when(
                              noValues: () => locale.physicalReportNoValues,
                              invalidValues: () => locale.physicalReportInvalidValues,
                            )),
                            (r) => PhysicalReportCard(report: r),
                          );
                        }
                        return LoadingIndicator();
                      }),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(locale.noTrainingProgram));
          }
          return const LoadingIndicator();
        },
      ),
    );
  }
}
