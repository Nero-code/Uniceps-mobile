import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/data/models/training_models/exercise_v2_model.dart';
import 'package:uniceps/app/domain/classes/routine_classes/exercise_v2.dart';
import 'package:uniceps/app/domain/classes/routine_classes/muscle_group.dart';
import 'package:uniceps/app/presentation/blocs/exercises_v2/exercises_v2_bloc.dart';
import 'package:uniceps/app/presentation/blocs/exercises_v2/muscle_group_bloc.dart';
import 'package:uniceps/app/presentation/screens/routine/exercises_list_tab.dart';
import 'package:uniceps/core/fakes/exercises_json.dart';

class ExercisesSelectionScreen extends StatefulWidget {
  const ExercisesSelectionScreen({super.key});

  @override
  State<ExercisesSelectionScreen> createState() =>
      _ExercisesSelectionScreenState();
}

class _ExercisesSelectionScreenState extends State<ExercisesSelectionScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  var groups = <MuscleGroup>[];

  final trSections = [
    const MuscleGroup(enGroupName: "Legs", arGroupName: "أرجل", id: 4),
    const MuscleGroup(enGroupName: "Calves", arGroupName: "بطة الرجل", id: 7),
    const MuscleGroup(enGroupName: "Chest", arGroupName: "صدر", id: 1),
    const MuscleGroup(enGroupName: "Back", arGroupName: "ظهر", id: 3),
    const MuscleGroup(enGroupName: "Shoulder", arGroupName: "أكتاف", id: 2),
    const MuscleGroup(enGroupName: "Biceps", arGroupName: "باي", id: 5),
    const MuscleGroup(enGroupName: "Triceps", arGroupName: "تراي", id: 6),
    const MuscleGroup(enGroupName: "Abs", arGroupName: "معدة", id: 8),
  ];

  @override
  void initState() {
    super.initState();
    groups = trSections;
    _tabController = TabController(length: groups.length, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tabController.dispose();
    _tabController = TabController(length: groups.length, vsync: this);
  }

  Map<MuscleGroup, List<ExerciseV2>> lists = {};
  List<ExerciseV2> allExercises = [];
  List<ExerciseV2> selectedExercises = [];

  Future<Map<MuscleGroup, List<ExerciseV2>>> getExercisesFiltered() async {
    if (lists.isNotEmpty) return lists;
    print("started Future");

    final m = jsonDecode(exercisesJson) as List<dynamic>;

    for (var i in m) {
      allExercises.add(ExerciseV2Model.fromJson(i));
    }
    final List<ExerciseV2> filteredEx = [];
    for (var g in trSections) {
      var item = allExercises.where((e) => e.muscleGroup.id == g.id);
      // print("found item: ${item.id} : ${item.muscleGroup}");
      filteredEx.addAll(item);
      print("filteredExercises: ${filteredEx.length}");
      filteredEx.where((i) {
        // print("filteredEx items: $i");
        return false;
      });
      lists.addAll({g: List.from(filteredEx)});
      // print("litsts: ${lists.length}");
      filteredEx.clear();
    }
    print("finished Future");
    return lists;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                MuscleGroupBloc()..add(GetMuscleGroupsEvent())),
        BlocProvider(create: (context) => ExercisesV2Bloc()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("exercises"),
          bottom: TabBar(
            tabAlignment: TabAlignment.start,
            controller: _tabController,
            isScrollable: true,
            tabs: [...groups.map((group) => Tab(text: group.arGroupName))],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pop(context, selectedExercises),
          child: const Icon(Icons.done),
        ),
        body: FutureBuilder<Map<MuscleGroup, List<ExerciseV2>>>(
          future: getExercisesFiltered(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const SizedBox();
            }
            return TabBarView(
              controller: _tabController,
              children: snapshot.hasData
                  ? snapshot.data!.keys
                      .map((group) => ExercisesListTab(
                            list: snapshot.data![group]!,
                            onSelect: (exercise, isSelected) {
                              isSelected
                                  ? selectedExercises.remove(exercise)
                                  : selectedExercises.add(exercise);
                            },
                          ))
                      .toList()
                  : [
                      // ...groups.map((group) =>
                      //     Text("${group.groupName}: ${snapshot.error}")),
                    ],
            );
          },
        ),
      ),
    );
  }
}
