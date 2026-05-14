import 'package:dartz/dartz.dart' show Either;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/domain/classes/performance_entities/chart.dart';
import 'package:uniceps/app/domain/commands/performance_usecases/performance_commands.dart';
import 'package:uniceps/app/presentation/performance/dialogs/muscle_growth_chart_dialog.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/injection_dependency.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class PerformancePage extends StatefulWidget {
  const PerformancePage({super.key});
  @override
  State<PerformancePage> createState() => _PerformancePageState();
}

class _PerformancePageState extends State<PerformancePage> {
  late Future<Either<PerformanceFailure, List<Chart<DateTime, double>>>> _musclesEvolutionFuture;
  late Future<List<DateTime>> _datesCarousel;

  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    initFuture();
  }

  void initFuture({DateTime? month}) {
    final commands = sl<PerformanceCommands>();
    final now = DateTime.now();
    _musclesEvolutionFuture = commands.getMusclesEvolution(month ?? DateTime(now.year, now.month));
    _datesCarousel = _musclesEvolutionFuture.then<List<DateTime>>((value) => value.fold((l) => [], extractDateRange));
  }

  List<DateTime> extractDateRange(List<Chart<DateTime, double>> chart) {
    final dates = chart.expand((e) => e.points.map((e) => e.x)).toList();

    if (dates.isEmpty) return [];

    dates.sort();
    final from = dates.first;
    final to = dates.last;
    // final from = DateTime(2000);
    // final to = DateTime(2001);
    final monthsCount = (to.year - from.year) * 12 + (to.month - from.month) + 1;
    final calender = List.generate(monthsCount, (i) => DateTime(from.year + (i / 12).toInt(), from.month + (i % 12)));
    return calender;
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        FutureBuilder(
          future: _datesCarousel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) return const SizedBox();
              selectedDate ??= snapshot.data!.first;
              return SizedBox(
                width: screen.width,
                height: screen.width * .25,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: snapshot.data!
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FilterChip(
                            selected: e == selectedDate,
                            label: Text(
                              DateFormat('y-MM').format(e),
                              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
                            ),
                            onSelected: (i) {
                              if (!i) return;
                              setState(() {
                                selectedDate = e;
                                setState(() => initFuture(month: e));
                                print(e);
                              });
                            },
                          ),
                        ),
                      )
                      .toList(),
                ),
              );
            } else {
              return Text(l10n.loading);
            }
          },
        ),
        FutureBuilder(
          future: _musclesEvolutionFuture,
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: snapshot.data != null
                    ? snapshot.data!.fold(
                        (l) => [],
                        (r) => [
                          for (int i = 0; i < r.length; i++)
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => MuscleGrowthChartDialog(title: r[i].title, chart: r[i]),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(r[i].title, style: const TextStyle(fontSize: 12)),
                                    Text(
                                      '${() {
                                        if (r[i].points.isEmpty) return 0;
                                        final first = r[i].points.first;
                                        final last = r[i].points.last;
                                        if (first.y == 0) return last.y == 0 ? 0 : 100;
                                        return (((last.y - first.y) / first.y) * 100).toInt();
                                      }()}%',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      )
                    : [
                        for (int i = 0; i < 10; i++)
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('    ', style: TextStyle(fontSize: 12)),
                                Text(
                                  '---%',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                      ],
              ),
            );
          },
        ),
      ],
    );
  }
}
