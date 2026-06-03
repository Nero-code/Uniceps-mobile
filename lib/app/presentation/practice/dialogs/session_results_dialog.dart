import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/domain/classes/practice_entities/t_session.dart';
import 'package:uniceps/app/presentation/home/blocs/current_routine/current_routine_cubit.dart';
import 'package:uniceps/app/presentation/routine/widgets/progress_widget.dart';
import 'package:uniceps/core/constants/app_routes.dart';
import 'package:uniceps/core/constants/cap_images.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class SessionResultsDialog extends StatelessWidget {
  const SessionResultsDialog({
    super.key,
    required this.session,
    required this.progress,
    required this.oldTotalWeights,
    required this.defaultTotalSets,
  });

  final TSession session;
  final double progress;

  final double oldTotalWeights;
  final int defaultTotalSets;

  final double radius = 24.0;

  String? formatProgression(num first, num second) {
    if (first == second) return null;
    return '${(first > second) ? '+' : ''}${NumberFormat.decimalPattern().format(first - second)}';
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    // Calculate stats from session
    final totalExercises = session.logs.map((l) => l.exerciseId).toSet().length;
    final totalSets = session.logs.fold(0, (sum, log) => sum + log.finishedReps);
    final totalWeight = session.logs.fold(0.0, (sum, log) => sum + log.weight);
    final duration = DateTime.now().difference(session.createdAt);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      // Force dark status bar text/icons (for light backgrounds)
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent, // Keeps status bar background transparent
      ),
      child: PopScope(
        canPop: false,
        child: Material(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Header Image with Background
                  SizedBox(
                    height: MediaQuery.of(context).viewPadding.top + 170,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: MediaQuery.of(context).viewPadding.top + 180,
                          decoration: BoxDecoration(
                            // color: theme.colorScheme.primaryContainer.withOpacity(0.3),
                            // color: Color(0x7084B6E3),
                            gradient: LinearGradient(colors: [Colors.purple.shade300, Colors.blue.shade300]),
                            // borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
                          ),
                        ),
                        const Positioned(
                          bottom: -50.0,
                          right: -50.0,
                          // child: Icon(Icons.star_rate_rounded, size: 400, color: Colors.white10),
                          child: Image(image: AssetImage(APP_LOGO_WHITE), width: 300, color: Color(0x22FFFFFF)),
                        ),
                        Row(
                          crossAxisAlignment: .end,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: .min,
                                children: [
                                  Transform.flip(
                                    flipX: Directionality.of(context) == .rtl,
                                    child: Image.asset(CaptainImages.membership, height: 140, fit: BoxFit.contain),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ProgressWidget(
                                percent: progress,
                                title: Text(
                                  locale.progressRate,
                                  style: theme.textTheme.titleSmall?.copyWith(color: Colors.white),
                                ),
                                textStyle: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: .bold),
                                dimension: 100,
                                strokeWidth: 10,
                                color: Colors.white.withAlpha(200),
                                // color: theme.colorScheme.surface,
                                progressBackground: theme.colorScheme.surface.withAlpha(50),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: MediaQuery.of(context).viewPadding.top + 5,
                          width: MediaQuery.sizeOf(context).width,
                          child: Center(
                            child: Container(
                              padding: const .symmetric(vertical: 5, horizontal: 8),
                              decoration: BoxDecoration(color: Colors.white30, borderRadius: .circular(15)),
                              child: Text(
                                session.dayName,
                                maxLines: 1,
                                style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: .bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // DateTime Row
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                    child: Directionality(
                      textDirection: .ltr,
                      child: Row(
                        spacing: 5,
                        children: [
                          const Expanded(child: Divider(endIndent: 5)),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: .circular(15)),
                                padding: const .symmetric(horizontal: 5.0),
                                child: const Row(
                                  textDirection: .ltr,
                                  mainAxisSize: .min,
                                  children: [
                                    Icon(Icons.local_fire_department, color: Colors.orange),
                                    Text('+1', style: TextStyle(fontSize: 12, fontWeight: .w300)),
                                  ],
                                ),
                              ),
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
                          const Expanded(child: Divider(indent: 5)),
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
                          padding: EdgeInsets.zero,
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
                            _buildStatCard(
                              context,
                              icon: Icons.sports,
                              label: locale.setsAndRounds,
                              value: '$totalSets',
                              progression: formatProgression(totalSets, defaultTotalSets),
                              isIncrementProgression: totalSets != defaultTotalSets
                                  ? totalSets > defaultTotalSets
                                  : null,
                            ),
                            _buildStatCard(
                              context,
                              icon: Icons.monitor_weight_outlined,
                              label: locale.exerciseVolume,
                              value: NumberFormat.decimalPattern().format(totalWeight),
                              progression: formatProgression(totalWeight, oldTotalWeights),
                              isIncrementProgression: totalWeight != oldTotalWeights
                                  ? totalWeight > oldTotalWeights
                                  : null,
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
                        const SizedBox(height: 16),

                        // Action Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: () {
                              context.read<CurrentRoutineCubit>().getCurrentRoutine();
                              Navigator.popUntil(context, (route) => route.settings.name == AppRoutes.home);
                            },
                            child: Text(locale.finish, style: const TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Text(
                          APP_NAME,
                          style: TextStyle(fontFamily: 'Playwrite', color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).padding.bottom + 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    String? progression,
    bool? isIncrementProgression,
    String? unit,
  }) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        // color: theme.colorScheme.surface,
        // color: Colors.transparent,
        gradient: const LinearGradient(
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
          if (progression != null)
            Text(
              '$progression ${unit ?? ''}',
              style: theme.textTheme.titleMedium?.copyWith(
                // fontWeight: FontWeight.w400,
                fontSize: 14,
                color: isIncrementProgression == null
                    ? Colors.black54
                    : isIncrementProgression
                    ? Colors.green.shade300
                    : Colors.red.shade300,
              ),
              textDirection: .ltr,
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
