import 'package:flutter/material.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_day.dart';
import 'package:uniceps/app/presentation/dialogs/days_sorting_dialog.dart';
import 'package:uniceps/app/presentation/screens/routine/exercises_selection_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/app/presentation/screens/routine/widgets/routine_item_widget.dart';

class RoutineEditScreen extends StatefulWidget {
  const RoutineEditScreen({super.key, this.routineId});

  final int? routineId;

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
      name: "day $index",
      index: index,
      exercises: [],
    ),
  );

  late TabController tabController;
  int selectedIndex = -1;

  @override
  void initState() {
    print("init state");
    tabController = TabController(length: 1, vsync: this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("didChangeDependecies");
    super.didChangeDependencies();
    tabController.dispose();
    tabController = TabController(length: days.length + 1, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  void _reorderDays() async {
    await showDialog(
      context: context,
      builder: (context) => DaysSortingDialog(
        days: days,
        onReorder: (sorted) {
          days = sorted;
          setState(() {});
        },
      ),
    );
  }

  void _deleteDay(int index) async {
    days.removeAt(index);
    if (selectedIndex > index) --selectedIndex;
    tabController.dispose();
    tabController = TabController(
        length: days.length + 1, vsync: this, initialIndex: selectedIndex);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Routines"),
        actions: [
          IconButton(
            tooltip: "reorder days",
            onPressed: _reorderDays,
            icon: const Icon(Icons.sort_rounded),
          ),
          IconButton(
            tooltip: "insert routine",
            onPressed: () {},
            icon: const Icon(Icons.import_export_rounded),
          ),
        ],
        bottom: TabBar(
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
          labelPadding: const EdgeInsets.symmetric(horizontal: 5.0),
          tabs: [
            ...days.map(
              (day) => Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: IconButton(
                        onPressed: () => _deleteDay(days.indexOf(day)),
                        iconSize: 18,
                        splashRadius: 15,
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.close_rounded),
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    Text("${local.days}: ${day.name}"),
                  ],
                ),
              ),
            ),
            // ...days.map((page) => TextButton(
            //       onPressed: () {},
            //       child: Text("tab $page"),
            //     )),
            SizedBox.square(
              dimension: 50,
              child: IconButton(
                  onPressed: () => setState(() {
                        days.add(
                          RoutineDay(
                            id: null,
                            apiId: null,
                            name: "day ${days.length}",
                            index: days.length,
                            exercises: [],
                          ),
                        );
                        tabController.dispose();
                        tabController = TabController(
                            length: days.length + 1,
                            vsync: this,
                            initialIndex: selectedIndex);
                      }),
                  icon: const Icon(Icons.add)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ExercisesSelectionScreen(),
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          ...days.map(
            (day) => Column(
              children: [
                Expanded(
                  flex: 9,
                  child: ListView(
                    padding: const EdgeInsets.all(10.0),
                    // gridDelegate:
                    //     const SliverGridDelegateWithFixedCrossAxisCount(
                    //   childAspectRatio: 16 / 16,
                    //   crossAxisCount: 2,
                    //   mainAxisSpacing: 8.0,
                    //   crossAxisSpacing: 8.0,
                    // ),
                    children: [0, 1, 2, 3]
                        .map<RoutineItemWidget>((e) => const RoutineItemWidget(
                              exercise: ExerciseV2(
                                  id: null,
                                  apiId: null,
                                  muscleGroup: 1,
                                  name: "name",
                                  imageUrl: "imageUrl",
                                  imageBitMap: null),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
