import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:uniceps/app/data/models/routine_models/extensions.dart' as ext;
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';
import 'package:uniceps/app/presentation/blocs/routine_edit/days_edit_bloc.dart';
import 'package:uniceps/app/presentation/blocs/routine_edit/items_edit_bloc.dart';
import 'package:uniceps/app/presentation/blocs/routine_edit/sets_edit_bloc.dart';
import 'package:uniceps/app/presentation/screens/loading_page.dart';
import 'package:uniceps/app/presentation/screens/routine/dialogs/day_add_dialog.dart';
import 'package:uniceps/app/presentation/screens/routine/dialogs/day_delete_dialog.dart';
import 'package:uniceps/app/presentation/screens/routine/dialogs/day_edit_flaoting_menu.dart';
import 'package:uniceps/app/presentation/screens/routine/dialogs/days_sorting_dialog.dart';
import 'package:uniceps/app/presentation/screens/routine/dialogs/rename_day_dialog.dart';
import 'package:uniceps/app/presentation/screens/routine/exercises_selection_screen.dart';
import 'package:uniceps/app/presentation/screens/routine/routine_edit_items_tab.dart';
import 'package:uniceps/app/presentation/screens/routine/widgets/day_tab_widget.dart';
import 'package:uniceps/core/extensions.dart';
import 'package:uniceps/core/widgets/error_widget.dart';
import 'package:uniceps/injection_dependency.dart' as di;

class RoutineEditScreen extends StatefulWidget {
  const RoutineEditScreen(
      {super.key, required this.routineId, required this.routineName});

  final int routineId;
  final String routineName;

  @override
  State<RoutineEditScreen> createState() => _RoutineEditScreenState();
}

