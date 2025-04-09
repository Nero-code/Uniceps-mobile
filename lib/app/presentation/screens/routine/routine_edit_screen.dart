import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';
import 'package:uniceps/app/presentation/blocs/routine_edit/days_edit_bloc.dart';
import 'package:uniceps/app/presentation/dialogs/days_sorting_dialog.dart';
import 'package:uniceps/app/presentation/screens/loading_page.dart';
import 'package:uniceps/app/presentation/screens/routine/exercises_selection_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/app/presentation/screens/routine/sets_edit_screen.dart';
import 'package:uniceps/app/presentation/screens/routine/widgets/routine_item_horizontal_widget.dart';
import 'package:uniceps/app/presentation/screens/routine/widgets/routine_item_vertical_widget.dart';
import 'package:uniceps/core/widgets/error_widget.dart';
import 'package:uniceps/core/widgets/reload_widget.dart';
import 'package:uniceps/injection_dependency.dart' as di;

class RoutineEditScreen extends StatefulWidget {
  const RoutineEditScreen({super.key, required this.routineId});

  final int routineId;

  @override
  State<RoutineEditScreen> createState() => _RoutineEditScreenState();
}

class _RoutineEditScreenState extends State<RoutineEditScreen>
    with TickerProviderStateMixin {
  var days = List.generate(
    5,
    (index) => RoutineDay(
        id: null,
        apiId: null,
        routineId: 0,
        name: "day $index",
        index: index,
        exercises: [],
        version: 0,
        isSynced: false),
  );

  TabController? tabController;
  final panelController = PanelController();
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tabController?.dispose();
    tabController = TabController(length: days.length + 1, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController?.dispose();
  }

  void _reorderDays() async {
    await showDialog(
      context: context,
      builder: (context) => DaysSortingDialog(
        days: days,
        onReorder: (sorted) {
          // days = sorted;
          // setState(() {});
          context.read<DaysEditBloc>().add(ReorderDaysEvent(newOrder: sorted));
        },
      ),
    );
  }

  void _deleteDay(int index) async {
    days.removeAt(index);
    if (selectedIndex > index) --selectedIndex;
    tabController?.dispose();
    tabController = TabController(
        length: days.length + 1, vsync: this, initialIndex: selectedIndex);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    // final screenSize = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) => DaysEditBloc()..add(GetDaysEvent(routineId: 0)),
      child: BlocBuilder<DaysEditBloc, DaysEditState>(
        builder: (context, state) {
          if (state is DaysEditLoadedState) {
            tabController?.dispose();
            tabController =
                TabController(length: state.days.length + 1, vsync: this);
          }
          return Scaffold(
            appBar: AppBar(
                title: const Text("Routines"),
                actions: [
                  IconButton(
                    tooltip: "reorder days",
                    onPressed: _reorderDays,
                    icon: const Icon(Icons.sort_rounded),
                  ),
                  // IconButton(
                  //   tooltip: "insert routine",
                  //   onPressed: () {},
                  //   icon: const Icon(Icons.import_export_rounded),
                  // ),
                ],
                bottom: state is DaysEditLoadedState
                    ? TabBar(
                        controller: tabController,
                        splashBorderRadius: BorderRadius.circular(5),
                        isScrollable: true,
                        padding: EdgeInsets.zero,
                        tabAlignment: TabAlignment.start,
                        onTap: (index) {
                          if (index == selectedIndex) {
                            showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                title: Text("yo"),
                              ),
                            );
                          } else {
                            selectedIndex = index;
                          }
                        },
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 5.0),
                        tabs: [
                          ...state.days.map(
                            (day) => Tab(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: IconButton(
                                      onPressed: () => context
                                          .read<DaysEditBloc>()
                                          .add(RemoveDayEvent(day: day)),
                                      iconSize: 18,
                                      splashRadius: 15,
                                      padding: EdgeInsets.zero,
                                      icon: const Icon(Icons.close_rounded),
                                    ),
                                  ),
                                  const SizedBox(width: 5.0),
                                  Text("${local?.days}: ${day.name}"),
                                ],
                              ),
                            ),
                          ),
                          SizedBox.square(
                            dimension: 50,
                            child: IconButton(
                                onPressed: () => context
                                    .read<DaysEditBloc>()
                                    .add(AddDayEvent()),
                                icon: const Icon(Icons.add)),
                          ),
                        ],
                      )
                    : null),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ExercisesSelectionScreen(),
                ),
              ),
            ),
            body: BlocBuilder<DaysEditBloc, DaysEditState>(
              builder: (context, state) {
                if (state is DaysEditLoadedState) {
                  return TabBarView(
                    controller: tabController,
                    children: [
                      ...days.map(
                        (day) => Column(
                          children: [
                            Expanded(
                              flex: 9,
                              child: ListView(
                                padding: const EdgeInsets.all(10.0),
                                children: day.exercises
                                    .map(
                                      (e) => false
                                          ? InkWell(
                                              onTap: () {},
                                              child: RoutineItemVerticalWidget(
                                                  item: e),
                                            )
                                          : InkWell(
                                              onTap: () async {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          SetsEditScreen(
                                                              exerciseName:
                                                                  e.toString()),
                                                    ));
                                              },
                                              child:
                                                  RoutineItemHorizontalWidget(
                                                      item: e),
                                            ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(),
                    ],
                  );
                } else if (state is DaysEditErrorState) {
                  return ReloadScreenWidget(
                      f: state.failure,
                      callBack: () => context.read<DaysEditBloc>().add(
                            GetDaysEvent(routineId: widget.routineId),
                          ));
                }
                return LoadingPage();
              },
            ),
          );
        },
      ),
    );
  }
}
