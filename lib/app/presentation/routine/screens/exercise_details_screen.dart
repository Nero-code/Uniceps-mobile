import 'package:flutter/material.dart';
import 'package:uniceps/app/data/services/media_helper.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/injection_dependency.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class ExerciseDetailsScreen extends StatelessWidget {
  const ExerciseDetailsScreen({super.key, required this.exercise});
  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.sizeOf(context).width,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsets.all(MediaQuery.paddingOf(context).top),
                child: FutureBuilder(
                  future: sl<MediaHelper>().getImage(exercise.apiId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.data != null) {
                        return Image.memory(snapshot.data!, fit: BoxFit.contain, alignment: .center);
                      }
                      return Icon(Icons.broken_image_rounded, size: 60, color: Colors.grey.shade300);
                    }
                    return const LoadingIndicator(elevated: false, backgroundColor: Colors.transparent);
                  },
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exercise.name,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildDetailRow(context, Icons.accessibility_new, l10n.muscleGroupLabel, exercise.muscleGroupName),
                    _buildDetailRow(context, Icons.fitness_center, l10n.equipment, exercise.toolName),
                    _buildDetailRow(context, Icons.adjust, l10n.muscleHead, exercise.muscleHeadName),
                    _buildDetailRow(context, Icons.swap_horiz, l10n.laterals, exercise.laterals),
                    const Divider(height: 32),
                    if (exercise.description != null && exercise.description!.isNotEmpty) ...[
                      Text(
                        l10n.description,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(exercise.description!, style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5)),
                      const SizedBox(height: 24),
                    ],
                    if (exercise.auxMuscle1 != null || exercise.auxMuscle2 != null || exercise.auxMuscle3 != null) ...[
                      Text(
                        l10n.secondaryMuscles,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: [
                          if (exercise.auxMuscle1 != null && exercise.auxMuscle1!.isNotEmpty)
                            Chip(label: Text(exercise.auxMuscle1!)),
                          if (exercise.auxMuscle2 != null && exercise.auxMuscle2!.isNotEmpty)
                            Chip(label: Text(exercise.auxMuscle2!)),
                          if (exercise.auxMuscle3 != null && exercise.auxMuscle3!.isNotEmpty)
                            Chip(label: Text(exercise.auxMuscle3!)),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ]),
          ),
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
