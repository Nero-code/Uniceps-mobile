import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/blocs/locale/locale_cubit.dart';
import 'package:uniceps/app/presentation/routine/blocs/exercises_v2/muscle_group_bloc.dart';
import 'package:uniceps/app/presentation/routine/blocs/exercises_v2_selection/exercises_v2_selection_cubit.dart';
import 'package:uniceps/app/presentation/routine/blocs/items_edit/items_edit_bloc.dart';
import 'package:uniceps/app/presentation/routine/widgets/progress_widget.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/app/presentation/routine/pages/exercises_list_tab.dart';
import 'package:uniceps/core/constants/constants.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExercisesSelectionScreen extends StatefulWidget {
  const ExercisesSelectionScreen(
      {super.key, required this.presentExerciseIds, required this.dayName, required this.dayId});

  final List<int> presentExerciseIds;
  final String dayName;
  final int dayId;

  @override
  State<ExercisesSelectionScreen> createState() => _ExercisesSelectionScreenState();
}

class _ExercisesSelectionScreenState extends State<ExercisesSelectionScreen> with TickerProviderStateMixin {
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
    final lang = BlocProvider.of<LocaleCubit>(context).state.isRtl();
    return BlocListener<ItemsEditBloc, ItemsEditState>(
      listenWhen: (previous, current) => previous is ItemsDownloadingState && current is ItemsEditLoadedState,
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
                  bottom: TabBar(
                    tabAlignment: TabAlignment.start,
                    controller: _tabController,
                    isScrollable: true,
                    tabs: [
                      ...state.groups.map((group) => Tab(text: group.muscleGroupTranslations[lang ? Lang.ar : Lang.en]))
                    ],
                  ),
                ),
                floatingActionButton: BlocBuilder<ExercisesV2SelectionCubit, ExercisesV2SelectionState>(
                  builder: (context, state) {
                    return FloatingActionButton(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      heroTag: "exercises FAB",
                      onPressed: () async {
                        context
                            .read<ItemsEditBloc>()
                            .add(AddRoutineItemsEvent(dayId: widget.dayId, items: state.selected));
                        showDialog(
                            context: context,
                            builder: (_) => BlocProvider.value(
                                  value: context.read<ItemsEditBloc>(),
                                  child: AlertDialog(
                                    content: BlocConsumer<ItemsEditBloc, ItemsEditState>(
                                      listenWhen: (previous, current) =>
                                          previous is ItemsDownloadingState && current is ItemsEditLoadedState,
                                      listener: (context, state) => Navigator.pop(context),
                                      builder: (context, state) {
                                        return ProgressWidget(
                                            percent: state is ItemsDownloadingState ? state.progress : 0);
                                      },
                                    ),
                                  ),
                                ));
                        // Navigator.pop(context,
                        //   state.selected.isEmpty ? null : state.selected);
                      },
                      child: const Icon(Icons.done),
                    );
                  },
                ),
                body: TabBarView(
                  controller: _tabController,
                  children: state.groups
                      .map((group) => Builder(builder: (context) {
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
          return const Scaffold(body: LoadingIndicator());
        },
      ),
    );
  }
}
