import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_filter.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_tool.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';
import 'package:uniceps/app/presentation/routine/blocs/exercises_v2/exercise_filter_cubit.dart';
import 'package:uniceps/app/presentation/routine/blocs/exercises_v2/exercises_v2_bloc.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class ExerciseFilterDrawer extends StatefulWidget {
  const ExerciseFilterDrawer({
    super.key,
    required this.initialMuscleGroups,
    required this.initialTools,
    required this.onApply,
  });

  final List<MuscleGroup> initialMuscleGroups;
  final List<ExerciseTool> initialTools;
  final void Function(List<MuscleGroup> groups, List<ExerciseTool> tools) onApply;

  @override
  State<ExerciseFilterDrawer> createState() => _ExerciseFilterDrawerState();
}

class _ExerciseFilterDrawerState extends State<ExerciseFilterDrawer> {
  late List<MuscleGroup> filterByMuscleGroup;
  late List<ExerciseTool> filterByTool;

  @override
  void initState() {
    super.initState();
    filterByMuscleGroup = List.from(widget.initialMuscleGroups);
    filterByTool = List.from(widget.initialTools);
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Drawer(
      width: screenWidth * 0.85,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(32), bottomLeft: Radius.circular(32)),
      ),
      child: BlocBuilder<ExerciseFilterCubit, ExerciseFilterState>(
        builder: (context, filterState) {
          if (filterState is! AvailableExercisesFilter) {
            return const Center(child: CircularProgressIndicator());
          }
          final state = filterState;
          return Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      automaticallyImplyLeading: false,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      title: Row(
                        children: [
                          Icon(Icons.filter_list_rounded, color: Theme.of(context).colorScheme.primary),
                          const SizedBox(width: 12),
                          Text(locale.selectFilter, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        ],
                      ),
                      centerTitle: false,
                      actions: [
                        IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close_rounded)),
                        const SizedBox(width: 8),
                      ],
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          _SectionHeader(title: locale.muscles, icon: Icons.fitness_center_rounded),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            runSpacing: 0,
                            children: [
                              for (final fg in state.filter.groups)
                                FilterChip(
                                  label: Text(fg.muscleGroupName),
                                  selected: filterByMuscleGroup.contains(fg),
                                  onSelected: (selected) {
                                    setState(() {
                                      selected ? filterByMuscleGroup.add(fg) : filterByMuscleGroup.remove(fg);
                                    });
                                  },
                                  selectedColor: Theme.of(context).colorScheme.primaryContainer,
                                  checkmarkColor: Theme.of(context).colorScheme.primary,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          _SectionHeader(title: locale.equipment, icon: Icons.handyman_rounded),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            runSpacing: 0,
                            children: [
                              for (final ft in state.filter.tools)
                                FilterChip(
                                  label: Text(ft.toolName),
                                  selected: filterByTool.contains(ft),
                                  onSelected: (selected) {
                                    setState(() {
                                      selected ? filterByTool.add(ft) : filterByTool.remove(ft);
                                    });
                                  },
                                  selectedColor: Theme.of(context).colorScheme.secondaryContainer,
                                  checkmarkColor: Theme.of(context).colorScheme.secondary,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                ),
                            ],
                          ),
                          const SizedBox(height: 32),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 16, 20, MediaQuery.paddingOf(context).bottom + 16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  boxShadow: [
                    BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, -5)),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        ),
                        onPressed: () {
                          context.read<ExercisesV2Bloc>().add(
                            GetExercisesByFilterEvent(filter: ExerciseFilter.empty()),
                          );
                          widget.onApply([], []);
                          Navigator.pop(context);
                        },
                        child: Text(locale.reset),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 2,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        ),
                        onPressed: () {
                          context.read<ExercisesV2Bloc>().add(
                            GetExercisesByFilterEvent(
                              filter: ExerciseFilter(groups: filterByMuscleGroup, tools: filterByTool),
                            ),
                          );
                          widget.onApply(filterByMuscleGroup, filterByTool);
                          Navigator.pop(context);
                        },
                        child: Text(locale.apply, style: const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SectionHeader({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.7)),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
