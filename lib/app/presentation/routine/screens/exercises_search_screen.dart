import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_filter.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_tool.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';
import 'package:uniceps/app/presentation/blocs/exercise_lib/lib_sync_cubit.dart';
import 'package:uniceps/app/presentation/routine/blocs/exercises_v2/exercise_filter_cubit.dart';
import 'package:uniceps/app/presentation/routine/blocs/exercises_v2/exercises_v2_bloc.dart';
import 'package:uniceps/app/presentation/routine/blocs/items_edit/items_edit_bloc.dart';
import 'package:uniceps/app/presentation/routine/screens/exercise_details_screen.dart';
import 'package:uniceps/app/presentation/routine/widgets/exercise_grid_widget.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class ExercisesSearchScreen extends StatefulWidget {
  const ExercisesSearchScreen({
    super.key,
    required this.presentExerciseIds,
    required this.dayName,
    required this.dayId,
  });

  final List<String> presentExerciseIds;
  final String dayName;
  final int dayId;

  @override
  State<ExercisesSearchScreen> createState() => _ExercisesSearchScreenState();
}

class _ExercisesSearchScreenState extends State<ExercisesSearchScreen> {
  final double spacing = 8.0;

  List<MuscleGroup> filterByMuscleGroup = [];
  List<ExerciseTool> filterByTool = [];

  // ExerciseFilter filter = .empty();

