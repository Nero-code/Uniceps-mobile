import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_session.dart';
import 'package:uniceps/app/presentation/home/blocs/current_routine/current_routine_cubit.dart';
import 'package:uniceps/app/presentation/routine/widgets/progress_widget.dart';
import 'package:uniceps/core/constants/app_routes.dart';
import 'package:uniceps/core/constants/cap_images.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class SessionResultsDialog extends StatelessWidget {
  const SessionResultsDialog({super.key, required this.session, required this.progress});

  final TSession session;
  final double progress;

  final double radius = 24.0;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    // Calculate stats from session
    final totalExercises = session.logs.map((l) => l.exerciseId).toSet().length;
    final totalSets = session.logs.fold(0, (sum, log) => sum + log.reps);
    final totalWeight = session.logs.fold(0.0, (sum, log) => sum + log.weight);
    final duration = DateTime.now().difference(session.createdAt);

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Header Image with Background
          SizedBox(
            height: MediaQuery.of(context).padding.top + 180,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    // color: theme.colorScheme.primaryContainer.withOpacity(0.3),
                    // color: Color(0x7084B6E3),
                    gradient: LinearGradient(colors: [Colors.purple.shade300, Colors.blue.shade300]),
                    // borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
                  ),
                ),
                Positioned(
                  bottom: -130.0,
                  right: -100.0,
                  child: Icon(Icons.star_rate_rounded, size: 400, color: Colors.white10),
                ),
                Row(
                  children: [
                    Expanded(child: Image.asset(CaptainImages.motive, height: 160, fit: BoxFit.contain)),
                    Expanded(
                      child: ProgressWidget(
                        percent: progress,
                        title: Text(
                          locale.progressRate,
                          style: theme.textTheme.titleSmall?.copyWith(color: Colors.white),
                        ),
                        textStyle: TextStyle(fontSize: 20, color: Colors.white, fontWeight: .bold),
                        dimension: 100,
                        strokeWidth: 15,
                        // color: theme.colorScheme.primary,
                        color: progress == 1
                            ? Colors.green.shade300
                            : progress >= .5
                            ? Colors.amber.shade300
                            : Colors.red.shade300,
                        progressBackground: theme.colorScheme.surface.withAlpha(100),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Directionality(
              textDirection: .ltr,
              child: Row(
                spacing: 5,
                children: [
                  Expanded(child: Divider(endIndent: 5)),
                  Column(
                    children: [
                      Text(
                        DateFormat.yMMMMd().format(session.createdAt),
                        style: theme.textTheme.titleLarge?.copyWith(fontWeight: .bold, color: Colors.black45),
                      ),
                      Text(
                        DateFormat(DateFormat.HOUR_MINUTE).format(DateTime.now()),
                        textDirection: .ltr,
                        style: theme.textTheme.titleMedium?.copyWith(fontWeight: .w300, color: Colors.black),
                      ),
                    ],
                  ),
                  Expanded(child: Divider(indent: 5)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                // Stats Grid
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1,
                  children: [
                    _buildStatCard(
                      context,
                      icon: Icons.fitness_center,
                      label: locale.exercises,
                      value: '$totalExercises',
                    ),
                    _buildStatCard(context, icon: Icons.sports, label: locale.setsAndRounds, value: '$totalSets'),
                    _buildStatCard(
                      context,
                      icon: Icons.monitor_weight_outlined,
                      label: locale.exerciseVolume,
                      value: NumberFormat.decimalPattern().format(totalWeight),
                      unit: 'Kg',
                    ),
                    _buildStatCard(
                      context,
                      icon: Icons.timer_outlined,
                      label: locale.duration,
                      value: '${duration.inMinutes}',
                      unit: 'min',
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Action Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      context.read<CurrentRoutineCubit>().getCurrentRoutine();
                      Navigator.popUntil(context, (route) => route.settings.name == AppRoutes.home);
                    },
                    child: Text(locale.finish, style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 20),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    String? unit,
  }) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        // color: theme.colorScheme.surface,
        // color: Colors.transparent,
        gradient: LinearGradient(
          colors: [Color(0x00FFFFFF), Colors.white, Color(0x00FFFFFF)],
          stops: [0.01, 0.2, 0.4],
          begin: .topLeft,
          end: .bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: theme.colorScheme.primary),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: .end,
            mainAxisSize: .min,
            textDirection: .ltr,
            spacing: 3,
            children: [
              Text(
                value,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.black54,
                ),
                textDirection: .ltr,
              ),
              if (unit != null)
                Text(
                  unit,
                  style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold, color: Colors.black26),
                  textDirection: .ltr,
                ),
            ],
          ),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(color: Colors.grey),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
