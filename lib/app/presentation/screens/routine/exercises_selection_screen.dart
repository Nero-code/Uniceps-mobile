import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';
import 'package:uniceps/app/presentation/blocs/exercises_v2/exercises_v2_bloc.dart';
import 'package:uniceps/app/presentation/blocs/exercises_v2/muscle_group_bloc.dart';
import 'package:uniceps/app/presentation/screens/loading_page.dart';
import 'package:uniceps/app/presentation/screens/routine/exercises_list_tab.dart';
import 'package:uniceps/injection_dependency.dart';

class ExercisesSelectionScreen extends StatefulWidget {
  const ExercisesSelectionScreen({super.key});

  @override
  State<ExercisesSelectionScreen> createState() =>
      _ExercisesSelectionScreenState();
}

class _ExercisesSelectionScreenState extends State<ExercisesSelectionScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  // var groups = <MuscleGroup>[];

  // final trSections = [
  //   const MuscleGroup(apiId: 4, enGroupName: "Legs", arGroupName: "أرجل"),
  //   const MuscleGroup(
  //       apiId: 7, enGroupName: "Calves", arGroupName: "بطة الرجل"),
  //   const MuscleGroup(apiId: 1, enGroupName: "Chest", arGroupName: "صدر"),
  //   const MuscleGroup(apiId: 3, enGroupName: "Back", arGroupName: "ظهر"),
  //   const MuscleGroup(apiId: 2, enGroupName: "Shoulder", arGroupName: "أكتاف"),
  //   const MuscleGroup(apiId: 5, enGroupName: "Biceps", arGroupName: "باي"),
  //   const MuscleGroup(apiId: 6, enGroupName: "Triceps", arGroupName: "تراي"),
  //   const MuscleGroup(apiId: 8, enGroupName: "Abs", arGroupName: "معدة"),
  // ];

  @override
  void initState() {
    super.initState();
    // groups = trSections;
    _tabController = TabController(length: 0, vsync: this);
  }

  Map<MuscleGroup, List<ExerciseV2>> lists = {};
  List<ExerciseV2> allExercises = [];
  List<ExerciseV2> selectedExercises = [];

  Future<Map<MuscleGroup, List<ExerciseV2>>> getExercisesFiltered() async {
    // if (lists.isNotEmpty) return lists;
    // print("started Future");

    // final m = jsonDecode(exercisesJson) as List<dynamic>;

    // for (var i in m) {
    //   allExercises.add(ExerciseV2Model.fromJson(i));
    // }
    // final List<ExerciseV2> filteredEx = [];
    // for (var g in trSections) {
    //   var item = allExercises.where((e) => e.muscleGroup.id == g.id);
    //   // print("found item: ${item.id} : ${item.muscleGroup}");
    //   filteredEx.addAll(item);
    //   print("filteredExercises: ${filteredEx.length}");
    //   filteredEx.where((i) {
    //     // print("filteredEx items: $i");
    //     return false;
    //   });
    //   lists.addAll({g: List.from(filteredEx)});
    //   // print("litsts: ${lists.length}");
    //   filteredEx.clear();
    // }
    // print("finished Future");
    return lists;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MuscleGroupBloc, MuscleGroupState>(
      builder: (context, state) {
        if (state is MuscleGroupLoadedState) {
          _tabController.dispose();
          _tabController =
              TabController(length: state.groups.length, vsync: this);
          return Scaffold(
            appBar: AppBar(
              title: const Text("exercises"),
              bottom: TabBar(
                tabAlignment: TabAlignment.start,
                controller: _tabController,
                isScrollable: true,
                tabs: [
                  ...state.groups.map((group) => Tab(text: group.arGroupName))
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              heroTag: "exercises FAB",
              backgroundColor: Theme.of(context).colorScheme.secondary,
              onPressed: () => Navigator.pop(context,
                  selectedExercises.isEmpty ? null : selectedExercises),
              child: const Icon(Icons.done),
            ),
            body: TabBarView(
              controller: _tabController,
              children: state.groups
                  .map((group) => BlocProvider(
                        create: (context) => ExercisesV2Bloc(commands: sl())
                          ..add(GetExercisesByFilterEvent(filter: group)),
                        child: ExercisesListTab(
                          muscleGroup: group,
                          onSelect: (exercise, isSelected) {
                            isSelected
                                ? selectedExercises.remove(exercise)
                                : selectedExercises.add(exercise);
                          },
                        ),
                      ))
                  .toList(),
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
