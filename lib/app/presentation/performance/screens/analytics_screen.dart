import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/performance/cubits/metrics/metrics_cubit.dart';
import 'package:uniceps/app/presentation/performance/pages/measurement_tool_page.dart';
import 'package:uniceps/app/presentation/performance/pages/muscles_page.dart';
import 'package:uniceps/app/presentation/performance/pages/sessions_explorer_screen.dart';
import 'package:uniceps/app/presentation/performance/pages/uniceps_summary_page.dart';
import 'package:uniceps/injection_dependency.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => MetricsCubit(performanceCommands: sl())..loadMetricsData(),
      child: Scaffold(
        // appBar: AppBar(title: Text('Analytics Page')),
        body: const [
          // Page 0: Summary
          UnicepsSummaryPage(),

          // Page 1: Muscles & Focus
          MusclesPage(),

          // Page 2: Tools & Measurements
          MeasurementToolPage(),

          // Page 3: Sessions Explorer
          SessionsExplorerScreen(),
        ][_currentPageIndex],

        // Bottom Navigation Bar
        bottomNavigationBar: NavigationBar(
          backgroundColor: Theme.of(context).colorScheme.surface.withAlpha(200),
          indicatorColor: Theme.of(context).colorScheme.secondary.withAlpha(100),
          selectedIndex: _currentPageIndex,
          onDestinationSelected: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.analytics_outlined),
              selectedIcon: const Icon(Icons.analytics),
              label: l10n.summary,
            ),
            NavigationDestination(
              icon: const Icon(Icons.fitness_center_outlined),
              selectedIcon: const Icon(Icons.fitness_center),
              label: l10n.muscles,
            ),
            NavigationDestination(
              icon: const Icon(Icons.straighten_outlined),
              selectedIcon: const Icon(Icons.straighten),
              label: l10n.tools,
            ),
            NavigationDestination(
              icon: const Icon(Icons.history_edu_outlined),
              selectedIcon: const Icon(Icons.history_edu),
              label: l10n.sessions,
            ),
          ],
        ),
      ),
    );
  }
}
