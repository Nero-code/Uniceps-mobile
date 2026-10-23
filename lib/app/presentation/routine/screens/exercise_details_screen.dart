import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/data/services/media_helper.dart';
import 'package:uniceps/app/presentation/routine/blocs/exercise_details/exercise_details_cubit.dart';
import 'package:uniceps/app/presentation/routine/widgets/exercise_grid_widget.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/helpers/exercise_details_result.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/injection_dependency.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class ExerciseDetailsScreen extends StatelessWidget {
  const ExerciseDetailsScreen({super.key, required this.exerciseId});
  final String exerciseId;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => ExerciseDetailsCubit(commands: sl())..getExerciseDetails(exerciseId),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  expandedHeight: MediaQuery.sizeOf(context).width * 0.8,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: EdgeInsets.all(MediaQuery.paddingOf(context).top),
                      child: FutureBuilder(
                        future: sl<MediaHelper>().getImage(exerciseId),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            if (snapshot.data != null) {
                              return Image.memory(snapshot.data!, fit: BoxFit.contain, alignment: Alignment.center);
                            }
                            return Icon(Icons.broken_image_rounded, size: 60, color: Colors.grey.shade300);
                          }
                          return const LoadingIndicator(elevated: false, backgroundColor: Colors.transparent);
                        },
                      ),
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverTabBarDelegate(
                    TabBar(
                      labelColor: Theme.of(context).colorScheme.primary,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Theme.of(context).colorScheme.primary,
                      indicatorWeight: 3,
                      tabs: const [
                        Tab(icon: Icon(Icons.info_outline), text: "Overview"),
                        Tab(icon: Icon(Icons.history_rounded), text: "History"),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: BlocBuilder<ExerciseDetailsCubit, ExerciseDetailsState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox(),
                  loading: () => const Center(child: LoadingIndicator()),
                  failure: (f) => Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          f.when(
                            eOffline: () => l10n.errNoInternet,
                            emptyExercises: () => l10n.emptyExcercises,
                            exerciseNotFound: () => l10n.emptyExcercises,
                            serverFailure: (_) => l10n.errServerException,
                            databaseFailure: (_) => l10n.errServerException,
                          ),
                        ),
                      ],
                    ),
                  ),
                  success: (result) => TabBarView(
                    children: [
                      _ExerciseOverviewTab(result: result, l10n: l10n),
                      _ExerciseHistoryTimelineTab(exerciseId: exerciseId),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverTabBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Theme.of(context).scaffoldBackgroundColor, child: _tabBar);
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) => false;
}

class _ExerciseOverviewTab extends StatelessWidget {
  const _ExerciseOverviewTab({required this.result, required this.l10n});