  List<String> selectedIds = [];

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final screen = MediaQuery.sizeOf(context);
    return BlocListener<ItemsEditBloc, ItemsEditState>(
      listener: (context, state) {
        if (state is ItemsEditLoadedState) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("${widget.dayName}: ${selectedIds.length + widget.presentExerciseIds.length}"),
          actions: [
            IconButton(
              icon: const Icon(Icons.done_all_rounded),
              color: Theme.of(context).colorScheme.primary,
              onPressed: () {
                final list = context.read<ExercisesV2Bloc>().selectedExercises;
                context.read<ItemsEditBloc>().add(AddRoutineItemsEvent(dayId: widget.dayId, items: list));
              },
            ),
            Builder(
              builder: (context) =>
                  IconButton(onPressed: Scaffold.of(context).openEndDrawer, icon: const Icon(Icons.filter_alt_rounded)),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size(screen.width, 15),
            child: BlocBuilder<LibSyncCubit, LibSyncState>(
              builder: (context, state) => state.when(
                initial: () => const SizedBox(),
                syncing: () => const LoadingIndicator(
                  size: Size(15, 15),
                  padding: 0,
                  backgroundColor: Colors.transparent,
                  elevated: false,
                  strokeWidth: 1,
                  strokeCap: .round,
                ),
                success: (total) => Row(
                  spacing: 5,
                  mainAxisAlignment: .center,
                  children: [
                    Text(total.toString(), style: const TextStyle(fontSize: 10)),
                    const Icon(Icons.done, color: Colors.green, size: 15),
                  ],
                ),
                failure: (failure) => Row(
                  spacing: 5,
                  mainAxisAlignment: .center,
                  children: [
                    ...failure.when(
                      libOffline: (currentTotalCount) => [
                        Text(currentTotalCount.toString(), style: const TextStyle(fontSize: 10)),
                        const Icon(Icons.wifi_off_rounded, color: Colors.blue, size: 15),
                      ],
                      libNotFound: (currentTotalCount) => [
                        const Text('0', style: TextStyle(fontSize: 10)),
                        const Icon(Icons.question_mark_rounded, color: Colors.amber, size: 15),
                      ],
                      libUnknown: (currentTotalCount) => [
                        Text(currentTotalCount.toString(), style: const TextStyle(fontSize: 10)),
                        const Icon(Icons.close, color: Colors.red, size: 15),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        endDrawer: Drawer(
          child: BlocBuilder<ExerciseFilterCubit, ExerciseFilterState>(
            builder: (context, filterState) {
              final state = filterState as AvailableExercisesFilter;
              return SingleChildScrollView(
                padding: .only(
                  top: MediaQuery.of(context).padding.top,
                  bottom: MediaQuery.of(context).padding.bottom,
                  left: 15,
                  right: 15,
                ),
                child: Column(
                  children: [
                    Text(locale.selectFilter),
                    Wrap(
                      alignment: .center,
                      children: [
                        for (final fg in state.filter.groups) ...[
                          FilterChip(
                            label: Text(fg.muscleGroupName),
                            selected: filterByMuscleGroup.contains(fg),
                            onSelected: (selected) {
                              selected ? filterByMuscleGroup.add(fg) : filterByMuscleGroup.remove(fg);
                              setState(() {});
                            },
                          ),
                          const SizedBox(width: 10),
                        ],
                      ],
                    ),

                    Wrap(
                      alignment: .center,
                      children: [
                        for (final ft in state.filter.tools) ...[
                          FilterChip(
                            label: Text(ft.toolName),
                            selected: filterByTool.contains(ft),
                            onSelected: (selected) {
                              selected ? filterByTool.add(ft) : filterByTool.remove(ft);
                              setState(() {});
                            },
                          ),
                          const SizedBox(width: 10),
                        ],
                      ],
                    ),
                    const Divider(),
                    Row(
                      spacing: 5,
                      mainAxisAlignment: .spaceEvenly,
                      children: [
                        Expanded(
                          child: FilledButton(
                            style: FilledButton.styleFrom(foregroundColor: Colors.white),
                            onPressed: () {
                              context.read<ExercisesV2Bloc>().add(
                                GetExercisesByFilterEvent(
                                  filter: ExerciseFilter(groups: filterByMuscleGroup, tools: filterByTool),
                                ),
                              );
                              Scaffold.of(context).closeEndDrawer();
                            },
                            child: Text(locale.apply),
                          ),
                        ),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              context.read<ExercisesV2Bloc>().add(GetExercisesByFilterEvent(filter: .empty()));
                              WidgetsBinding.instance.addPostFrameCallback(
                                (_) => setState(() {
                                  filterByMuscleGroup.clear();
                                  filterByTool.clear();
                                }),
                              );
                            },
                            child: Text(locale.reset),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        body: BlocBuilder<ExercisesV2Bloc, ExercisesV2State>(
          builder: (context, state) {
            if (state is ExercisesV2LoadedState) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.8,
                  crossAxisCount: 2,
                  mainAxisSpacing: spacing,
                  crossAxisSpacing: spacing,
                ),
                padding: EdgeInsets.only(
                  top: spacing,
                  left: spacing,
                  right: spacing,
                  bottom: MediaQuery.of(context).padding.bottom + (screen.height * .1),
                ),
                itemCount: state.list.length,
                itemBuilder: (context, index) {
                  final isPresent = widget.presentExerciseIds.contains(state.list[index].apiId);
                  return Stack(
                    children: [
                      ExerciseGridWidget(
                        isSelected: isPresent || selectedIds.contains(state.list[index].apiId),
                        exercise: state.list[index],
                        index: index,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: const Color.fromARGB(30, 158, 158, 158),
                          highlightColor: const Color.fromARGB(30, 158, 158, 158),
                          borderRadius: BorderRadius.circular(15.0),
                          onTap: isPresent
                              ? null
                              : () {
                                  if (!selectedIds.contains(state.list[index].apiId)) {
                                    // -------------------------------------------------
                                    // Add exercise here and parent widget and notify
                                    selectedIds.add(state.list[index].apiId);
                                    // onSelect(state.list[index], false);
                                    BlocProvider.of<ExercisesV2Bloc>(context).add(
                                      AddOrRemoveExerciseEvent(
                                        exerciseV2: state.list[index],
                                        isAdd: true,
                                        all: state.list,
                                      ),
                                    );

                                    // -------------------------------------------------
                                  } else {
                                    // -------------------------------------------------
                                    // Remove exercise here and parent widget and notify
                                    selectedIds.remove(state.list[index].apiId);
                                    // onSelect(state.list[index], true);
                                    BlocProvider.of<ExercisesV2Bloc>(context).add(
                                      AddOrRemoveExerciseEvent(
                                        exerciseV2: state.list[index],
                                        isAdd: false,
                                        all: state.list,
                                      ),
                                    );
                                    // -------------------------------------------------
                                  }
                                  setState(() {});
                                },
                          child: const SizedBox.expand(),
                        ),
                      ),
                      if (isPresent)
                        Positioned(
                          top: 10.0,
                          right: 10.0,
                          child: Icon(Icons.done, size: 20, color: Theme.of(context).colorScheme.secondary),
                        ),
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
                              builder: (context) => ExerciseDetailsScreen(exerciseId: state.list[index].apiId),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            } else if (state is ExercisesV2ErrorState) {
              return Center(child: Text(locale.errNoInternet));
            }
            return const LoadingIndicator();
          },
        ),
      ),
    );
  }
}
