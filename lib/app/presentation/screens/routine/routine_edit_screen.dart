import 'package:flutter/material.dart';
import 'package:uniceps/app/presentation/screens/routine/exercises_selection_screen.dart';
import 'package:uniceps/app/presentation/screens/routine/widgets/exercise_widget.dart';

class RoutineEditScreen extends StatefulWidget {
  const RoutineEditScreen({super.key});

  @override
  State<RoutineEditScreen> createState() => _RoutineEditScreenState();
}

class _RoutineEditScreenState extends State<RoutineEditScreen> {
  final days = List.generate(5, (index) => index);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: days.length + 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Routines"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.import_export_rounded),
            ),
          ],
          bottom: TabBar(
            splashBorderRadius: BorderRadius.circular(5),
            isScrollable: true,
            onTap: (index) => index == days.length
                ? setState(() {
                    days.add(index);
                  })
                : print(index),
            tabs: <Tab>[
              ...days.map((page) => Tab(text: "tab $page")),
              const Tab(icon: Icon(Icons.add)),
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
          children: [
            ...days.map(
              (day) => Column(
                children: [
                  Expanded(
                    flex: 9,
                    child: GridView(
                      padding: const EdgeInsets.all(10.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 16 / 16,
                        crossAxisCount: 2,
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 20.0,
                      ),
                      children: [0, 1, 2, 3]
                          .map<ExerciseWidget>((e) => const ExerciseWidget())
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