  final ExerciseDetailsResult result;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            result.exercise.name,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          _buildDetailRow(context, Icons.accessibility_new, l10n.muscleGroupLabel, result.exercise.muscleGroupName),
          _buildDetailRow(context, Icons.fitness_center, l10n.equipment, result.exercise.toolName),
          _buildDetailRow(context, Icons.adjust, l10n.muscleHead, result.exercise.muscleHeadName),
          _buildDetailRow(context, Icons.swap_horiz, l10n.laterals, result.exercise.laterals),
          const Divider(height: 32),
          if (result.exercise.description != null && result.exercise.description!.isNotEmpty) ...[
            Text(
              l10n.description,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(result.exercise.description!, style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5)),
            const SizedBox(height: 24),
          ],
          if (result.exercise.auxMuscle1 != null ||
              result.exercise.auxMuscle2 != null ||
              result.exercise.auxMuscle3 != null) ...[
            Text(
              l10n.secondaryMuscles,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                if (result.exercise.auxMuscle1 != null && result.exercise.auxMuscle1!.isNotEmpty)
                  Chip(label: Text(result.exercise.auxMuscle1!)),
                if (result.exercise.auxMuscle2 != null && result.exercise.auxMuscle2!.isNotEmpty)
                  Chip(label: Text(result.exercise.auxMuscle2!)),
                if (result.exercise.auxMuscle3 != null && result.exercise.auxMuscle3!.isNotEmpty)
                  Chip(label: Text(result.exercise.auxMuscle3!)),
              ],
            ),
          ],
          if (result.similars.isNotEmpty) ...[
            const Divider(height: 32),
            Text(
              l10n.similarExercises,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).width * .6,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: result.similars
                    .map(
                      (e) => SizedBox(
                        width: MediaQuery.sizeOf(context).width * .5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              ExerciseGridWidget(exercise: e),
                              Positioned(
                                top: 0.0,
                                left: 0.0,
                                child: IconButton(
                                  iconSize: 20,
                                  icon: const Icon(Icons.info_outline),
                                  color: Theme.of(context).colorScheme.primary,
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ExerciseDetailsScreen(exerciseId: e.apiId)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, IconData icon, String label, String value) {
    if (value.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 12),
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

class _ExerciseHistoryTimelineTab extends StatelessWidget {
  const _ExerciseHistoryTimelineTab({required this.exerciseId});

  final String exerciseId;

  List<_FakeSessionLog> _getFakeLogs() {
    final now = DateTime.now();
    return [
      _FakeSessionLog(
        date: now.subtract(const Duration(days: 2)),
        sessionTitle: "Chest & Triceps Day",
        isPr: true,
        sets: [
          const _FakeSetLog(setNumber: 1, weight: 60, reps: 12),
          const _FakeSetLog(setNumber: 2, weight: 80, reps: 10),
          const _FakeSetLog(setNumber: 3, weight: 85, reps: 8),
          const _FakeSetLog(setNumber: 4, weight: 92.5, reps: 6, isPr: true),
        ],
      ),
      _FakeSessionLog(
        date: now.subtract(const Duration(days: 7)),
        sessionTitle: "Push Workout A",
        sets: [
          const _FakeSetLog(setNumber: 1, weight: 60, reps: 12),
          const _FakeSetLog(setNumber: 2, weight: 80, reps: 10),
          const _FakeSetLog(setNumber: 3, weight: 85, reps: 8),
          const _FakeSetLog(setNumber: 4, weight: 87.5, reps: 7),
        ],
      ),
      _FakeSessionLog(
        date: now.subtract(const Duration(days: 13)),
        sessionTitle: "Upper Body Hypertrophy",
        sets: [
          const _FakeSetLog(setNumber: 1, weight: 55, reps: 12),
          const _FakeSetLog(setNumber: 2, weight: 75, reps: 10),
          const _FakeSetLog(setNumber: 3, weight: 80, reps: 8),
          const _FakeSetLog(setNumber: 4, weight: 85, reps: 6),
        ],
      ),
      _FakeSessionLog(
        date: now.subtract(const Duration(days: 20)),
        sessionTitle: "Push Workout B",
        sets: [
          const _FakeSetLog(setNumber: 1, weight: 50, reps: 12),
          const _FakeSetLog(setNumber: 2, weight: 70, reps: 10),
          const _FakeSetLog(setNumber: 3, weight: 75, reps: 8),
          const _FakeSetLog(setNumber: 4, weight: 80, reps: 8),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final logs = _getFakeLogs();
    final primaryColor = Theme.of(context).colorScheme.primary;

    if (logs.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.history_toggle_off, size: 64, color: Colors.grey.shade400),
            const SizedBox(height: 12),
            Text("No training history recorded yet.", style: TextStyle(color: Colors.grey.shade600, fontSize: 16)),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      itemCount: logs.length,
      itemBuilder: (context, index) {
        final session = logs[index];
        final isLast = index == logs.length - 1;

        // Order sets in descending order (last set performed is at the top)
        final setsChronological = session.sets;
        final setsDescending = session.sets.reversed.toList();

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Flat Timeline Node & Line
              SizedBox(
                width: 24,
                child: Column(
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: session.isPr ? Colors.amber.shade700 : primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(session.isPr ? Icons.star : Icons.fitness_center, size: 10, color: Colors.white),
                    ),
                    if (!isLast) Expanded(child: Container(width: 1.5, color: Colors.grey.shade300)),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              // Flat Session Container
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: session.isPr ? Colors.amber.shade400 : Colors.grey.shade300,
                        width: 1.0,
                      ),
                    ),
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header: Date & PR Badge
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              DateFormat('MMM dd, yyyy').format(session.date),
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            if (session.isPr)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.amber.shade50,
                                  border: Border.all(color: Colors.amber.shade300),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  "PR",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    color: Colors.amber.shade900,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(session.sessionTitle, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                        const SizedBox(height: 10),

                        // Flat summary stats row
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surfaceContainerHighest.withAlpha(80),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildStatItem("Best Weight", "${session.maxWeight} kg"),
                              _buildStatItem("Est. 1RM", "${session.estOneRepMax.toStringAsFixed(1)} kg"),
                              _buildStatItem("Volume", "${session.totalVolume.toInt()} kg"),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Sets table header
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 36,
                                child: Text(
                                  "SET",
                                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "WEIGHT",
                                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "REPS",
                                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey),
                                ),
                              ),
                              SizedBox(
                                width: 75,
                                child: Text(
                                  "PROGRESS",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(height: 6, thickness: 0.5),
                        ...setsDescending.map((setLog) {
                          final index = setsChronological.indexOf(setLog);
                          final previousSetLog = index > 0 ? setsChronological[index - 1] : null;
                          return _buildSetRow(context, setLog, previousSetLog);
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        const SizedBox(height: 2),
        Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildSetRow(BuildContext context, _FakeSetLog setLog, _FakeSetLog? previousSetLog) {
    final isPr = setLog.isPr;

    String progressText = "-";
    Color progressColor = Colors.grey;

    if (previousSetLog != null && previousSetLog.weight > 0) {
      final diff = ((setLog.weight - previousSetLog.weight) / previousSetLog.weight) * 100;
      if (diff > 0) {
        progressText = "+${diff.toStringAsFixed(1)}%";
        progressColor = Colors.green.shade700;
      } else if (diff < 0) {
        progressText = "${diff.toStringAsFixed(1)}%";
        progressColor = Colors.red.shade700;
      } else {
        progressText = "0%";
        progressColor = Colors.grey.shade600;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 5.0),
      child: Row(
        children: [
          SizedBox(
            width: 36,
            child: Text("${setLog.setNumber}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          ),
          Expanded(
            child: Text(
              "${setLog.weight} kg",
              style: TextStyle(
                fontWeight: isPr ? FontWeight.bold : FontWeight.normal,
                color: isPr ? Colors.amber.shade900 : null,
                fontSize: 13,
              ),
            ),
          ),
          Expanded(child: Text("${setLog.reps}", style: const TextStyle(fontSize: 13))),
          SizedBox(
            width: 75,
            child: Text(
              progressText,
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: progressColor),
            ),
          ),
        ],
      ),
    );
  }
}

class _FakeSessionLog {
  final DateTime date;
  final String sessionTitle;
  final List<_FakeSetLog> sets;
  final bool isPr;

  const _FakeSessionLog({required this.date, required this.sessionTitle, required this.sets, this.isPr = false});

  double get maxWeight => sets.map((e) => e.weight).reduce((a, b) => a > b ? a : b);

  double get totalVolume => sets.fold(0, (sum, set) => sum + (set.weight * set.reps));

  double get estOneRepMax {
    double best1RM = 0;
    for (var set in sets) {
      final oneRm = set.weight * (1 + set.reps / 30.0);
      if (oneRm > best1RM) best1RM = oneRm;
    }
    return best1RM;
  }
}

class _FakeSetLog {
  final int setNumber;
  final double weight;
  final int reps;
  final bool isPr;

  const _FakeSetLog({required this.setNumber, required this.weight, required this.reps, this.isPr = false});
}
