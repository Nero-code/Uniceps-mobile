import 'package:dartz/dartz.dart' show Either;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/performance_entities/muscle_focus.dart';
import 'package:uniceps/app/domain/classes/performance_entities/uniceps_summery.dart';
import 'package:uniceps/app/domain/commands/performance_usecases/performance_commands.dart';
import 'package:uniceps/app/presentation/performance/cubits/uni_summary/uni_summary_cubit.dart';
import 'package:uniceps/app/presentation/performance/pages/measurement_tool_page.dart';
import 'package:uniceps/app/presentation/performance/pages/performance_page.dart';
import 'package:uniceps/app/presentation/performance/pages/uniceps_summary_page.dart';
import 'package:uniceps/app/presentation/performance/widgets/muscle_focus_chart.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/injection_dependency.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final Set<DateTime> selectedTimeFilter = {};

  late Future<Either<PerformanceFailure, UnicepsSummery>> _summeryFuture;
  late Future<Either<PerformanceFailure, List<MuscleFocus>>> _muscleFocusFuture;

  DateTime? from, to;

  int _currentPageIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPageIndex != next) {
        setState(() => _currentPageIndex = next);
      }
    });
    _initFutures();
  }

  void _initFutures() {
    final commands = sl<PerformanceCommands>();
    _summeryFuture = commands.getSummery();
    _muscleFocusFuture = commands.getMuscleFocusChart();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final screen = MediaQuery.sizeOf(context);
    final theme = Theme.of(context).colorScheme;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      // Force dark status bar text/icons (for light backgrounds)
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent, // Keeps status bar background transparent
      ),
      child: BlocProvider(
        create: (context) => UniSummaryCubit(commands: sl())..getSummary(),
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                width: screen.width,
                height: screen.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [theme.primary, theme.secondary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [.3, .7],
                  ),
                ),
              ),
              const Positioned(
                top: -200,
                left: -200,
                child: Icon(Icons.close_rounded, size: 500, color: Colors.white10),
              ),
              const Positioned(
                top: -100,
                right: -200,
                child: Icon(Icons.local_fire_department, size: 500, color: Colors.white10),
              ),
              const Positioned(
                bottom: -100,
                left: -200,
                child: Icon(Icons.local_fire_department, size: 500, color: Colors.white10),
              ),
              const Positioned(
                bottom: -200,
                right: -200,
                child: Icon(Icons.close_rounded, size: 500, color: Colors.white10),
              ),
              PageView(
                controller: _pageController,
                children: [
                  _KeepAliveWrapper(
                    child: FutureBuilder<Either<PerformanceFailure, UnicepsSummery>>(
                      future: _summeryFuture,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data!.fold(
                            (l) => Center(
                              child: Text(
                                l.when(noValues: () => l10n.noValues, invalidValues: () => l10n.invalidValues),
                              ),
                            ),
                            (r) => UnicepsSummaryPage(summery: r),
                          );
                        }
                        return const LoadingIndicator();
                      },
                    ),
                  ),
                  _KeepAliveWrapper(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                        top: MediaQuery.paddingOf(context).top + 50,
                        bottom: MediaQuery.paddingOf(context).bottom + 50,
                      ),
                      child: Column(
                        children: [
                          FutureBuilder<Either<PerformanceFailure, List<MuscleFocus>>>(
                            future: _muscleFocusFuture,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return snapshot.data!.fold(
                                  (l) => Container(
                                    width: screen.width,
                                    height: screen.width * .7,
                                    padding: const .all(8.0),
                                    margin: const .all(16.0),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [Colors.white, Colors.grey.shade200]),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 0),
                                          color: Colors.white.withAlpha(100),
                                          blurRadius: 5,
                                          spreadRadius: 3,
                                        ),
                                      ],
                                      borderRadius: .circular(25),
                                    ),
                                    alignment: .center,
                                    child: Text(
                                      l.when(
                                        noValues: () => l10n.noValuesPositiveStatement,
                                        invalidValues: () => l10n.invalidValues,
                                      ),
                                      style: const TextStyle(fontSize: 20, fontWeight: .bold, color: Colors.grey),
                                    ),
                                  ),
                                  (r) => MuscleFocusChart(chartData: r),
                                );
                              }
                              return Container(
                                width: screen.width,
                                height: screen.width * .7,
                                padding: const .all(8.0),
                                margin: const .all(16.0),
                                decoration: BoxDecoration(
                                  // color: Colors.white,
                                  gradient: LinearGradient(colors: [Colors.white, Colors.grey.shade200]),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 0),
                                      color: Colors.white.withAlpha(100),
                                      blurRadius: 5,
                                      spreadRadius: 3,
                                    ),
                                  ],
                                  borderRadius: .circular(25),
                                ),
                                alignment: .center,
                                child: const LoadingIndicator(
                                  backgroundColor: Colors.transparent,
                                  elevated: false,
                                  size: Size(50, 50),
                                ),
                              );
                            },
                          ),
                          const PerformancePage(),
                        ],
                      ),
                    ),
                  ),
                  _KeepAliveWrapper(child: MeasurementToolPage(commands: sl())),
                ],
              ),
              Positioned(
                top: MediaQuery.paddingOf(context).top,
                width: screen.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: screen.width,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(offset: Offset(0, 3), color: Colors.black12, blurRadius: 3, spreadRadius: 0),
                          ],
                        ),
                        child: SegmentedButton<int>(
                          segments: [
                            ButtonSegment(value: 0, icon: const Icon(Icons.analytics), label: Text(l10n.summary)),
                            ButtonSegment(value: 1, icon: const Icon(Icons.fitness_center), label: Text(l10n.muscles)),
                            ButtonSegment(value: 2, icon: const Icon(Icons.straighten), label: Text(l10n.tools)),
                          ],
                          selected: {_currentPageIndex},
                          onSelectionChanged: (Set<int> newSelection) {
                            setState(() {
                              _currentPageIndex = newSelection.first;
                              _pageController.animateToPage(
                                _currentPageIndex,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            });
                          },
                          style: ButtonStyle(
                            side: WidgetStateProperty.resolveWith<BorderSide?>((Set<WidgetState> states) {
                              return BorderSide.none;
                            }),
                            backgroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
                              if (states.contains(WidgetState.selected)) return theme.secondary;
                              return Colors.white;
                            }),
                            foregroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
                              if (states.contains(WidgetState.selected)) return Colors.white;
                              return Colors.black;
                            }),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _KeepAliveWrapper extends StatefulWidget {
  final Widget child;
  const _KeepAliveWrapper({required this.child});

  @override
  State<_KeepAliveWrapper> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<_KeepAliveWrapper> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
