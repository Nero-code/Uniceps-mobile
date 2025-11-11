import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';
import 'package:uniceps/app/presentation/routine/blocs/exercises_v2/exercises_v2_bloc.dart';
import 'package:uniceps/app/presentation/routine/blocs/exercises_v2/muscle_group_bloc.dart';
import 'package:uniceps/app/presentation/routine/blocs/items_edit/items_edit_bloc.dart';
import 'package:uniceps/app/presentation/routine/screens/exercises_selection_screen.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/app/presentation/routine/widgets/routine_item_horizontal_widget.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/injection_dependency.dart' as di;

class RoutineItemEditTab extends StatefulWidget {
  const RoutineItemEditTab({super.key, required this.dayId, required this.dayName});

  final int dayId;
  final String dayName;

  @override
  State<RoutineItemEditTab> createState() => _RoutineItemEditTabState();
}

class _RoutineItemEditTabState extends State<RoutineItemEditTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final locale = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) =>
          ItemsEditBloc(commands: di.sl(), mediaHelper: di.sl())..add(GetRoutineDayItemsEvent(dayId: widget.dayId)),
      child: BlocBuilder<ItemsEditBloc, ItemsEditState>(
        buildWhen: (previous, current) => current is! ItemsDownloadingState || current is! ItemsEditLoadingState,
        builder: (context, state) {
          if (state is ItemsEditLoadedState) {
            final items = state.items.where((element) => element.dayId == widget.dayId).toList();

            items.sort((a, b) => a.index.compareTo(b.index));

            return Stack(
              children: [
                items.isNotEmpty
                    ? ReorderableListView(
                        buildDefaultDragHandles: true,
                        onReorder: (oldIndex, newIndex) {
                          final list = items;
                          final item = list.removeAt(oldIndex);

                          list.insert(newIndex - (newIndex > oldIndex ? 1 : 0), item);

                          BlocProvider.of<ItemsEditBloc>(context)
                              .add(ReorderRoutineItemsEvent(newOrder: list, version: state.version));
                        },
                        children: [
                          //
                          // R O U T I N E   I T E M
                          //
                          ...items.map((item) => RoutineItemHorizontalWidget(
                                key: ValueKey(item.id!),
                                item: item,
                              )),
                          // ...items.map((item) => RoutineItemVerticalWidget(item: item)),
                          //
                        ],
                      )
                    : Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image(
                              width: MediaQuery.sizeOf(context).width * 0.5,
                              image: const AssetImage(IMG_BLANK),
                            ),
                            const SizedBox(height: 10),
                            Text(locale.emptyRoutineItems),
                          ],
                        ),
                      ),
                Positioned(
                  bottom: 20.0,
                  left: 20.0,
                  child: FloatingActionButton(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    heroTag: "${widget.dayId}",
                    child: const Icon(Icons.add),
                    onPressed: () {
                      final presentItems = items.map((i) => i.exercise.apiId!).toList();
                      Navigator.push<List<ExerciseV2>>(
                          context,
                          MaterialPageRoute(
                            builder: (c) => MultiBlocProvider(
                              providers: [
                                BlocProvider(
                                  create: (context) => MuscleGroupBloc(commands: di.sl())..add(GetMuscleGroupsEvent()),
                                ),
                                BlocProvider(
                                  create: (context) => ExercisesV2Bloc(commands: di.sl()),
                                ),
                                BlocProvider.value(value: context.read<ItemsEditBloc>()),
                              ],
                              child: ExercisesSelectionScreen(
                                dayId: widget.dayId,
                                dayName: widget.dayName,
                                presentExerciseIds: presentItems,
                              ),
                            ),
                          ));
                    },
                  ),
                ),
              ],
            );
          } else if (state is ItemsEditErrorState) {
            return Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(state.failure.getErrorMessage()),
            ));
          }
          return const LoadingIndicator();
        },
      ),
    );
  }

  void showSnack(Widget child, BuildContext context, [Color? backgroundColor]) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: child,
      backgroundColor: backgroundColor,
      showCloseIcon: true,
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