class _RoutineEditScreenState extends State<RoutineEditScreen>
    with TickerProviderStateMixin {
  final tabController = ScrollController();
  final pageController = PageController();
  final overlayController = OverlayPortalController();
  final panelController = PanelController();

  // final List<String> _tabs = ["1", "2", "3"];
  List<RoutineDay> days = [];

  int selectedIndex = 0;

  RoutineDay? selectedDay, currentDay;
  Rect? pos;

  int? routineItemId;
  RoutineItem? selectedExercise;

  Future<int?> showAnimatedOverlay(BuildContext context, Size screenSize) {
    OverlayState overlayState = Overlay.of(context);

    final future = Completer<int?>();

    // Create an AnimationController and OverlayEntry
    AnimationController controller = AnimationController(
      vsync: this, // Use a TickerProvider for animations
      duration: Durations.medium4,
    );

    Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );

    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (ocontext) => Stack(
        children: [
          GestureDetector(
            onTap: () async {
              future.complete(null);
              await controller.reverse();
              overlayEntry?.remove();
            },
            child: SizedBox(
              width: screenSize.width,
              height: screenSize.height,
              child: const ColoredBox(color: Colors.transparent),
            ),
          ),
          Positioned(
            top: pos!.bottom + 10,
            left: pos!.left <= screenSize.width * 0.5 ? pos!.left + 10 : null,
            right: pos!.left > screenSize.width * 0.5
                ? (screenSize.width - pos!.right)
                : null,
            child: AnimatedBuilder(
              animation: animation,
              builder: (bcontext, child) =>
                  SizeTransition(sizeFactor: animation, child: child),
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                child: DayEditFlaotingMenu(
                  onEdit: () async {
                    future.complete(0);
                    await controller.reverse();
                    overlayEntry?.remove();
                  },
                  onReorder: () async {
                    future.complete(1);
                    await controller.reverse();
                    overlayEntry?.remove();
                  },
                  onRemove: () async {
                    future.complete(2);
                    await controller.reverse();
                    overlayEntry?.remove();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );

    // Insert the overlay
    overlayState.insert(overlayEntry);

    // Start the animation
    controller.forward();

    // Return result
    return future.future;
  }

  void _addDay(String initialName, void Function(String name) onAdd) async {
    await showDialog<String>(
      context: context,
      builder: (context) => DayAddDialog(
        initialName: initialName,
        onDone: onAdd,
      ),
    );
  }

  void _renameDay(void Function(RoutineDay renamed) onSubmit) async {
    await showDialog(
      context: context,
      builder: (_) => RenameDayDialog(
        oldDay: selectedDay!,
        onSubmit: onSubmit,
      ),
    );
  }

  void _reorderDays(void Function(List<RoutineDay> sortedDays) onReorder,
      List<RoutineDay> days) async {
    await showDialog<List<RoutineDay>>(
      context: context,
      builder: (dialogContext) => DaysSortingDialog(
        days: days,
        onReorder: onReorder,
      ),
    );
  }

  void _deleteDay(void Function(RoutineDay toDelete) onDelete) async {
    if (selectedDay == null) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Could not find specified day")));
    }
    await showDialog(
      context: context,
      builder: (context) => DayDeleteDialog(
        dayToDelete: selectedDay!,
        onPositive: onDelete,
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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => DaysEditBloc(commands: di.sl())
              ..add(GetDaysEvent(routineId: widget.routineId))),
        BlocProvider(create: (context) => ItemsEditBloc(commands: di.sl())),
        BlocProvider(create: (context) => SetsEditBloc()),
      ],
      child: Stack(
        children: [
          ScaffoldMessenger(
            child: Scaffold(
              appBar: AppBar(
                title: Text(widget.routineName),
                backgroundColor: Theme.of(context).colorScheme.surface,
              ),
              floatingActionButton:
                  BlocSelector<DaysEditBloc, DaysEditState, List<RoutineDay>>(
                selector: (state) =>
                    state is DaysEditLoadedState ? state.days : [],
                builder: (context, days) {
                  if (days.isNotEmpty) {
                    return FloatingActionButton(
                      heroTag: "DaysEdit FAB",
                      onPressed: () async {
                        final res = await Navigator.push<List<ExerciseV2>>(
                            context,
                            MaterialPageRoute(
                              builder: (c) => const ExercisesSelectionScreen(),
                            ));
                        if (res == null) {
                          if (context.mounted) {
                            showSnack(const Text("no items selected"), context);
                          }
                          return;
                        }
                        if (context.mounted) {
                          BlocProvider.of<ItemsEditBloc>(context).add(
                            AddRoutineItemsEvent(
                                dayId: days[selectedIndex].id!,
                                items: res
                                    .map(
                                      (e) => e.toModel(
                                        days[selectedIndex].id!,
                                        res.indexOf(e),
                                      ),
                                    )
                                    .toList()),
                          );
                        }
                      },
                      child: const Icon(
                        Icons.add,
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
              body: Stack(
                children: [
                  BlocBuilder<DaysEditBloc, DaysEditState>(
                    builder: (context, state) {
                      if (state is DaysEditLoadedState) {
                        // if (state is DaysEditInitial) {
                        //   BlocProvider.of<DaysEditBloc>(context)
                        //       .add(GetDaysEvent(routineId: widget.routineId));
                        //   return const SizedBox();
                        // }
                        print("days state type: ${state.runtimeType}");

                        print("days state length: ${state.days.length}");

                        if (currentDay == null) {
                          for (final day in state.days) {
                            if (day.index == selectedIndex) {
                              currentDay = day;
                            }
                          }
                        }
                        return Column(
                          children: [
                            //
                            //  T A B - B A R
                            //
                            Container(
                              color: Theme.of(context).colorScheme.surface,
                              width: screenSize.width,
                              height: screenSize.height * 0.06,
                              child: ListView(
                                controller: tabController,
                                scrollDirection: Axis.horizontal,
                                children: [
                                  ...state.days.map(
                                    (day) => DayTabWidget(
                                      globalKey: GlobalKey(),
                                      tab: day.name,
                                      isSelected: day.index == selectedIndex,
                                      onTap: () {
                                        selectedIndex = day.index;
                                        pageController.animateToPage(day.index,
                                            duration: Durations.medium4,
                                            curve: Curves.fastOutSlowIn);
                                        setState(() {});
                                      },
                                      onLongPress: (widgetKey) async {
                                        pos = widgetKey.globalPaintBounds;
                                        selectedDay = day;

                                        final res = await showAnimatedOverlay(
                                            context, screenSize);
                                        if (res == null) return;

                                        switch (res) {
                                          case 0: // edit
                                            _renameDay(
                                              (renamedDay) =>
                                                  BlocProvider.of<DaysEditBloc>(
                                                          context)
                                                      .add(RenameDayEvent(
                                                          day: renamedDay)),
                                            );
                                            break;
                                          case 1: // reorder
                                            _reorderDays(
                                              (sortedDays) {
                                                print(
                                                    "Added Event: DaysReorder");
                                                BlocProvider.of<DaysEditBloc>(
                                                        context)
                                                    .add(ReorderDaysEvent(
                                                        newOrder: sortedDays,
                                                        version:
                                                            state.version + 1));
                                              },
                                              state.days,
                                            );
                                            break;
                                          case 2: // remove
                                            _deleteDay(
                                              (deleted) =>
                                                  BlocProvider.of<DaysEditBloc>(
                                                          context)
                                                      .add(RemoveDayEvent(
                                                          day: deleted)),
                                            );
                                            break;
                                          default:
                                        }

                                        print(res);
                                      },
                                    ),
                                  ),
                                  IconButton(
                                    iconSize: 20,
                                    splashRadius: 20,
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      _addDay(
                                        "day ${state.days.length}",
                                        (name) => BlocProvider.of<DaysEditBloc>(
                                                context)
                                            .add(
                                          AddDayEvent(
                                            day: RoutineDay(
                                              routineId: widget.routineId,
                                              name: name,
                                              index: state.days.length,
                                              exercises: [],
                                            ),
                                          ),
                                        ),
                                      );

                                      // BlocProvider.of<DaysEditBloc>(context)
                                      //     .add(AddDayEvent(
                                      //   day: RoutineDay(
                                      //     routineId: widget.routineId,
                                      //     name: "day ${days.length}",
                                      //     index: days.length,
                                      //     exercises: [],
                                      //   ),
                                      // ));
                                    },
                                  ),
                                ],
                              ),
                            ),

                            Expanded(
                                child: PageView(
                              controller: pageController,
                              // itemCount: state.days.length,
                              onPageChanged: (value) => setState(() {
                                selectedIndex = value;

                                tabController.animateTo(
                                    value *
                                        (screenSize.width * 0.5) /
                                        state.days[value].name.length,
                                    duration: Durations.medium4,
                                    curve: Curves.linear);
                              }),
                              // children: state.days
                              //     .map((e) => RoutineItemEditTab(
                              //           dayId: e.id!,
                              //           onItemTap: (itemId) {
                              //             routineItemId = itemId;
                              //             BlocProvider.of<SetsEditBloc>(context)
                              //                 .add(GetSetsforRoutineEvent(
                              //                     itemId: itemId));

                              //             panelController.open();
                              //           },
                              //         ))
                              //     .toList(),
                              children: [
                                for (int i = 0; i < state.days.length; i++)
                                  RoutineItemEditTab(
                                    dayId: state.days[i].id!,
                                    onItemTap: (itemId) {
                                      routineItemId = itemId;
                                      BlocProvider.of<SetsEditBloc>(context)
                                          .add(GetSetsforRoutineEvent(
                                              itemId: itemId));

                                      panelController.open();
                                    },
                                  ),
                              ],
                            )),
                          ],
                        );
                      } else if (state is DaysEditErrorState) {
                        return ErrorScreenWidget(
                          f: state.failure,
                          callback: null,
                        );
                      }
                      return const LoadingPage();
                    },
                  ),
                  // SlidingUpPanel(
                  //     minHeight: 0.0,
                  //     maxHeight: screenSize.height * 0.75,
                  //     controller: panelController,
                  //     borderRadius:
                  //         const BorderRadius.vertical(top: Radius.circular(15)),
                  //     backdropEnabled: true,
                  //     panel: SizedBox()
                  //     // RoutineSetsSheet(routineItemId: , sets: sets, onSave: onSave, onRemove: onRemove)
                  //     // BlocBuilder<SetsEditBloc, SetsEditState>(
                  //     //   builder: (context, state) {
                  //     //     if (state is SetsEditLoadedState) {
                  //     //       return Container(
                  //     //           decoration: const BoxDecoration(
                  //     //               borderRadius: BorderRadius.vertical(
                  //     //                   top: Radius.circular(15))),
                  //     //           child: RoutineSetsSheet(
                  //     //             routineItemId: state.itemId,
                  //     //             sets: state.sets,
                  //     //             onSave: (sets) {},
                  //     //             onRemove: (set) {},
                  //     //           ));
                  //     //     } else if (state is SetsEditErrorState) {
                  //     //       return const ErrorPage();
                  //     //     }
                  //     //     return const LoadingPage();
                  //     //   },
                  //     // ),
                  //     ),
                ],
              ),
            ),
          ),
          SlidingUpPanel(
              minHeight: 0.0,
              maxHeight: screenSize.height * 0.75,
              controller: panelController,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              backdropEnabled: true,
              panel: Scaffold(
                  // body: RoutineSetsSheet(routineItemId: routineItemId),
                  )
              // BlocBuilder<SetsEditBloc, SetsEditState>(
              //   builder: (context, state) {
              //     if (state is SetsEditLoadedState) {
              //       return Container(
              //           decoration: const BoxDecoration(
              //               borderRadius: BorderRadius.vertical(
              //                   top: Radius.circular(15))),
              //           child: RoutineSetsSheet(
              //             routineItemId: state.itemId,
              //             sets: state.sets,
              //             onSave: (sets) {},
              //             onRemove: (set) {},
              //           ));
              //     } else if (state is SetsEditErrorState) {
              //       return const ErrorPage();
              //     }
              //     return const LoadingPage();
              //   },
              // ),
              ),
        ],
      ),
    );
  }
}
