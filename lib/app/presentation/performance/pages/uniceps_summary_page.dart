import 'package:dartz/dartz.dart' show Either;
import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/performance_entities/physical_report.dart';
import 'package:uniceps/app/domain/classes/performance_entities/uniceps_summery.dart';
import 'package:uniceps/app/domain/commands/performance_usecases/performance_commands.dart';
import 'package:uniceps/app/presentation/performance/widgets/physical_report_card.dart';
import 'package:uniceps/app/presentation/performance/widgets/total_accumulation_card.dart';
import 'package:uniceps/app/presentation/routine/widgets/progress_widget.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/helpers/compact_weight.dart';
import 'package:uniceps/injection_dependency.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class UnicepsSummaryPage extends StatefulWidget {
  const UnicepsSummaryPage({super.key, required this.summery});

  final UnicepsSummery summery;

  @override
  State<UnicepsSummaryPage> createState() => _UnicepsSummaryPageState();
}

class _UnicepsSummaryPageState extends State<UnicepsSummaryPage> {
  late Future<Either<PerformanceFailure, PhysicalReport>> _physicalReportFuture;

  @override
  void initState() {
    super.initState();
    _initFuture();
  }

  void _initFuture() {
    final commands = sl<PerformanceCommands>();
    _physicalReportFuture = commands.getPhysicalReport();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);
    final l10n = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      padding: .only(top: MediaQuery.paddingOf(context).top + 50, bottom: MediaQuery.paddingOf(context).bottom + 50),
      child: Center(
        child: SizedBox(
          width: screen.width * .9,
          child: Column(
            // crossAxisAlignment: .center,
            spacing: 10,
            children: [
              Container(
                width: screen.width,
                padding: const EdgeInsets.all(20.0),
                alignment: const .directional(-1, 0),
                child: Text(
                  l10n.summary,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.white, fontWeight: .bold),
                ),
              ),

              FutureBuilder<Either<PerformanceFailure, PhysicalReport>>(
                future: _physicalReportFuture,
                builder: (context, snapshot) {
                  return PhysicalReportCard(
                    report: snapshot.hasData ? snapshot.data!.fold((l) => .empty(), (r) => r) : .empty(),
                  );
                },
              ),
              Container(
                padding: const .all(15.0),
                height: 200,
                decoration: BoxDecoration(
                  // gradient: LinearGradient(colors: [Colors.red, Colors.deepOrange]),
                  gradient: LinearGradient(colors: [Colors.white, Colors.grey.shade200]),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 0),
                      color: Colors.white.withAlpha(100),
                      blurRadius: 10,
                      spreadRadius: 3,
                    ),
                  ],
                  borderRadius: .circular(25),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Icon(Icons.local_fire_department, color: Colors.red, size: 120),
                          Column(
                            children: [
                              Text(
                                widget.summery.currentStreak.toString(),
                                style: const TextStyle(color: Colors.black54, fontWeight: .bold),
                              ),
                              Text(
                                l10n.currentStreak,
                                style: const TextStyle(color: Colors.black54, fontSize: 10, fontWeight: .bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              widget.summery.longestStreak.toString(),
                              style: const TextStyle(fontSize: 70, fontWeight: .bold, color: Colors.black54),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              l10n.longestStreak,
                              style: const TextStyle(fontWeight: .bold, color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: TotalAccumulationCard(
                      title: l10n.totalSessions,
                      icon: const Icon(Icons.rocket, size: 50, color: Colors.blue),
                      value: widget.summery.totalSessions.toString(),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const .symmetric(vertical: 15.0, horizontal: 10.0),
                      // margin: const .symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Colors.white, Colors.grey.shade200]),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 0),
                            color: Colors.white.withAlpha(100),
                            blurRadius: 10,
                            spreadRadius: 3,
                          ),
                        ],
                        borderRadius: .circular(25),
                      ),
                      child: ProgressWidget(
                        percent: widget.summery.averageCompletionRate,
                        textStyle: const TextStyle(fontSize: 18, fontWeight: .bold, color: Colors.black54),
                        title: Text(
                          l10n.completionRate,
                          style: const TextStyle(fontSize: 14, fontWeight: .bold, color: Colors.black54),
                        ),
                        color: Colors.grey.shade700,
                        dimension: 90,
                        strokeWidth: 10,
                        progressBackground: Colors.grey.shade200,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        final compactWeight = formatMassiveWeight(widget.summery.totalWeight.toDouble());
                        return TotalAccumulationCard(
                          title: l10n.totalWeightLabel,
                          icon: const Icon(Icons.fitness_center, size: 50, color: Colors.amber),
                          value: compactWeight.value,
                          unit: compactWeight.unit,
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: TotalAccumulationCard(
                      title: l10n.totalDuration,
                      icon: const Icon(Icons.timer_outlined, size: 50, color: Colors.green),
                      value: (widget.summery.totalDurationInMinutes ~/ 60).toString(),
                      textDirection: Directionality.of(context),
                      unit: l10n.hour,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
