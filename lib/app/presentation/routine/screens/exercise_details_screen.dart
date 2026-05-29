import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/data/services/media_helper.dart';
import 'package:uniceps/app/presentation/routine/blocs/exercise_details/exercise_details_cubit.dart';
import 'package:uniceps/app/presentation/routine/widgets/exercise_grid_widget.dart';
import 'package:uniceps/core/widgets/error_widget.dart';
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
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.sizeOf(context).width,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.all(MediaQuery.paddingOf(context).top),
                  child: FutureBuilder(
                    future: sl<MediaHelper>().getImage(exerciseId),
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
                BlocBuilder<ExerciseDetailsCubit, ExerciseDetailsState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox(),
                      loading: () => const Center(child: LoadingIndicator()),
                      failure: (f) => ErrorScreenWidget(f: f),
                      success: (result) => Padding(
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
                            _buildDetailRow(
                              context,
                              Icons.accessibility_new,
                              l10n.muscleGroupLabel,
                              result.exercise.muscleGroupName,
                            ),
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
                              Text(
                                result.exercise.description!,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5),
                              ),
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
                                  scrollDirection: .horizontal,
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
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            ExerciseDetailsScreen(exerciseId: e.apiId),
                                                      ),
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
                      ),
                    );
                  },
                ),
              ]),
            ),
          ],
        ),
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
