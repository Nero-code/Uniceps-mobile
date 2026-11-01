import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/domain/classes/performance_entities/chart.dart';
import 'package:uniceps/app/presentation/performance/cubits/metrics/metrics_cubit.dart';
import 'package:uniceps/app/presentation/performance/dialogs/muscle_growth_chart_dialog.dart';
import 'package:uniceps/app/presentation/performance/widgets/muscle_focus_chart.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class MusclesPage extends StatefulWidget {
  const MusclesPage({super.key});

  @override
  State<MusclesPage> createState() => _MusclesPageState();
}

class _MusclesPageState extends State<MusclesPage> {
  late DateTime _fromDate;
  late DateTime _toDate;
  String _selectedPreset = '30 Days';

  @override
  void initState() {
    super.initState();
    _toDate = DateTime.now();
    _fromDate = _toDate.subtract(const Duration(days: 30));
  }

  void _applyPreset(String preset) {
    final now = DateTime.now();
    setState(() {
      _selectedPreset = preset;
      _toDate = now;
      if (preset == '7 Days') {
        _fromDate = now.subtract(const Duration(days: 7));
      } else if (preset == '30 Days') {
        _fromDate = now.subtract(const Duration(days: 30));
      } else if (preset == '3 Months') {
        _fromDate = now.subtract(const Duration(days: 90));
      } else if (preset == '1 Year') {
        _fromDate = now.subtract(const Duration(days: 365));
      }
    });
    context.read<MetricsCubit>().loadMetricsData(fromDate: _fromDate, toDate: _toDate);
  }

  int _calcProgressPercentage(Chart<DateTime, double> chart) {
    if (chart.points.isEmpty) return 0;
    final first = chart.points.first;
    final last = chart.points.last;
    if (first.y == 0) return last.y == 0 ? 0 : 100;
    return (((last.y - first.y) / first.y) * 100).toInt();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final primaryColor = Theme.of(context).colorScheme.primary;
    final screen = MediaQuery.sizeOf(context);

    final daysDiff = _toDate.difference(_fromDate).inDays;

    final presets = [
      {'key': '7 Days', 'label': l10n.days7},
      {'key': '30 Days', 'label': l10n.days30},
      {'key': '3 Months', 'label': l10n.months3},
      {'key': '1 Year', 'label': l10n.year1},
    ];

    return SingleChildScrollView(
      padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top, bottom: 32),
      child: Column(
        children: [
          // Period Selector Header Card
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.date_range, color: primaryColor, size: 20),
                        const SizedBox(width: 8),
                        Text(l10n.analysisPeriod, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: primaryColor.withAlpha(20),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "$daysDiff ${l10n.day}",
                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: primaryColor),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // From / To Date Pickers Row
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final picked = await showDatePicker(
                            context: context,
                            initialDate: _fromDate,
                            firstDate: DateTime(2020),
                            lastDate: _toDate,
                          );
                          if (picked != null) {
                            setState(() {
                              _fromDate = picked;
                              _selectedPreset = 'Custom';
                            });
                            if (context.mounted) {
                              context.read<MetricsCubit>().loadMetricsData(fromDate: _fromDate, toDate: _toDate);
                            }
                          }
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(l10n.from, style: const TextStyle(fontSize: 10, color: Colors.grey)),
                              const SizedBox(height: 2),
                              Text(
                                DateFormat('MMM dd, yyyy').format(_fromDate),
                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(Icons.arrow_forward, size: 16, color: Colors.grey),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final picked = await showDatePicker(
                            context: context,
                            initialDate: _toDate,
                            firstDate: _fromDate,
                            lastDate: DateTime.now(),
                          );
                          if (picked != null) {
                            setState(() {
                              _toDate = picked;
                              _selectedPreset = 'Custom';
                            });
                            if (context.mounted) {
                              context.read<MetricsCubit>().loadMetricsData(fromDate: _fromDate, toDate: _toDate);
                            }
                          }
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(l10n.to, style: const TextStyle(fontSize: 10, color: Colors.grey)),
                              const SizedBox(height: 2),
                              Text(
                                DateFormat('MMM dd, yyyy').format(_toDate),
                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Preset Chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: presets.map((p) {
                      final isSelected = _selectedPreset == p['key'];
                      return Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        child: ChoiceChip(
                          label: Text(p['label']!),
                          selected: isSelected,
                          onSelected: (_) => _applyPreset(p['key']!),
                          selectedColor: primaryColor,
                          labelStyle: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                            fontSize: 11,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Muscle Focus & Evolution Sections from MetricsCubit
          BlocBuilder<MetricsCubit, MetricsState>(
            builder: (context, state) {
              if (state is MetricsLoading || state is MetricsInitial) {
                return Container(
                  width: screen.width,
                  height: 220,
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  alignment: Alignment.center,
                  child: const LoadingIndicator(
                    backgroundColor: Colors.transparent,
                    elevated: false,
                    size: Size(40, 40),
                  ),
                );
              }

              if (state is MetricsFailure) {
                return Container(
                  width: screen.width,
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    l10n.noValues,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                );
              }

              if (state is MetricsLoaded) {
                final muscleFocus = state.result.muscleFocus;
                final musclesEvolution = state.result.musclesEvolution;

                return Column(
                  children: [
                    // Muscle Focus Chart
                    muscleFocus.isEmpty
                        ? Container(
                            width: screen.width,
                            padding: const EdgeInsets.all(16.0),
                            margin: const EdgeInsets.symmetric(horizontal: 16.0),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              l10n.noValuesPositiveStatement,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                          )
                        : MuscleFocusChart(chartData: muscleFocus),
                    const SizedBox(height: 16),

                    // Muscle Evolution Grid
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          l10n.muscleEvolutionTrend,
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    musclesEvolution.isEmpty
                        ? Center(
                            child: Text(l10n.noValues, style: const TextStyle(color: Colors.white70)),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: musclesEvolution.map((chart) {
                                final progressPct = _calcProgressPercentage(chart);
                                final isPositive = progressPct >= 0;

                                return InkWell(
                                  onTap: () {
                                    final chartCopy = Chart(
                                      title: chart.title,
                                      points: List.from(chart.points)..removeWhere((e) => e.y == 0),
                                    );
                                    showDialog(
                                      context: context,
                                      builder: (context) =>
                                          MuscleGrowthChartDialog(title: chartCopy.title, chart: chart),
                                    );
                                  },
                                  borderRadius: BorderRadius.circular(12),
                                  child: Container(
                                    width: (screen.width - 42) / 2,
                                    padding: const EdgeInsets.all(12.0),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.surface,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: Colors.grey.shade300),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                chart.title,
                                                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Icon(
                                              isPositive ? Icons.trending_up : Icons.trending_down,
                                              size: 16,
                                              color: isPositive ? Colors.green.shade700 : Colors.red.shade700,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Text(
                                              "${isPositive ? '+' : ''}$progressPct%",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: isPositive ? Colors.green.shade700 : Colors.red.shade700,
                                              ),
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              l10n.growth,
                                              style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                  ],
                );
              }

              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
