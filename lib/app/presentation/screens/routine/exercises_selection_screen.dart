import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/screens/routine/blocs/exercises_v2/muscle_group_bloc.dart';
import 'package:uniceps/app/presentation/screens/routine/blocs/exercises_v2_selection/exercises_v2_selection_cubit.dart';
import 'package:uniceps/app/presentation/screens/loading_page.dart';
import 'package:uniceps/app/presentation/screens/routine/exercises_list_tab.dart';

class ExercisesSelectionScreen extends StatefulWidget {
  const ExercisesSelectionScreen({super.key});

  @override
  State<ExercisesSelectionScreen> createState() =>
      _ExercisesSelectionScreenState();
}

class _ExercisesSelectionScreenState extends State<ExercisesSelectionScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // groups = trSections;
    _tabController = TabController(length: 0, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MuscleGroupBloc, MuscleGroupState>(
      builder: (context, state) {
        if (state is MuscleGroupLoadedState) {
          _tabController.dispose();
          _tabController =
              TabController(length: state.groups.length, vsync: this);
          return BlocProvider(
            create: (context) => ExercisesV2SelectionCubit(),
            lazy: false,
            child: Scaffold(
              appBar: AppBar(
                title: BlocBuilder<ExercisesV2SelectionCubit,
                    ExercisesV2SelectionState>(
                  builder: (context, state) {
                    // return Text(
                    //     "${selected.isEmpty ? "Exercises" : selected.length}");
                    return Text(state.selected.isEmpty
                        ? "Exercises"
                        : state.selected.length.toString());
                  },
                ),
                bottom: TabBar(
                  tabAlignment: TabAlignment.start,
                  controller: _tabController,
                  isScrollable: true,
                  tabs: [
                    ...state.groups.map((group) => Tab(text: group.arGroupName))
                  ],
                ),
              ),
              floatingActionButton: BlocBuilder<ExercisesV2SelectionCubit,
                  ExercisesV2SelectionState>(
                builder: (context, state) {
                  return FloatingActionButton(
                    heroTag: "exercises FAB",
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    onPressed: () => Navigator.pop(context,
                        state.selected.isEmpty ? null : state.selected),
                    child: const Icon(Icons.done),
                  );
                },
              ),
              body: TabBarView(
                controller: _tabController,
                children: state.groups
                    .map((group) => Builder(builder: (context) {
                          return ExercisesListTab(
                            muscleGroup: group,
                            onSelect: (exercise, isSelected) {
                              isSelected
                                  ? BlocProvider.of<ExercisesV2SelectionCubit>(
                                          context)
                                      .deselectExersice(exercise)
                                  : BlocProvider.of<ExercisesV2SelectionCubit>(
                                          context)
                                      .selectExercise(exercise);
                            },
                          );
                        }))
                    .toList(),
              ),
            ),
          );
        } else if (state is MuscleGroupErrorState) {
          return Scaffold(
            body: Center(child: Text(state.failure.getErrorMessage())),
          );
        }
        return const Scaffold(body: LoadingPage());
      },
    );
  }
}
