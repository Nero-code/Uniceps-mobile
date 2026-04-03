import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/routine/blocs/exercises_v2/muscle_group_bloc.dart';
import 'package:uniceps/app/presentation/routine/blocs/exercises_v2_selection/exercises_v2_selection_cubit.dart';
import 'package:uniceps/app/presentation/routine/blocs/items_edit/items_edit_bloc.dart';
import 'package:uniceps/app/presentation/routine/pages/exercises_list_tab.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class ExercisesViewerScreen extends StatefulWidget {
  const ExercisesViewerScreen({
    super.key,
    required this.presentExerciseIds,
    required this.dayName,
    required this.dayId,
  });

  final List<String> presentExerciseIds;
  final String dayName;
  final int dayId;

  @override
  State<ExercisesViewerScreen> createState() => _ExercisesViewerScreenState();
}

class _ExercisesViewerScreenState extends State<ExercisesViewerScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 0, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return BlocListener<ItemsEditBloc, ItemsEditState>(
      listenWhen: (previous, current) => /*previous is ItemsDownloadingState &&*/ current is ItemsEditLoadedState,
      listener: (context, state) => Navigator.pop(context),
      child: BlocBuilder<MuscleGroupBloc, MuscleGroupState>(
        builder: (context, state) {
          if (state is MuscleGroupLoadedState) {
            _tabController.dispose();
            _tabController = TabController(length: state.groups.length, vsync: this);
            return BlocProvider(
              create: (context) => ExercisesV2SelectionCubit(),
              lazy: false,
              child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: BlocBuilder<ExercisesV2SelectionCubit, ExercisesV2SelectionState>(
                    builder: (context, state) {
                      // return Text(
                      //     "${selected.isEmpty ? "Exercises" : selected.length}");
                      return Text("${widget.dayName}: ${state.selected.length + widget.presentExerciseIds.length}");
                    },
                  ),
                  actions: [
                    BlocBuilder<ExercisesV2SelectionCubit, ExercisesV2SelectionState>(
                      builder: (context, state) {
                        return IconButton(
                          onPressed: () async {
                            context.read<ItemsEditBloc>().add(
                              AddRoutineItemsEvent(dayId: widget.dayId, items: state.selected),
                            );
                          },
                          icon: Icon(Icons.done_all_rounded),
                          color: Theme.of(context).colorScheme.primary,
                        );
                      },
                    ),
                  ],
                  bottom: TabBar(
                    tabAlignment: TabAlignment.start,
                    controller: _tabController,
                    isScrollable: true,
                    tabs: [...state.groups.map((group) => Tab(text: group.muscleGroupName))],
                  ),
                ),
                body: TabBarView(
                  controller: _tabController,
                  children: state.groups
                      .map(
                        (group) => Builder(
                          builder: (context) {
                            return ExercisesListTab(
                              presentExId: widget.presentExerciseIds,
                              muscleGroup: group,
                              canSelect: true,
                              onSelect: (exercise, isSelected) {
                                isSelected
                                    ? BlocProvider.of<ExercisesV2SelectionCubit>(context).deselectExersice(exercise)
                                    : BlocProvider.of<ExercisesV2SelectionCubit>(context).selectExercise(exercise);
                              },
                            );
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            );
          } else if (state is MuscleGroupErrorState) {
            return Scaffold(body: Center(child: Text(locale.errNoInternet)));
          }
          return const Scaffold(body: LoadingIndicator());
        },
      ),
    );
  }
}
