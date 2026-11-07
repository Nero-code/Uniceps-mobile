import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_tool.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';
import 'package:uniceps/app/presentation/routine/blocs/exercises_v2/exercises_v2_bloc.dart';
import 'package:uniceps/app/presentation/routine/blocs/items_edit/items_edit_bloc.dart';
import 'package:uniceps/app/presentation/routine/screens/exercise_details_screen.dart';
import 'package:uniceps/app/presentation/routine/widgets/exercise_filter_drawer.dart';
import 'package:uniceps/app/presentation/routine/widgets/exercise_grid_widget.dart';
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
  Map<String, String> filterByMuscleHead = {};

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
            Builder(
              builder: (context) => IconButton(
                onPressed: Scaffold.of(context).openEndDrawer,
                icon: const Icon(Icons.filter_list),
                style: IconButton.styleFrom(backgroundColor: Colors.black12),
              ),
            ),
          ],
        ),
        endDrawer: ExerciseFilterDrawer(
          initialMuscleGroups: filterByMuscleGroup,
          initialTools: filterByTool,
          initialMuscleHeads: filterByMuscleHead,
          onApply: (groups, tools, heads) => setState(() {
            filterByMuscleGroup = groups;
            filterByTool = tools;
            filterByMuscleHead = heads;
          }),
        ),
        body: BlocBuilder<ExercisesV2Bloc, ExercisesV2State>(
          builder: (context, state) {
            if (state is ExercisesV2LoadedState) {
              return Stack(
                children: [
                  GridView.builder(
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
                  ),
                  Positioned(
                    bottom: 0,
                    width: screen.width,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: InkWell(
                        // borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          final list = context.read<ExercisesV2Bloc>().selectedExercises;
                          context.read<ItemsEditBloc>().add(AddRoutineItemsEvent(dayId: widget.dayId, items: list));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 5,
                          children: [
                            const Icon(Icons.done_all_rounded, color: Colors.white),
                            Text(
                              locale.add,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
